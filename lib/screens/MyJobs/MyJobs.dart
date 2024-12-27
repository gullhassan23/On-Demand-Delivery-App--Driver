// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driverapp/constants/icons.dart';
import 'package:driverapp/global/refs.dart';
import 'package:driverapp/widgets/bottom_sheet.dart';
import 'package:driverapp/widgets/colors.dart';
import 'package:driverapp/widgets/containers.dart';
import 'package:driverapp/widgets/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controllers/dashboard_controller.dart';
import '../../models/jobs.dart';
import '../../services/user_services.dart';

class MyJobs extends StatefulWidget {
  MyJobs({Key? key, this.type = 1}) : super(key: key);

  final int type;

  @override
  State<MyJobs> createState() => _MyJobsState();
}

class _MyJobsState extends State<MyJobs> {
  String selectedTab = "All";
  bool isPickupActive = true;
  UserServices controller = Get.find<UserServices>();
  DashboardContoller dashboardcontroller = Get.find<DashboardContoller>();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: Colors.white,
      body: // Add padding from all sides
          ListView(
        children: [
          Container(
            color: Colors.black,
            padding: EdgeInsets.all(16.0), // Add padding from all sides
            child: Column(children: [
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
                  // SizedBox(
                  //   height: screenSize.height * 0.03,
                  // ),
                  Text(
                    "My Jobs",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    width: 150,
                  ),
                ],
              ),
              SizedBox(
                height: screenSize.height * 0.04,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white), // Text color
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.green, // Background color
                  prefixIcon:
                      Icon(Icons.search, color: Colors.white), // Prefix icon
                  hintText: 'Enter track number',
                  hintStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // Rounded border
                    borderSide: BorderSide.none, // Remove the default border
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 20.0), // Horizontal padding
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
            ]),
          ),
          SizedBox(
            height: screenSize.height * 0.05,
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              // You can adjust the padding value as needed
              child: Column(
                children: [
                  SizedBox(
                    height: screenSize.height * 0.01,
                  ),
                  Divider(),
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
                                  // dashboardcontroller.sendNotification("djuoGgK0TIe1bSsVKHkgfm:APA91bGU1wrjsremERTp16ylnE6758dWVUpNJutzDCeqJBbZSfL4hjHdq8PUmoypWMFP4A8DHKmbHWQkRrTDtURY_uBy4OIpCCDbATtMR9H5yV7XDMKP0gdXfRlm5oZ40heO8YTaGQZD", "", context);
                                  isPickupActive = true;
                                  //  Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //         builder: (context) => MyJobs(),
                                  //       ),
                                  //     );
                                });
                              },
                              child: Container(
                                width: screenSize.width * 0.45,
                                height: screenSize.height * 0.08,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: isPickupActive
                                      ? Colors.white
                                      : Color(0xFFD6D6D6),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: SimpleText("Pickup"),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isPickupActive = false;
                                  //  Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //         builder: (context) => MyJobs(),
                                  //       ),
                                  //     );
                                });
                              },
                              child: Container(
                                width: screenSize.width * 0.45,
                                height: screenSize.height * 0.08,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: !isPickupActive
                                      ? Colors.white
                                      : Color(0xFFD6D6D6),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: SimpleText("Schedule"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(40.0),
                  //   child: Container(
                  //     color: Color(0xFFD6D6D6),
                  //     height: screenSize.height*0.05,
                  //     width: double.infinity,
                  //     child: Row(
                  //       children: [
                  //         Expanded(
                  //           child: GestureDetector(
                  //             onTap: () {
                  //               setState(() {
                  //                 isPickupActive = true;
                  //               });
                  //               Navigator.push(
                  //                 context,
                  //                 MaterialPageRoute(
                  //                   builder: (context) => MyJobs(),
                  //                 ),
                  //               );
                  //             },
                  //             child: Container(
                  //               decoration: isPickupActive
                  //                   ? BoxDecoration(
                  //                       color: Colors.white,
                  //                       borderRadius:
                  //                           BorderRadius.circular(20),
                  //                     )
                  //                   : null,
                  //               child: Center(
                  //                 child: Text("Pickup"),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         Expanded(
                  //           child: GestureDetector(
                  //             onTap: () {
                  //               setState(() {
                  //                 isPickupActive = false;
                  //               });
                  //               Navigator.push(
                  //                 context,
                  //                 MaterialPageRoute(
                  //                   builder: (context) => MyJobs(),
                  //                 ),
                  //               );
                  //             },
                  //             child: Container(
                  //               decoration: !isPickupActive
                  //                   ? BoxDecoration(
                  //                       color: Colors.white,
                  //                       borderRadius:
                  //                           BorderRadius.circular(20),
                  //                     )
                  //                   : null,
                  //               child: Center(
                  //                 child: Text("Schedule"),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  Divider(),
                  SizedBox(
                    height: screenSize.height * 0.02,
                  ),
                  Column(
                    children: [
                      Divider(),
                      SizedBox(
                        height: screenSize.height * 0.05,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            CustomContainer2(
                              textcolor: selectedTab == "All"
                                  ? Colors.white
                                  : Colors.black,
                              backgroundcolor: selectedTab == "All"
                                  ? Colors.green
                                  : Colors.grey,
                              text: "All",
                              onTapCallback: () {
                                setState(() {
                                  selectedTab = "All";
                                });
                              },
                              isSelected: selectedTab == "All",
                            ),
                            CustomContainer2(
                              textcolor: selectedTab == "Pending"
                                  ? Colors.white
                                  : Colors.black,
                              backgroundcolor: selectedTab == "Pending"
                                  ? Colors.green
                                  : Colors.grey,
                              text: "Pending",
                              onTapCallback: () {
                                setState(() {
                                  selectedTab = "Pending";
                                });
                              },
                              isSelected: selectedTab == "Pending",
                            ),
                            CustomContainer2(
                              textcolor: selectedTab == "On process"
                                  ? Colors.white
                                  : Colors.black,
                              backgroundcolor: selectedTab == "On process"
                                  ? Colors.green
                                  : Colors.grey,
                              text: "On process",
                              onTapCallback: () {
                                setState(() {
                                  selectedTab = "On process";
                                });
                              },
                              isSelected: selectedTab == "On process",
                            ),
                            CustomContainer2(
                              textcolor: selectedTab == "Delivered"
                                  ? Colors.white
                                  : Colors.black,
                              backgroundcolor: selectedTab == "Delivered"
                                  ? Colors.green
                                  : Colors.grey,
                              text: "Delivered",
                              onTapCallback: () {
                                setState(() {
                                  selectedTab = "Delivered";
                                });
                              },
                              isSelected: selectedTab == "Delivered",
                            ),
                            CustomContainer2(
                              textcolor: selectedTab == "Completed"
                                  ? Colors.white
                                  : Colors.black,
                              backgroundcolor: selectedTab == "Completed"
                                  ? Colors.green
                                  : Colors.grey,
                              text: "Completed",
                              onTapCallback: () {
                                setState(() {
                                  selectedTab = "Completed";
                                });
                              },
                              isSelected: selectedTab == "Completed",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.02,
                      ),
                      StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                        // stream: jobsRef
                        //     .where("driver",
                        //         isEqualTo: controller.driver.id)
                        //     .snapshots(),
                        stream: selectedTab == "All"
                            ? jobsRef
                                .where("driver", isEqualTo: controller.userid)
                                .where("type",
                                    isEqualTo: isPickupActive ? 0 : 1)
                                .where("status", isNotEqualTo: 0)
                                .orderBy(
                                    "status") // Use the same field as in the where clause with inequality
                                .orderBy("created", descending: true)
                                .snapshots()
                            // jobsRef
                            //     .where("driver", isEqualTo: controller.userid)
                            //     .where("type",
                            //         isEqualTo: isPickupActive ? 0 : 1)
                            //         .where("status", isNotEqualTo: 0)

                            //     .orderBy("created", descending: true)
                            //     .snapshots()
                            : selectedTab == "Pending"
                                ? jobsRef
                                    .where("driver",
                                        isEqualTo: controller.userid)
                                    .where("status", isEqualTo: 1)
                                    .where("type",
                                        isEqualTo: isPickupActive ? 0 : 1)
                                    .orderBy("created", descending: true)
                                    .snapshots()
                                : selectedTab == "On process"
                                    ? jobsRef
                                        .where("driver",
                                            isEqualTo: controller.userid)
                                        .where("status", isEqualTo: 2)
                                        .where("type",
                                            isEqualTo: isPickupActive ? 0 : 1)
                                        .orderBy("created", descending: true)
                                        .snapshots()
                                    : selectedTab == "Delivered"
                                        ? jobsRef
                                            .where("driver",
                                                isEqualTo: controller.userid)
                                            .where("status", isEqualTo: 3)
                                            .where("type",
                                                isEqualTo:
                                                    isPickupActive ? 0 : 1)
                                            .orderBy("created",
                                                descending: true)
                                            .snapshots()
                                        : selectedTab == "Completed"
                                            ? jobsRef
                                                .where("driver",
                                                    isEqualTo:
                                                        controller.userid)
                                                .where("status", isEqualTo: 4)
                                                .where("type",
                                                    isEqualTo:
                                                        isPickupActive ? 0 : 1)
                                                .orderBy("created",
                                                    descending: true)
                                                .snapshots()
                                            : null,
                        builder: (context, snapshot) {
                          // print("snapshot ${snapshot.data!.docs.length}");
                          // if (snapshot.connectionState ==
                          //     ConnectionState.waiting) {
                          //   return Center(
                          //     child: CircularProgressIndicator(),
                          //   );
                          // }

                          if (snapshot.hasError) {
                            return Center(
                              child: Text('Error: ${snapshot.error}'),
                            );
                          }

                          if (!snapshot.hasData ||
                              snapshot.data!.docs.isEmpty) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: screenSize.height * 0.06,
                                ),
                                Center(child: Text('No data available')),
                              ],
                            );
                          }

                          // If data is available, build the ListView.builder
                          return Column(
                            children: [
                              Divider(),
                              Row(
                                children: [
                                  Headline(
                                      "${snapshot.data!.docs.length} Result"),
                                ],
                              ),
                              Divider(),
                              ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  // Access each document from the snapshot and display its data
                                  var document = snapshot.data!.docs[index];
                                  List<DocumentSnapshot> documents =
                                      snapshot.data!.docs;
                                  List<JobModel> job = documents.map((doc) {
                                    return JobModel.fromMap(
                                        doc.data() as Map<String, dynamic>);
                                  }).toList();
                                  return Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          // showModalBottomSheet(
                                          //     context: context,
                                          //     isScrollControlled: true,
                                          //     builder: (BuildContext context) {
                                          //       return bottom_sheet();
                                          //     });

                                          job[index].status.toString() != "0"
                                              ? showModalBottomSheet(
                                                  context: context,
                                                  isScrollControlled: true,
                                                  builder:
                                                      (BuildContext context) {
                                                    return bottom_sheet(
                                                      jobddata: job[index],
                                                    );
                                                  })
                                              : null;
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 60,
                                              height: screenSize.height * 0.06,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              child: IconButton(
                                                onPressed: () {
                                                  //             showModalBottomSheet(
                                                  //               context: context,
                                                  //                   isScrollControlled: true,
                                                  // builder: (BuildContext context) {
                                                  //   return bottom_sheet();
                                                  //             });
                                                },
                                                icon: SvgPicture.asset(
                                                    AppIcons.Box),
                                                color: AppColors.greendark,
                                              ),
                                            ),
                                            SizedBox(width: 8.0),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Headline(
                                                    '${document['title']}'),
                                                BodyText('On transmit area'),
                                              ],
                                            ),
                                            Spacer(),
                                            SimpleText(job[index]
                                                        .status
                                                        .toString() ==
                                                    "1"
                                                ? "Pending"
                                                : job[index]
                                                            .status
                                                            .toString() ==
                                                        "2"
                                                    ? "On Process"
                                                    : job[index]
                                                                .status
                                                                .toString() ==
                                                            "3"
                                                        ? "Delivered"
                                                        : job[index]
                                                                    .status
                                                                    .toString() ==
                                                                "4"
                                                            ? "Completed"
                                                            : ""),
                                            SimpleText(
                                              job[index].paymentstatus == true
                                                  ? " ( Paid )"
                                                  : "",
                                              color: AppColors.greendark,
                                            )
                                          ],
                                        ),
                                      ),
                                      Divider(),
                                    ],
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      ),
                      // if (selectedTab == 'All')
                      //   SizedBox(
                      //     width: context.width,
                      //     height: context.height,
                      //     child: Column(
                      //       children: [
                      //         InkWell(
                      //           onTap: () {
                      //             showModalBottomSheet(
                      //                 context: context,
                      //                 isScrollControlled: true,
                      //                 builder: (BuildContext context) {
                      //                   return bottom_sheet();
                      //                 });
                      //           },
                      //           child: Row(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.center,
                      //             children: [
                      //               Container(
                      //                 width: 60,
                      //                 height: screenSize.height * 0.06,
                      //                 decoration: BoxDecoration(
                      //                   borderRadius:
                      //                       BorderRadius.circular(20.0),
                      //                 ),
                      //                 child: IconButton(
                      //                   onPressed: () {
                      //                     //             showModalBottomSheet(
                      //                     //               context: context,
                      //                     //                   isScrollControlled: true,
                      //                     // builder: (BuildContext context) {
                      //                     //   return bottom_sheet();
                      //                     //             });
                      //                   },
                      //                   icon:
                      //                       SvgPicture.asset(AppIcons.Box),
                      //                   color: AppColors.greendark,
                      //                 ),
                      //               ),
                      //               SizedBox(width: 8.0),
                      //               Column(
                      //                 crossAxisAlignment:
                      //                     CrossAxisAlignment.start,
                      //                 children: [
                      //                   Headline('MM09123478'),
                      //                   BodyText('On transmit area'),
                      //                 ],
                      //               ),
                      //               Spacer(),
                      //               SimpleText('On process')
                      //             ],
                      //           ),
                      //         ),
                      //         Divider(),
                      //         InkWell(
                      //           onTap: () {
                      //             showModalBottomSheet(
                      //                 context: context,
                      //                 isScrollControlled: true,
                      //                 builder: (BuildContext context) {
                      //                   return JobDetails_sheet();
                      //                 });
                      //           },
                      //           child: Row(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.center,
                      //             children: [
                      //               Container(
                      //                 width: 60,
                      //                 height: screenSize.height * 0.06,
                      //                 decoration: BoxDecoration(
                      //                   borderRadius:
                      //                       BorderRadius.circular(20.0),
                      //                 ),
                      //                 child: IconButton(
                      //                   onPressed: () {},
                      //                   icon:
                      //                       SvgPicture.asset(AppIcons.Box),
                      //                   color: AppColors.greendark,
                      //                 ),
                      //               ),
                      //               SizedBox(width: 8.0),
                      //               Column(
                      //                 crossAxisAlignment:
                      //                     CrossAxisAlignment.start,
                      //                 children: [
                      //                   Headline('MM09123478'),
                      //                   BodyText('On transmit area'),
                      //                 ],
                      //               ),
                      //               Spacer(),
                      //               SimpleText('Pending')
                      //             ],
                      //           ),
                      //         ),
                      //         Divider(),
                      //         Row(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: [
                      //             Container(
                      //               width: 60,
                      //               height: screenSize.height * 0.06,
                      //               decoration: BoxDecoration(
                      //                 borderRadius:
                      //                     BorderRadius.circular(20.0),
                      //               ),
                      //               child: IconButton(
                      //                 onPressed: () {
                      //                   showModalBottomSheet(
                      //                       context: context,
                      //                       isScrollControlled: true,
                      //                       builder:
                      //                           (BuildContext context) {
                      //                         return JobDetails_sheet();
                      //                       });
                      //                 },
                      //                 icon: SvgPicture.asset(AppIcons.Box),
                      //                 color: AppColors.greendark,
                      //               ),
                      //             ),
                      //             SizedBox(width: 8.0),
                      //             Column(
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.start,
                      //               children: [
                      //                 Headline('MM09123478'),
                      //                 BodyText('On transmit area'),
                      //               ],
                      //             ),
                      //             Spacer(),
                      //             SimpleText('Pending')
                      //           ],
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // if (selectedTab == "Pending")
                      //   Column(
                      //     children: [
                      //       SizedBox(
                      //         width: context.width,
                      //         height: context.height * 0.5,
                      //         child: SizedBox(
                      //           width: context.width * 0.9,
                      //           height: screenSize.height * 0.06,
                      //           child: Column(
                      //             children: [
                      //               InkWell(
                      //                 onTap: () {
                      //                   showModalBottomSheet(
                      //                       context: context,
                      //                       isScrollControlled: true,
                      //                       builder:
                      //                           (BuildContext context) {
                      //                         return JobDetails_sheet();
                      //                       });
                      //                 },
                      //                 child: Row(
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.center,
                      //                   children: [
                      //                     Container(
                      //                       width: 60,
                      //                       height:
                      //                           screenSize.height * 0.06,
                      //                       decoration: BoxDecoration(
                      //                         borderRadius:
                      //                             BorderRadius.circular(
                      //                                 20.0),
                      //                       ),
                      //                       child: IconButton(
                      //                         onPressed: () {},
                      //                         icon: SvgPicture.asset(
                      //                             AppIcons.Box),
                      //                         color: AppColors.greendark,
                      //                       ),
                      //                     ),
                      //                     SizedBox(width: 8.0),
                      //                     Column(
                      //                       crossAxisAlignment:
                      //                           CrossAxisAlignment.start,
                      //                       children: [
                      //                         Headline('MM09123478'),
                      //                         BodyText('On transmit area'),
                      //                       ],
                      //                     ),
                      //                     Spacer(),
                      //                     SimpleText('Pending')
                      //                   ],
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // if (selectedTab == "On process")
                      //   Column(
                      //     children: [
                      //       SizedBox(
                      //         width: context.width,
                      //         height: context.height * 0.5,
                      //         child: SizedBox(
                      //           width: context.width * 0.9,
                      //           height: screenSize.height * 0.06,
                      //           child: Column(
                      //             children: [
                      //               InkWell(
                      //                 onTap: () {
                      //                   showModalBottomSheet(
                      //                       context: context,
                      //                       isScrollControlled: true,
                      //                       builder:
                      //                           (BuildContext context) {
                      //                         return bottom_sheet();
                      //                       });
                      //                 },
                      //                 child: Row(
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.center,
                      //                   children: [
                      //                     Container(
                      //                       width: 60,
                      //                       height:
                      //                           screenSize.height * 0.06,
                      //                       decoration: BoxDecoration(
                      //                         borderRadius:
                      //                             BorderRadius.circular(
                      //                                 20.0),
                      //                       ),
                      //                       child: IconButton(
                      //                         onPressed: () {},
                      //                         icon: SvgPicture.asset(
                      //                             AppIcons.Box),
                      //                         color: AppColors.greendark,
                      //                       ),
                      //                     ),
                      //                     SizedBox(width: 8.0),
                      //                     Column(
                      //                       crossAxisAlignment:
                      //                           CrossAxisAlignment.start,
                      //                       children: [
                      //                         Headline('MM09123478'),
                      //                         BodyText('On transmit area'),
                      //                       ],
                      //                     ),
                      //                     Spacer(),
                      //                     SimpleText('On process')
                      //                   ],
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //       Divider(),
                      //     ],
                      //   ),
                      // if (selectedTab == "Completed")
                      //   Column(
                      //     children: [
                      //       SizedBox(
                      //         width: context.width,
                      //         height: context.height * 0.5,
                      //         child: SizedBox(
                      //           width: context.width * 0.9,
                      //           height: screenSize.height * 0.06,
                      //           child: Column(
                      //             children: [
                      //               InkWell(
                      //                 onTap: () {
                      //                   showModalBottomSheet(
                      //                       context: context,
                      //                       isScrollControlled: true,
                      //                       builder:
                      //                           (BuildContext context) {
                      //                         return JobDetails_sheet();
                      //                       });
                      //                 },
                      //                 child: Row(
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.center,
                      //                   children: [
                      //                     Container(
                      //                       width: 60,
                      //                       height:
                      //                           screenSize.height * 0.06,
                      //                       decoration: BoxDecoration(
                      //                         borderRadius:
                      //                             BorderRadius.circular(
                      //                                 20.0),
                      //                       ),
                      //                       child: IconButton(
                      //                         onPressed: () {},
                      //                         icon: SvgPicture.asset(
                      //                             AppIcons.Box),
                      //                         color: AppColors.greendark,
                      //                       ),
                      //                     ),
                      //                     SizedBox(width: 8.0),
                      //                     Column(
                      //                       crossAxisAlignment:
                      //                           CrossAxisAlignment.start,
                      //                       children: [
                      //                         Headline('MM09123478'),
                      //                         BodyText('On transmit area'),
                      //                       ],
                      //                     ),
                      //                     Spacer(),
                      //                     SimpleText('Completed')
                      //                   ],
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
