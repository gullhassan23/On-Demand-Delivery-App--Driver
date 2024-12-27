// ignore_for_file: file_names
import 'package:driverapp/constants/icons.dart';
import 'package:driverapp/screens/Helpcenter/Helpcenter.dart';
import 'package:driverapp/screens/MyProfile/Masseges.dart';
import 'package:driverapp/screens/MyProfile/changepassword.dart';
import 'package:driverapp/screens/MyProfile/editprofile.dart';
import 'package:driverapp/screens/MyProfile/faq_screen.dart';
import 'package:driverapp/screens/MyProfile/notification.dart';
import 'package:driverapp/services/user_services.dart';
import 'package:driverapp/widgets/Row.dart';
import 'package:driverapp/widgets/assetimage.dart';
import 'package:driverapp/widgets/font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(
        () => ListView(
          children: [
            Container(
              padding: EdgeInsets.all(16.0), // Add padding from all sides
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       IconButton(
                      onPressed: () {
                        print("tap");
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_sharp,
                        color: Colors.white,
                      )),
                      // SizedBox(height: screenSize.height*0.03),
                      Text(
                        " My Profile",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenSize.height*0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     Get.find<UserServices>().driver.profile.toString() != ''?
                        SizedBox(
                          width: 60,
                          height: screenSize.height*0.06,
                          child: CircleAvatar(
                            backgroundImage: providerImage(
                              Get.find<UserServices>().driver.profile!,
                            ),
                            radius: 30,
                          ),
                        ): SizedBox(
                          width: 60,
                          height: screenSize.height*0.06,
                          child: CircleAvatar(
                            backgroundImage: providerImage(
                            "assets/images/Ellipse 158.png",
                            ),
                            radius: 30,
                          ),
                        ),
                      SizedBox(width: 8.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Get.find<UserServices>().driver.name ?? '',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: screenSize.height*0.01),
                          // Text(
                          //   Get.find<UserServices>().driver.profile!,
                          //   style:
                          //       TextStyle(fontSize: 14.0, color: Colors.white),
                          // ),
                        ],
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Editprofile(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Edit Profile',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: screenSize.height*0.01),
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Headline("Setting")],
                    ),
                    // Row(
                    //   children: [
                    //     Divider(),
                    //     SizedBox(height: screenSize.height*0.02),
                    //     GestureDetector(
                    //       onTap: () {
                    //         Navigator.of(context).push(
                    //           MaterialPageRoute(
                    //             builder: (context) => Massages(),
                    //           ),
                    //         );
                    //       },
                    //       child: ProfileRow(
                    //         heading: "Message",
                    //         IconData: AppIcons.message,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Row(
                      children: [
                        Divider(),
                        SizedBox(height: screenSize.height*0.02),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ChangePassword(),
                              ),
                            );
                          },
                          child: ProfileRow(
                            heading: "Change Password",
                            IconData: AppIcons.customlock,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Divider(),
                        SizedBox(height: screenSize.height*0.02),
                        GestureDetector(
                          onTap: () {
                            // Navigate to the desired page when tapped
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    customernotification(),
                              ),
                            );
                          },
                          child: ProfileRow(
                            heading: "Notification",
                            IconData: AppIcons.ProfileNotification,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height*0.01),
                    Row(children: [Headline("About us")]),
                    SizedBox(height: screenSize.height*0.01),
                    InkWell(
                      onTap: () => Get.to(()=> FaqScreen()),
                      child: Row(
                        children: [
                          ProfileRow(
                            heading: "FAQ",
                            IconData: AppIcons.ProfileNotification,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Divider(),
                        SizedBox(height: screenSize.height*0.01),
                        ProfileRow(
                          heading: "privacy Policy",
                          IconData: AppIcons.Privacy,
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height*0.01),
                    Row(
                      children: [
                        Divider(),
                        SizedBox(height: screenSize.height*0.01),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => HelpCenter(),
                              ),
                            );
                          },
                          child: ProfileRow(
                            heading: "Contact us",
                            IconData: AppIcons.Contact,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height*0.01),
                    Row(children: [Headline("Other")]),
                    SizedBox(height: screenSize.height*0.01),
                    Row(
                      children: [
                        ProfileRow(heading: "Share", IconData: AppIcons.Share),
                      ],
                    ),
                    Row(
                      children: [
                        Divider(),
                        SizedBox(height: screenSize.height*0.02),
                        GestureDetector(
                          onTap: () async =>
                              await Get.find<UserServices>().logout(),
                          child: ProfileRow(
                            heading: "Logout",
                            IconData: AppIcons.Logout,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height*0.3),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
