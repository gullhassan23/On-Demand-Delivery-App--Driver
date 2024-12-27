import 'package:driverapp/constants/icons.dart';
import 'package:driverapp/global/refs.dart';
import 'package:driverapp/widgets/buttons.dart';
import 'package:driverapp/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:driverapp/widgets/font.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../controllers/user_controller.dart';
import '../../global/functions.dart';
import '../../services/user_services.dart';
import '../../widgets/assetimage.dart';
import '../../widgets/colors.dart';
import '../../widgets/loading_widgets.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  String image = "";
 

  UserServices usercontroller = Get.find<UserServices>();
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController address = TextEditingController();

  @override
  void initState() {
    print(usercontroller.driver.address.toString());
    // TODO: implement initState
    name.text = usercontroller.driver.name.toString();
    address.text = usercontroller.driver.address.toString()=="null"?usercontroller.driver.address.toString():"";

    number.text = usercontroller.driver.phone.toString();
    print(usercontroller.driver.profile.toString() != "");
    image = usercontroller.driver.profile.toString() != ""
        ? usercontroller.driver.profile.toString()
        : 'assets/images/Ellipse 158.png';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.whitetext,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Headline("Edit Profile"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0), // Add padding from all sides
        child: ListView(
          children: [
            Column(
              children: [
                // const Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Center(
                //       child: CircleAvatar(
                //         radius: 80,
                //         backgroundImage: AssetImage('assets/images/alice.jpeg'),
                //       ),
                //     ),
                //   ],
                // ),
                // Text("image = ${image}"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius: 80,
                            backgroundColor: Colors.white,
                            backgroundImage: providerImage(image),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: InkWell(
                            onTap: () async {
                              if (GetPlatform.isAndroid) {
                                await getImage();
                              } else {
                                await Permission.photos.request().then(
                                  (value) async {
                                    if (value.isGranted ||
                                        value.isLimited ||
                                        value.isRestricted) {
                                      await getImage();
                                    } else {
                                      Fluttertoast.showToast(
                                        msg: 'Require access to photos',
                                      );
                                    }
                                  },
                                );
                              }
                            },
                            child: CircleAvatar(
                              backgroundColor: AppColors.primary,
                              child: SvgPicture.asset(
                                'assets/icons/camera.svg',
                                color: AppColors.whitetext,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: screenSize.height * 0.05),
                const Row(
                  children: [
                    Headline("Full Name"),
                  ],
                ),
                SizedBox(height: screenSize.height * 0.01),
                CustomTextField2(
                  controller: name,
                  prefixIcon: AppIcons.customprofile,
                  suffixIcon: AppIcons.tick,
                  hintText: "",
                ),
                SizedBox(height: screenSize.height * 0.02),
                // const SizedBox(
                //   height: screenSize.height*0.02,
                // ),
                const Row(children: [Headline("Phone Number")]),
                SizedBox(height: screenSize.height * 0.01),
                CustomTextField2(
                  controller: number,
                  prefixIcon: AppIcons.customcall,
                  suffixIcon: AppIcons.tick,
                  hintText: "",
                ),
                SizedBox(height: screenSize.height * 0.02),

                 Row(children: [Headline("Address")]),
                 SizedBox(height: screenSize.height*0.01),

                CustomTextField2(
                  controller: address,
                  prefixIcon: AppIcons.location,
                  suffixIcon: AppIcons.tick,
                  hintText: "",
                ), 
                 SizedBox(height: screenSize.height*0.1),
                
                CustomElevatedButton(
                    text: "Save Change",
                    onPressed: () async {
                      loadingDialog();
                      Get.find<UserController>().driver.value.name = name.text;
                      Get.find<UserController>().driver.value.phone =
                          number.text;
                      if (image != '' &&
                          image.contains('http') == false &&
                          image.contains('asset') == false) {
                        image = await uploadFile(
                          image,
                          'Drivers/${Get.find<UserController>().userid}',
                        );
                      }
                      Get.back();

                      await Get.find<UserServices>().updateProfile(
                        name: name.text,
                        phone: number.text,
                        image: image,
                      );
                      Get.back();
                      Fluttertoast.showToast(
                          msg: 'Profile updated successfully');
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }

  getImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) image = picked.path;
    setState(() {});
  }
}
