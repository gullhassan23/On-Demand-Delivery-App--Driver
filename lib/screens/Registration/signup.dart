// ignore_for_file: library_private_types_in_public_api

import 'package:driverapp/constants/strings.dart';
import 'package:driverapp/models/drivers.dart';
import 'package:driverapp/notification_services.dart';
import 'package:driverapp/screens/Dashboard/dashboard.dart';
import 'package:driverapp/screens/Registration/signin.dart';
import 'package:driverapp/services/user_services.dart';
import 'package:flutter/material.dart';

import 'package:driverapp/constants/icons.dart';
import 'package:driverapp/widgets/buttons.dart';
import 'package:driverapp/widgets/font.dart';
import 'package:get/get.dart';

import '../../widgets/textformfield.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isCheckboxChecked = false;
  bool isSignUpSelected = true; // Track if Sign Up is selected
  final GlobalKey<FormState> from = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController(),
      email = TextEditingController(),
      password = TextEditingController();

  bool hide = true;
  bool signin = true;

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenSize = MediaQuery.of(context).size;
    // Set responsive padding
    final double padding = screenSize.width > 500 ? 32.0 : 16.0;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenSize.height * 0.1),
              signin == false
                  ? Column(
                      children: [
                        Row(children: [Headline('Get Shipping Jobs Anytime')]),
                        SizedBox(height: screenSize.height * 0.01),
                        Row(
                          children: [
                            BodyText(
                                'Get great experience with ${AppStrings.appname}'),
                          ],
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        SizedBox(height: screenSize.height * 0.01),
                        Row(children: [Headline('Get Shipping Jobs Anytime')]),
                        SizedBox(height: screenSize.height * 0.01),
                        Row(
                          children: [
                            BodyText(
                                'Get great experience with ${AppStrings.appname}'),
                          ],
                        ),
                      ],
                    ),
              SizedBox(height: screenSize.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: screenSize.height * 0.065,
                    width: screenSize.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color(0xFFD6D6D6),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              signin = false;
                            });
                          },
                          child: Container(
                            width: screenSize.width * 0.45,
                            height: screenSize.height * 0.08,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: !signin ? Colors.white : Color(0xFFD6D6D6),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Headline("Sign up"),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              signin = true;
                            });
                          },
                          child: Container(
                            width: screenSize.width * 0.45,
                            height: screenSize.height * 0.08,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: signin ? Colors.white : Color(0xFFD6D6D6),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Headline("Sign In"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              signin == false
                  ? Form(
                      key: from,
                      child: Column(
                        children: [
                          SizedBox(height: screenSize.height * 0.02),
                          Row(children: [Headline("Full name")]),
                          SizedBox(height: screenSize.height * 0.02),
                          CustomTextField(
                            controller: name,
                            prefixIcon: AppIcons.customprofile,
                            hintText: "Enter Your name",
                          ),
                          SizedBox(height: screenSize.height * 0.02),
                          Row(children: [Headline("Email Address")]),
                          SizedBox(height: screenSize.height * 0.02),
                          CustomTextField(
                            controller: email,
                            inputType: TextInputType.text,
                            prefixIcon: AppIcons.customcall,
                            hintText: "Enter your email address",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return '*Required';
                              } else if (!GetUtils.isEmail(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: screenSize.height * 0.02),
                          Row(children: [Headline("Password")]),
                          SizedBox(height: screenSize.height * 0.02),
                          CustomTextField(
                            obsecure: hide,
                            controller: password,
                            prefixIcon: AppIcons.customlock,
                            hintText: "Enter your password",
                          ),
                          SizedBox(height: screenSize.height * 0.02),
                          SizedBox(height: screenSize.height * 0.02),
                          CustomElevatedButton(
                            text: "Create Account ",
                            onPressed: () async {
                              Get.focusScope!.unfocus();
                              from.currentState!.save();
                              if (from.currentState!.validate()) {
                                NotificationServices notificationServices =
                                    NotificationServices();
                                String devicetoken =
                                    await notificationServices.getDeviceToken();
                                await Get.find<UserServices>().register(
                                  DriverModel(
                                    name: name.text,
                                    email: email.text.trim(),
                                    password: password.text,
                                    devicetoken: devicetoken
                                    
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    )
                  :
                  // Container()
                  Signin()
            ],
          ),
        ),
      ),
    );
  }
}


// void _showPopup(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     isDismissible: false,
//     isScrollControlled: true,
//     builder: (context) {
//       return Container(
//         height: context.height * 0.7,
//         padding: EdgeInsets.only(top: 10, bottom: 24),
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color(0xffFDFDFE).withOpacity(0),
//               Color(0xffFDFDFE),
//             ],
//           ),
//         ),
//         child: Column(
//           children: [
//             SheetBack(),
//             Stack(
//               children: [
//                 SvgPicture.asset(AppIcons.frame),
//                 Positioned(
//                   bottom: 0,
//                   child: Container(
//                     height: context.height * 0.2,
//                     width: context.width * 0.9,
//                     margin: EdgeInsets.symmetric(horizontal: 24),
//                     decoration: BoxDecoration(color: Colors.white),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SizedBox(height: screenSize.height*0.01),
//                         Text(
//                           "Facebook Market Place",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: screenSize.height*0.01),
//                         Text(
//                           "All items and delivery charges must be paid before proceeding",
//                           textAlign: TextAlign.center,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: screenSize.height*0.01),
//             CustomElevatedButton(text: "Confirm", onPressed: () => Get.back()),
//           ],
//         ),
//       );
//     },
//   );
// }
