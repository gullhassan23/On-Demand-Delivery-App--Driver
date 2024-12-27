import 'dart:async';

import 'package:driverapp/global/functions.dart';
import 'package:driverapp/global/refs.dart';
import 'package:driverapp/global/ui.dart';
import 'package:driverapp/main_screen.dart';
import 'package:driverapp/models/drivers.dart';
import 'package:driverapp/models/settings.dart';
import 'package:driverapp/widgets/buttons.dart';
import 'package:driverapp/widgets/font.dart';
import 'package:driverapp/widgets/loading_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xor_encryption/xor_encryption.dart';

import '../constants/strings.dart';
import '../notification_services.dart';
import '../screens/Registration/signup.dart';

class UserController extends GetxController {
  RxBool isAuth = false.obs;
  Rx<DriverModel> driver = DriverModel().obs;
  Rx<SettingModel> settings = SettingModel().obs;
  final FirebaseAuth auth = FirebaseAuth.instance;
  String get userid => driver.value.id ?? '';

  Future<bool> checkUserLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isAuth.value = prefs.getBool(AppStrings.auth) ?? false;
    if (isAuth.value) {
      String userid = prefs.getString(AppStrings.userid) ?? '';
      await getUserDetails(userid);
    }
    return isAuth.value;
  }

  Future<void> getUserDetails(
    String userId, {
    String password = '',
    bool isAuth = false,
  }) async {
    // Create a StreamController to manage the stream
    // StreamController<DriverModel> controller = StreamController<DriverModel>();

    // Perform Firestore query and handle the data
    driverRef.doc(userId).snapshots().listen((snapshot) async {
      if (snapshot.exists) {
        driver.value = DriverModel.fromMap(snapshot.data()!);
        await getSettings(userId);
        driver.value.password =
            XorCipher().encryptData(password, AppStrings.xorkey);

        if (driver.value.password != password && isAuth == true) {
          await driverRef.doc(userId).update(
            {
              'password': XorCipher().encryptData(password, AppStrings.xorkey),
            },
          );
        }

        // Emit the retrieved user details via the stream
        // controller.add(DriverModel.fromMap(driver as Map<String, dynamic>));
      } else {
        // Handle the case where the data is null or not available
        // Emitting null to indicate absence of user details
        // controller.add(null);
      }
    });

    // return controller.stream;
  }

  updateProfile({
    required String name,
    required String phone,
    required String image,
  }) async {
    driver.value.name = name;
    driver.value.phone = phone;
    driver.value.profile = image;
    print("driver.id.toMap() ${driver.value.id}");

    print("driver.value.toMap() ${driver.value.toMap()}");
    await driverRef.doc(driver.value.id).update(driver.value.toMap());
    await getUserDetails(userid);
    update();
  }
  // Future getUserDetails(
  //   String userid, {
  //   String password = '',
  //   bool isAuth = false,
  // }) async {
  //   await driverRef.doc(userid).get().then((value) async {
  //     if (value.data() != null) {
  //       driver.value = DriverModel.fromMap(value.data()!);
  //       await getSettings(userid);
  //       driver.value.password = XorCipher().encryptData(
  //         password,
  //         AppStrings.xorkey,
  //       );
  //       if (driver.value.password != password && isAuth == true) {
  //         await driverRef.doc(userid).update(
  //           {
  //             'password': XorCipher().encryptData(password, AppStrings.xorkey),
  //           },
  //         );
  //       }
  //     } else {
  //       // Handle the case where the data is null or not available
  //     }
  //   });
  // }

  getSettings(String userid) async {
    String token = await FirebaseMessaging.instance.getToken() ?? '';
    await settingsRef.doc(userid).get().then((value) async {
      if (value.data() == null) {
        settings.value.id = userid;
        await settingsRef.doc(userid).set(settings.value.toMap());
        await settingsRef.doc(userid).get().then((val) {
          settings.value = SettingModel.fromMap(val.data());
        });
      } else {
        settings.value = SettingModel.fromMap(value.data());
        settings.value.token = token;
        await settingsRef.doc(userid).update(settings.value.toMap());
      }
    });
  }

  clearData() {
    isAuth.value = false;
    driver.value = DriverModel();
    settings.value = SettingModel();
  }

  setupCache(String userid) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(AppStrings.userid, userid);
    prefs.setBool(AppStrings.auth, true);
  }

  clearCache() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(AppStrings.userid, '');
    prefs.setBool(AppStrings.auth, false);
  }

  Future<void> updateradius(String radius) async {
    await driverRef.doc(userid).update(
      {
        'radius': radius,
      },
    ).then((value) {
      Fluttertoast.showToast(
        msg: 'Radius Added Successfully',
      );
    });
    await getUserDetails(userid);
  }

  Future register(DriverModel driver) async {
    loadingDialog();
    print("register cal");
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: driver.email!, password: driver.password!)
          .then((after) async {
        driver.id = after.user!.uid;
        driver.password = XorCipher().encryptData(
          driver.password!,
          AppStrings.xorkey,
        );

        await driverRef.doc(driver.id).set(driver.toMap());

        await setupCache(driver.id!);

        isAuth.value = true;
        await getUserDetails(driver.id!);
        registerPopup();
      });
    } on FirebaseAuthException catch (e) {
      Get.back();
      Get.showSnackbar(Ui.ErrorSnackBar(message: formatError(e)));
    } catch (e) {
      Get.back();
      Get.showSnackbar(Ui.ErrorSnackBar(message: 'Please try again later.'));
    }
  }

  Future login(String email, String password) async {
    loadingDialog();
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((after) async {
        await driverRef.doc(after.user!.uid).get().then((value) async {
          if (value.data() != null) {
            driver.value = DriverModel.fromMap(value.data()!);
            if (driver.value.password != password) {
              NotificationServices notificationServices =
                  NotificationServices();
              String devicetoken = await notificationServices.getDeviceToken();

              await driverRef.doc(after.user!.uid).update(
                {
                  'password':
                      XorCipher().encryptData(password, AppStrings.xorkey),
                  'devicetoken': devicetoken
                },
              );
            }
            driver.value.password = XorCipher().encryptData(
              password,
              AppStrings.xorkey,
            );
            await setupCache(after.user!.uid);
            isAuth.value = true;
            await getUserDetails(
              after.user!.uid,
              password: password,
              isAuth: true,
            );
            Get.offAllNamed("/mainpage");
          } else {
            Get.back();
            auth.signOut();
            Get.showSnackbar(
              Ui.SuccessSnackBar(
                message:
                    'Looks like you are not an authorized user for this application.'
                    ' Please try again with different credentials.',
              ),
            );
          }
        });
      });
    } on FirebaseAuthException catch (e) {
      Get.back();
      Get.showSnackbar(Ui.ErrorSnackBar(message: formatError(e)));
    } catch (e) {
      Get.back();
      Get.showSnackbar(Ui.ErrorSnackBar(message: 'Please try again later.'));
    }
  }

  Future logout() async {
    await auth.signOut();
    clearCache();
    clearData();

    // Get.offAll(() =>  MainScreen());
    Get.offAll(() => Signup());
  }

  Stream<int> getUnReadNotification() {
    print("get unread call");
    return notificationRef
        .doc(driver.value.id)
        .collection("notification")
        .where('isMessageRead', isEqualTo: false)
        .snapshots()
        .map(
      (event) {
        print("get unread call 33${event.docs.length}");
        return event.docs.length;
      },
    ).handleError((e) {
      return e;
    });
  }

  Future deleteProfile() async {
    await auth.currentUser!
        .reauthenticateWithCredential(
      EmailAuthProvider.credential(
        email: driver.value.email!,
        password: driver.value.password!,
      ),
    )
        .then(
      (value) async {
        value.user!.delete();
        await logout();
      },
    );
  }
}

