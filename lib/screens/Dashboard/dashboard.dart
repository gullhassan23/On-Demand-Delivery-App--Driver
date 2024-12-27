import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driverapp/binding/assets_binding.dart';
import 'package:driverapp/constants/strings.dart';
import 'package:driverapp/controllers/dashboard_controller.dart';
import 'package:driverapp/controllers/user_controller.dart';
import 'package:driverapp/global/refs.dart';
import 'package:driverapp/models/drivers.dart';
import 'package:driverapp/models/jobs.dart';
import 'package:driverapp/screens/Add-Assets/AddAssets.dart';
import 'package:driverapp/screens/AddRadius/AddRadius.dart';
import 'package:driverapp/screens/AddRadius/googlemap.dart';
import 'package:driverapp/screens/Available-Orders/Scheduled-Jobs.dart';
import 'package:driverapp/screens/Dashboard/ondemand.dart';
import 'package:driverapp/constants/icons.dart';
import 'package:driverapp/screens/Massages/Masseges.dart';
import 'package:driverapp/screens/MyJobs/MyJobs.dart';
import 'package:driverapp/screens/MyProfile/Profile.dart';
import 'package:driverapp/screens/MyProfile/notification.dart';
import 'package:driverapp/screens/Wallet/Wallet.dart';
import 'package:driverapp/services/user_services.dart';
import 'package:driverapp/widgets/assetimage.dart';
import 'package:driverapp/widgets/colors.dart';
import 'package:driverapp/widgets/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../Add-Assets/documents.dart';
import '../Registration/signin.dart';
import '../Registration/signup.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String address = '';
  UserController controller = Get.find<UserController>();
  final Completer<GoogleMapController> _controller = Completer();
  late LatLng _initialPosition = LatLng(0.0, 0.0);
  UserServices _userServices = Get.find<UserServices>();

  // List<Marker> list = [
  //   Marker(
  //       markerId: MarkerId('driver'),
  //       position: LatLng(33.6844, 73.0479),
  //       infoWindow: InfoWindow(title: 'some Info ')),
  // ];
  bool isOnline = false; // Initial status: offline
  @override
  void initState() {
    // TODO: implement initState
    // getCurrentPosition();
    // dcontroller.markers.addAll(list);
    // getdriverdata();
    getCurrentPosition();
    super.initState();
  }

  // getdriverdata() async {
  //   StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
  //     stream:
  //         driverRef.where('id', isEqualTo: _userServices.driver.id).snapshots(),
  //     builder: (BuildContext context,
  //         AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
  //       controller.getUserDetails(_userServices.driver.id.toString());
  //       print("sadasds ${controller.driver}");

  //       return Container();
  //     },
  //   );
  // }

  getCurrentPosition() async {
    // dcontroller.markers.clear();

    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    _getUserCurrentLocation().then((value) async {
      // print("update marker call 0");

      _updateMarker(value);
      // dcontroller.markers.clear();
      // Geolocator.getPositionStream().listen((Position position) {
      // //  print("listen stream $position");
      //   _updateMarker(position);
      // });

      // setState(() {});
    });

    // if (mounted) setState(() {});
  }

  Future<Position> _getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print(error.toString());
    });

    return await Geolocator.getCurrentPosition();
  }

  Future<void> _updateMarker(Position position) async {
    print("update marker call");
    dcontroller.markers.clear();
    dcontroller.markers.add(Marker(
      markerId: MarkerId('driver2'),
      position: LatLng(position.latitude, position.longitude),
    ));

    final GoogleMapController controller = await _controller.future;

    CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 15.0,
    );
    dcontroller.kGooglePlex = _kGooglePlex;
    print("sjabj ${dcontroller.kGooglePlex}");
    controller
        .animateCamera(CameraUpdate.newCameraPosition(dcontroller.kGooglePlex));
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    final add = placemarks.first;
    // print("address 0$add");

    address = add.street.toString() +
        " " +
        add.thoroughfare.toString() +
        " " +
        add.subLocality.toString() +
        " " +
        add.postalCode.toString() +
        " " +
        add.locality.toString() +
        " " +
        add.administrativeArea.toString() +
        " " +
        add.subAdministrativeArea.toString() +
        " " +
        add.country.toString();
    // print("address $address");
    if (isOnline) {
      UserServices userser = Get.find<UserServices>();

      // Store the location data in Firestore
      await FirebaseFirestore.instance
          .collection('driver_locations')
          .doc('${userser.userid}')
          .set({
        'latitude': position.latitude,
        'longitude': position.longitude,
        'location': address,
        "uid": userser.userid,
        'timestamp': FieldValue.serverTimestamp(), // Include a timestamp
      });
    }
  }

  DashboardContoller dcontroller = Get.find<DashboardContoller>();
  UserServices usercontroller = Get.find<UserServices>();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Obx(() => Scaffold(
          drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                            'assets/images/Ellipse 158.png'), // You can replace 'avatar.png' with your image asset path
                      ),
                      SizedBox(height: screenSize.height * 0.01),
                      Headline("${usercontroller.driver.name.toString()}")
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: ListTile(
                    title: SimpleText('Home'),
                    onTap: () {
                      Get.back();

                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => HomeScreen(),
                      //   ),
                      // );
                    },
                  ),
                ),
                ////Divider(),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: ListTile(
                    title: SimpleText('Account'),
                    onTap: () {
                      Get.back();

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Profile(),
                        ),
                      );
                    },
                  ),
                ),
                //Divider(),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: ListTile(
                    title: SimpleText('My Jobs'),
                    onTap: () {
                      print("object");
                      Get.back();
                      print("object 1");

                      Get.toNamed("/jobpage");
                      print("object 2");

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => MyJobs()));
                    },
                  ),
                ),
                //Divider(),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: ListTile(
                    title: SimpleText('Scheduled Jobs'),
                    onTap: () {
                      Get.back();

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ScheduledJobs(),
                        ),
                      );
                    },
                  ),
                ),
                //Divider(),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: ListTile(
                    title: SimpleText('Messages'),
                    onTap: () {
                      Get.back();

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Massages(),
                        ),
                      );
                    },
                  ),
                ),
                //Divider(),
                //Divider(),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: ListTile(
                    title: SimpleText('Add Assets'),
                    onTap: () {
                      // print(usercontroller.driver.asset!.name);

                      driverRef
                          .doc(usercontroller.driver.id)
                          .get()
                          .then((value) {
                        if (value.exists) {
                          Get.back();

                          // Extract data as Map<String, dynamic>
                          Map<String, dynamic>? driverData =
                              value.data() as Map<String, dynamic>?;

                          if (driverData != null) {
                            // Convert Map<String, dynamic> to DriverModel
                            DriverModel data = DriverModel.fromMap(driverData);

                            print("value ${data}");

                            // Perform conditional navigation based on the retrieved data
                            if (data.asset?.name == null ||
                                data.asset!.name!.isEmpty) {
                              Get.to(() => AddAsset(),
                                  binding: AssetsBinding());
                            } else {
                              Get.to(() => Upload(), binding: AssetsBinding());
                            }
                          }
                        }
                      });

                      // if (usercontroller.driver.asset!.name == "") {
                      //   Get.to(() => AddAsset(), binding: AssetsBinding());
                      // } else {
                      //   Get.to(() => Upload(), binding: AssetsBinding());
                      // }
                    },
                  ),
                ),
                //Divider(),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: ListTile(
                    title: SimpleText('Add Radius'),
                    onTap: () {
                      Get.back();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MapRadius(),
                        ),
                      );
                    },
                  ),
                ),
                //Divider(),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: ListTile(
                    title: SimpleText('Wallet & History'),
                    onTap: () {
                      Get.back();

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Wallet(),
                        ),
                      );
                    },
                  ),
                ),
                ////Divider(),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: ListTile(
                    title: SimpleText('Visit Foundation.com'),
                    onTap: () {
                      Get.back();

                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => HomeScreen(),
                      //   ),
                      // );
                    },
                  ),
                ),
                SizedBox(height: screenSize.height * 0.05),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: ListTile(
                    title: SimpleText('Logout'), // Use Text instead of Headline
                    trailing: IconButton(
                      icon: SvgPicture.asset(AppIcons
                          .logout), // You can choose an appropriate icon
                      onPressed: () {},
                    ),
                    onTap: () {
                      Get.back();
                      driverRef
                          .doc(usercontroller.driver.id)
                          .update({"devicetoken": ""});
                      controller.logout();
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => Signup(),
                      //   ),
                      // );
                    },
                  ),
                ),
              ],
            ),
          ),
          body: Stack(
            fit: StackFit.expand,
            children: [
              dcontroller.onDemand.toString() == "true"
                  ? OnDemand()
                  : GoogleMap(
                      initialCameraPosition: dcontroller.kGooglePlex,
                      mapType: MapType.normal,
                      myLocationButtonEnabled: true,
                      myLocationEnabled: true,
                      markers: Set.of((dcontroller.markers.toString() != "null")
                          ? dcontroller.markers
                          : []),
                      // markers: Set<Marker>.of(dcontroller.markers),
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      onTap: (LatLng latLng) {},
                    ),
              Positioned(
                top: 60,
                left: 5,
                right: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Builder(builder: (context) {
                      return InkWell(
                        onTap: () => Scaffold.of(context).openDrawer(),
                        child: Container(
                          height: screenSize.height * 0.06,
                          width: screenSize.width * 0.15,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                            // borderRadius: BorderRadius.circular(60.0),
                          ),
                          child: Icon(
                            Icons.list,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: screenSize.height * 0.065,
                          width: screenSize.width * 0.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: AppColors.secondary,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  // setState(() {
                                  dcontroller.onDemand(false);
                                  // });

                                  getCurrentPosition();

                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) => HomeScreen(),
                                  //     ),);
                                },
                                child: Container(
                                  width: screenSize.width * 0.3,
                                  height: screenSize.height * 0.08,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: dcontroller.onDemand.toString() ==
                                            "false"
                                        ? AppColors.greendark
                                        : AppColors.secondary,
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Headline("Scheduled",
                                      color: dcontroller.onDemand.toString() ==
                                              "false"
                                          ? AppColors.text
                                          : AppColors.whitetext),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  // setState(() {
                                  dcontroller.onDemand(true);
                                  //  Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) => HomeScreen(),
                                  //     ),);
                                  // });
                                },
                                child: Container(
                                  width: screenSize.width * 0.3,
                                  height: screenSize.height * 0.08,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: dcontroller.onDemand.toString() ==
                                            "true"
                                        ? AppColors.greendark
                                        : AppColors.secondary,
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Headline(
                                    "OnDemand",
                                    color: dcontroller.onDemand.toString() ==
                                            "true"
                                        ? AppColors.text
                                        : AppColors.whitetext,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                            height: screenSize.height * 0.06,
                            width: screenSize.width * 0.15,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              customernotification()));
                                },
                                icon: SvgPicture.asset(
                                  AppIcons.notification,
                                  color: Colors.white,
                                ))),
                        StreamBuilder<int>(
                          stream: controller.getUnReadNotification(),
                          builder: (context, snap) {
                            if (snap.hasData) {
                              if (snap.data != 0) {
                                return Positioned(
                                  right: 5,
                                  top: 5,
                                  child: Container(
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        // borderRadius: BorderRadius.circular(10),
                                        shape: BoxShape.circle),
                                    constraints: BoxConstraints(
                                      minWidth: 16,
                                      minHeight: 16,
                                    ),
                                    child: Text(
                                      snap.data.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              }
                            }
                            return Container();
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
              dcontroller.onDemand.toString() == "false"
                  ? Positioned(
                      bottom: 30,
                      left: 40,
                      right: 60,
                      child: Column(
                        children: [
                          // ElevatedButton(
                          //   onPressed: () {
                          //     setState(() {
                          //       isOnline = !isOnline;
                          //     });
                          //   },
                          //   child: Text(isOnline ? 'Go Offline' : 'Go Online'),
                          //   style: ElevatedButton.styleFrom(
                          //     backgroundColor: isOnline ? Colors.green : Colors.red,
                          //     textStyle: TextStyle(fontSize: 18),
                          //     padding: EdgeInsets.symmetric(
                          //         horizontal: 30, vertical: 15),
                          //   ),
                          // ),

                          SizedBox(
                            height: screenSize.height * 0.01,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ScheduledJobs();
                                  },
                                ),
                              );
                            },
                            child: Container(
                              height: screenSize.height * 0.06,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: AppColors.greendark,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  // SizedBox(width: 30),
                                  WhiteText('Available Orders'),
                                  // SizedBox(width: 60),
                                  SvgPicture.asset(AppIcons.AvailableOrders),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ));
  }
}