void registerPopup() {
  showModalBottomSheet(
    context: Get.context!,
    isScrollControlled: true,
    builder: (BuildContext context) {
      var screenSize = MediaQuery.of(context).size;

      double screenHeight = MediaQuery.of(context).size.height;
      double screenWidth = MediaQuery.of(context).size.width;

      return SingleChildScrollView(
        child: Container(
          height: screenHeight * 0.7,
          padding: EdgeInsets.only(top: 10, bottom: 24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffFDFDFE).withOpacity(0),
                Color(0xffFDFDFE),
              ],
            ),
          ),
          child: Stack(
            children: [
              SheetBack(),
              Positioned(
                top: 0,
                child: SizedBox(
                  height: screenHeight * 0.6,
                  width: screenWidth,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/signup.png'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                left: screenWidth * 0.1,
                right: screenWidth * 0.1,
                child: Container(
                  height: screenHeight * 0.28,
                  width: screenWidth * 0.8,
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: screenSize.height * 0.01),
                      Headline("Registered Successfully"),
                      SizedBox(height: screenSize.height * 0.02),
                      BodyText(
                          "Congratulations! Your account has been created."),
                      SizedBox(height: screenSize.height * 0.01),
                      //  BodyText("Please login to get an amazing experience."),
                      SizedBox(height: screenSize.height * 0.04),
                      CustomElevatedButton(
                        text: 'Go to Homepage',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
