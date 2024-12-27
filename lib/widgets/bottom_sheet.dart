// import 'package:driverapp/screens/Available-Orders/DetailLocation.dart';
// import 'package:driverapp/screens/MyProfile/chatscreen.dart';
// import 'package:driverapp/widgets/buttons.dart';
// import 'package:driverapp/widgets/font.dart';
// import 'package:flutter/material.dart';

// class bottom_sheet extends StatefulWidget {
//    bottom_sheet({super.key});

//   @override
//   State<bottom_sheet> createState() => _bottom_sheetState();
// }

// class _bottom_sheetState extends State<bottom_sheet> {

//     List<StepperData> myStepperData = [
//     StepperData(
//       title: '1213 Washington Blvd, Belpre , OH',
//       subtitle: '18 January 2022, 4:38 PM',
//       iconData: Icons.my_location_outlined,
//     ),
//     StepperData(
//       title: '415 W Erin Rd, Van Wert , OH',
//       subtitle: '18 January 2022',
//       iconData: Icons.my_location_outlined,
//     ),
//     StepperData(
//       title: '1110 Elida Ave, Delphos,OH',
//       subtitle: '18 January 2022',
//       iconData: Icons.my_location_outlined,
//     ),
//     StepperData(
//       title: '121 Pike St, Marietta,OH ',
//       subtitle: '18 January 2022',
//       iconData: Icons.location_pin,
//     ),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;

//     return Padding(
//           padding:  EdgeInsets.all(16.0), // Add padding from all sides
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                  SizedBox(height: screenSize.height*0.02),
//                  Text("Your package on the Way",
//                     style: TextStyle(fontSize: 20)),
//                 SizedBox(height: screenSize.height*0.01),
//                  Text("Arriving at pickup point in 2 mins."),
//                 SizedBox(height: screenSize.height*0.02),
//                  Divider(),
//                 SizedBox(height: screenSize.height*0.01),
//                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                      Headline('Electronics'),

//                     TextButton(

//                      onPressed: () => _Dropoff(context),

//                     child:  Text('Complete drop off',style:
//                     TextStyle(
//                       color: Colors.green,
//                     ),
//                     )
//                     ),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       width: 50,
//                       height: screenSize.height*0.05,
//                       decoration:  BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors
//                             .white, // Optional: Set the background color of the container
//                       ),
//                       child:  CircleAvatar(
//                         radius: 24.0, // Set the radius of the circle
//                         backgroundImage: AssetImage(
//                             "assets/images/will.jpeg"), // Replace with the path to your image asset
//                       ),
//                     ),
//                      SizedBox(width: 8.0),
//                      Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Harry Johnson", style: TextStyle(fontSize: 18)),
//                         Icon(Icons.star, color: Colors.green),
//                         SizedBox(width: 20),
//                         Text("4.9"),
//                       ],
//                     ),
//                      Spacer(),
//                     IconButton(
//                       icon:  Icon(Icons.phone),
//                       onPressed: () {
//                         // Add phone button onPressed action
//                       },
//                     ),
//                     IconButton(
//                       icon:  Icon(Icons.message),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) =>  ChatScreen()),
//                         );
//                       },
//                     )
//                   ],
//                 ),
//                  Divider(),
//                  SizedBox(
//                   height: screenSize.height*0.03,
//                 ),
//                  Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       children: [
//                         Headline("MM09130520"),
//                         BodyText("Track Number"),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Headline("1-3 Hours"),
//                         BodyText("Estimate Time"),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Headline("5.5kg"),
//                         BodyText("Package Weight"),
//                       ],
//                     ),
//                   ],
//                 ),
//                  Divider(),
//                  SizedBox(
//                   height: screenSize.height*0.03,
//                 ),
//                 AnotherStepper(
//                   stepperList: myStepperData,
//                   stepperDirection: Axis.vertical,
//                   iconWidth: 40,
//                   iconHeight: screenSize.height*0.04,
//                 ),
//                  SizedBox(
//                   height: screenSize.height*0.03,
//                 ),
//                 CustomElevatedButton(text: "Mark as Dilivered", onPressed: () {}),
//               ],
//             ),
//           ),
//         );
//   }
// }

// //job deatils

// class JobDetails_sheet extends StatefulWidget {
//    JobDetails_sheet({super.key});

//   @override
//   State<JobDetails_sheet> createState() => _JobDetails_sheetState();
// }

// class _JobDetails_sheetState extends State<JobDetails_sheet> {

//     List<StepperData> myStepperData = [
//     StepperData(
//       title: '1213 Washington Blvd, Belpre , OH',
//       subtitle: '18 January 2022, 4:38 PM',
//       iconData: Icons.my_location_outlined,
//     ),
//     StepperData(
//       title: '415 W Erin Rd, Van Wert , OH',
//       subtitle: '18 January 2022',
//       iconData: Icons.my_location_outlined,
//     ),
//     StepperData(
//       title: '1110 Elida Ave, Delphos,OH',
//       subtitle: '18 January 2022',
//       iconData: Icons.my_location_outlined,
//     ),
//     StepperData(
//       title: '121 Pike St, Marietta,OH ',
//       subtitle: '18 January 2022',
//       iconData: Icons.location_pin,
//     ),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;

//     return Padding(
//           padding:  EdgeInsets.all(16.0), // Add padding from all sides
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SizedBox(height: screenSize.height*0.02),
//                  Headline('Your Job Details'),
//                 SizedBox(height: screenSize.height*0.01),
//                  Divider(),
//                 SizedBox(height: screenSize.height*0.01),

//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       width: 50,
//                       height: screenSize.height*0.05,
//                       decoration:  BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors
//                             .white, // Optional: Set the background color of the container
//                       ),
//                       child:  CircleAvatar(
//                         radius: 24.0, // Set the radius of the circle
//                         backgroundImage: AssetImage(
//                             "assets/images/will.jpeg"), // Replace with the path to your image asset
//                       ),
//                     ),
//                      SizedBox(width: 8.0),
//                      Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Harry Johnson", style: TextStyle(fontSize: 18)),
//                         Icon(Icons.star, color: Colors.green),
//                         SizedBox(width: 20),
//                         Text("4.9"),
//                       ],
//                     ),
//                      Spacer(),
//                     IconButton(
//                       icon:  Icon(Icons.phone),
//                       onPressed: () {
//                         // Add phone button onPressed action
//                       },
//                     ),
//                     IconButton(
//                       icon:  Icon(Icons.message),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) =>  ChatScreen()),
//                         );
//                       },
//                     )
//                   ],
//                 ),
//                  Divider(),
//                  SizedBox(
//                   height: screenSize.height*0.03,
//                 ),
//                  Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       children: [
//                         Headline("MM09130520"),
//                         BodyText("Track Number"),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Headline("1-3 Hours"),
//                         BodyText("Estimate Time"),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Headline("5.5kg"),
//                         BodyText("Package Weight"),
//                       ],
//                     ),
//                   ],
//                 ),
//                  Divider(),
//                  SizedBox(
//                   height: screenSize.height*0.03,
//                 ),
//                 AnotherStepper(
//                   stepperList: myStepperData,
//                   stepperDirection: Axis.vertical,
//                   iconWidth: 40,
//                   iconHeight: screenSize.height*0.04,
//                 ),
//                  SizedBox(
//                   height: screenSize.height*0.03,
//                 ),
//                 CustomElevatedButton(text: "Start Shipment", onPressed: () {}),
//               ],
//             ),
//           ),
//         );
//   }
// }

// void _Dropoff(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     builder: (BuildContext context) {
//       double screenHeight = MediaQuery.of(context).size.height;
//       double screenWidth = MediaQuery.of(context).size.width;
//     var screenSize = MediaQuery.of(context).size;

//       return SingleChildScrollView(
//         child: Container(
//           height: screenHeight * 0.7,
//           padding:  EdgeInsets.only(top: 10, bottom: 24),
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                  Color(0xffFDFDFE).withOpacity(0),
//                  Color(0xffFDFDFE),
//               ],
//             ),
//           ),
//           child: Stack(
//             children: [
//                SheetBack(),
//               Positioned(
//                 top: 0,
//                 child: SizedBox(
//                   height: screenHeight * 0.6,
//                   width: screenWidth,
//                   child: Container(
//                     width: double.infinity,
//                     height: double.infinity,
//                     decoration:  BoxDecoration(
//                       image: DecorationImage(
//                         image: AssetImage('assets/images/Frame 162397 (1).png'),
//                         fit: BoxFit.fitHeight,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 bottom: 5,
//                 left: screenWidth * 0.1,
//                 right: screenWidth * 0.1,
//                 child: Container(
//                   height: screenHeight * 0.4,
//                   width: screenWidth * 0.8,
//                   color: Colors.white,
//                   child: Column(
//                     children: [
//                        SizedBox(height: screenSize.height*0.04),
//                  Headline("Drop off Complete "),
//                 SizedBox(height: screenSize.height*0.02),
//                  BodyText("Take a picture of your delivery as a proof"),
//                 SizedBox(height: screenSize.height*0.01),
//                  BodyText("that you have deliverd your order."),

//                  SizedBox(height: screenSize.height*0.04),
//                 CustomElevatedButton(
//                   text: 'Take Picture of Delivery',
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) =>   DetailLocation()),
//                     );
//                   },
//                 ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driverapp/controllers/jobscontroller.dart';
import 'package:driverapp/models/customers.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';
import '../global/refs.dart';
import '../message_module/messege_view.dart';
import '../models/jobs.dart';
import '../screens/Available-Orders/DetailLocation.dart';
import '../screens/ondemand/ondemand.dart';
import '../services/user_services.dart';
import 'buttons.dart';
import 'font.dart';

class bottom_sheet extends StatefulWidget {
  JobModel jobddata;

  bottom_sheet({required this.jobddata, super.key});

  @override
  State<bottom_sheet> createState() => _bottom_sheetState();
}

class _bottom_sheetState extends State<bottom_sheet> {
  JobContoller controller = Get.find<JobContoller>();
  UserServices _services = Get.find<UserServices>();

  DashboardContoller _dashboardContoller = Get.find<DashboardContoller>();

  List<StepperData> myStepperData = [];
  @override
  void initState() {
    myStepperData.add(
      StepperData(
        title: "${widget.jobddata.pickup!.address}",
        subtitle: '',
        iconData: Icons.my_location_outlined,
      ),
    );
    myStepperData.add(
      StepperData(
        title: "${widget.jobddata.dropoff!.address}",
        subtitle: '',
        iconData: Icons.location_pin,
      ),
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(16.0), // Add padding from all sides
      child: SingleChildScrollView(
          child:
              //    Obx(
              // () =>
              GetBuilder<JobContoller>(
        builder: (controller) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Headline('${widget.jobddata.item!.name}'),
                widget.jobddata.status.toString() == "2"
                    ? TextButton(
                        onPressed: () => Dropoffcamera(context),
                        child: Text(
                          'Complete drop off',
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ))
                    : SizedBox(),
              ],
            ),
            widget.jobddata.status.toString() == "2" &&
                    controller.imagepath != ""
                ? Image.file(
                    File(controller.imagepath
                        .toString()), // Import 'dart:io' and use File() to create a File object
                    width: 200, // Set width (adjust as needed)
                    height: 200, // Set height (adjust as needed)
                    fit: BoxFit.cover, // Adjust the fit as needed
                  )
                : SizedBox(),
            // const SizedBox(height: 10),
            // const Text("Arriving at pickup point in 2 mins."),
            // const SizedBox(height: 20),
            // const Divider(),
            // const SizedBox(height: 10),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Customers')
                    .where("id",
                        isEqualTo: widget.jobddata
                            .from) // Replace with your Firestore collection
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  // if (snapshot.connectionState == ConnectionState.waiting) {
                  //   return CircularProgressIndicator();
                  // }
                  else {
                    CustomerModel customer = CustomerModel.fromMap(
                        snapshot.data!.docs.first.data()
                            as Map<String, dynamic>);
                    return Column(
                      children: [
                        widget.jobddata.status.toString() == "3" &&
                                widget.jobddata.image != ""
                            ? CachedNetworkImage(
                                imageUrl: widget.jobddata.image
                                    .toString(), // Replace this with your actual image URL
                                width: 200, // Set width (adjust as needed)
                                height: 200, // Set height (adjust as needed)
                                fit: BoxFit.cover, // Adjust the fit as needed
                                placeholder: (context, url) => Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.green,
                                )), // Placeholder widget while loading
                                errorWidget: (context, url, error) => Icon(
                                    Icons.error), // Widget to display on error
                              )
                            : Container(),
                        SizedBox(
                          height: screenSize.height * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            customer.profile.toString() == ""
                                ? Container(
                                    width: 50,
                                    height: 50,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors
                                          .white, // Optional: Set the background color of the container
                                    ),
                                    child: CircleAvatar(
                                        radius:
                                            24.0, // Set the radius of the circle
                                        backgroundImage:
                                            // widget.jobdata.driverdetail!.profile.toString()==""?
                                            AssetImage(
                                                "assets/images/will.jpeg")
                                        //  :
                                        //  NetworkImage("${widget.jobdata.driverdetail!.profile.toString()}"), // Replace with the path to your image asset
                                        ),
                                  )
                                : Container(
                                    width: 50,
                                    height: 50,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors
                                          .white, // Optional: Set the background color of the container
                                    ),
                                    child: CircleAvatar(
                                      radius:
                                          24.0, // Set the radius of the circle
                                      backgroundImage:
                                          // widget.jobdata.driverdetail!.profile.toString()==""?
                                          //  AssetImage( "assets/images/will.jpeg")
                                          //  :
                                          NetworkImage(
                                              "${customer.profile.toString()}"), // Replace with the path to your image asset
                                    ),
                                  ),
                            const SizedBox(width: 8.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${customer.name.toString()}",
                                    style: TextStyle(fontSize: 18)),
                                Icon(Icons.star, color: Colors.green),
                                SizedBox(width: 20),
                                Text("4.8"),
                              ],
                            ),
                            const Spacer(),
                            // IconButton(
                            //   icon: const Icon(Icons.phone),
                            //   onPressed: () {
                            //     // Add phone button onPressed action
                            //   },
                            // ),
                            IconButton(
                              icon: const Icon(Icons.message),
                              onPressed: () {
                                Get.to(
                                    () => ChatScreen(receiverUser: customer));
                              },
                            )
                          ],
                        ),
                      ],
                    );
                  }
                }),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     widget.jobddata.toString() == ""
            //         ? Container(
            //             width: 50,
            //             height: 50,
            //             decoration: const BoxDecoration(
            //               shape: BoxShape.circle,
            //               color: Colors
            //                   .white, // Optional: Set the background color of the container
            //             ),
            //             child: CircleAvatar(
            //                 radius: 24.0, // Set the radius of the circle
            //                 backgroundImage:
            //                     // widget.jobddata.driverdetail!.profile.toString()==""?
            //                     AssetImage("assets/images/will.jpeg")
            //                 //  :
            //                 //  NetworkImage("${widget.jobddata.driverdetail!.profile.toString()}"), // Replace with the path to your image asset
            //                 ),
            //           )
            //         : Container(
            //             width: 50,
            //             height: 50,
            //             decoration: const BoxDecoration(
            //               shape: BoxShape.circle,
            //               color: Colors
            //                   .white, // Optional: Set the background color of the container
            //             ),
            //             child: CircleAvatar(
            //               radius: 24.0, // Set the radius of the circle
            //               backgroundImage:
            //                   // widget.jobddata.driverdetail!.profile.toString()==""?
            //                   //  AssetImage( "assets/images/will.jpeg")
            //                   //  :
            //                   NetworkImage(
            //                       "${_services.driver.profile.toString()}"), // Replace with the path to your image asset
            //             ),
            //           ),

            //     const SizedBox(width: 8.0),
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text("${_services.driver.name.toString()}",
            //             style: TextStyle(fontSize: 18)),
            //         Icon(Icons.star, color: Colors.green),
            //         SizedBox(width: 20),
            //         Text("4.9"),
            //       ],
            //     ),
            //     const Spacer(),
            //     // IconButton(
            //     //   icon: const Icon(Icons.phone),
            //     //   onPressed: () {
            //     //     // Add phone button onPressed action
            //     //   },
            //     // ),
            //     IconButton(
            //       icon: const Icon(Icons.message),
            //       onPressed: () {
            //         customersRef
            //             .doc(widget.jobddata.from.toString())
            //             .get()
            //             .then((value) {
            //           print("value ${value}");
            //           CustomerModel customer = CustomerModel.fromMap(value);
            //           print("customer ${customer.devicetoken}");

            //           Get.to(() => ChatScreen(receiverUser: customer));
            //         });

            //         // Navigator.push(
            //         //   context,
            //         //   MaterialPageRoute(builder: (context) => ChatScreen()),
            //         // );
            //         // CustomerModel customerdate=widget.jobddata.customer;
            //         // Get.to(() => ChatScreen(receiverUser: widget.jobddata!));
            //       },
            //     )
            //   ],
            // ),
            const Divider(),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Headline(
                      "${widget.jobddata!.id.toString()}",
                      fontsize: 15,
                    ),
                    BodyText("Track Number"),
                  ],
                ),
                // Column(
                //   children: [
                //     Headline("1-3 Hours"),
                //     BodyText("Estimate Time"),
                //   ],
                // ),
                Column(
                  children: [
                    Headline("${widget.jobddata.item!.weight.toString()}"),
                    BodyText("Package Weight"),
                  ],
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                Get.back();

                Get.to(() => OnDemandScreen(
                      offerdata: widget.jobddata,
                    ));
                // Perform an action when the button is pressed
              },
              child: Text('Show Details'),
            ),
            const Divider(),
            const SizedBox(
              height: 30,
            ),
            AnotherStepper(
              stepperList: myStepperData,
              stepperDirection: Axis.vertical,
              iconWidth: 40,
              iconHeight: 40,
            ),
            const SizedBox(
              height: 30,
            ),
            widget.jobddata.status.toString() == "1"
                ? CustomElevatedButton(
                    text: "Mark as On Process",
                    onPressed: () {
                      jobsRef.doc(widget.jobddata.id).update({
                        "status": 2,
                      }).then((value) {
                        _dashboardContoller.sendNotification(
                            type: "Order Status",
                            data:
                                "Your Order ${widget.jobddata.id} is on process",
                            context: context,
                            id: widget.jobddata.from.toString(),
                            jobdata: widget.jobddata,
                            clickaction: 'job');
                        Get.back();
                      });
                    })
                : widget.jobddata.status.toString() == "2" &&
                        controller.imagepath != ""
                    ? CustomElevatedButton(
                        text: "Mark as Delivered",
                        onPressed: () {
                          jobsRef.doc(widget.jobddata.id).update({
                            "status": 3,
                          }).then((value) async {
                            controller
                                .uploadinstorage(widget.jobddata.id.toString());

                            _dashboardContoller.sendNotification(
                                type: "Order Status",
                                data:
                                    "Your Order ${widget.jobddata.id} is Delivered",
                                context: context,
                                id: widget.jobddata.from.toString(),
                                jobdata: widget.jobddata,
                                clickaction: 'job');

                            Get.back();
                          });
                        })
                    : widget.jobddata.status.toString() == "3" &&
                            widget.jobddata.paymentstatus.toString() == "true"
                        ? CustomElevatedButton(
                            text: "Completed",
                            onPressed: () {
                              jobsRef.doc(widget.jobddata.id).update({
                                "status": 4,
                              }).then((value) {
                                _dashboardContoller.sendNotification(
                                    type: "Order Status",
                                    data:
                                        "Your Order ${widget.jobddata.id} is Completed",
                                    context: context,
                                    id: widget.jobddata.from.toString(),
                                    jobdata: widget.jobddata,
                                    clickaction: 'job');

                                Get.back();
                              });
                            })
                        : Container(),
          ],
        ),
      )),
    );
  }
}

//job deatils

class JobDetails_sheet extends StatefulWidget {
  const JobDetails_sheet({super.key});

  @override
  State<JobDetails_sheet> createState() => _JobDetails_sheetState();
}

class _JobDetails_sheetState extends State<JobDetails_sheet> {
  List<StepperData> myStepperData = [
    StepperData(
      title: '1213 Washington Blvd, Belpre , OH',
      subtitle: '18 January 2022, 4:38 PM',
      iconData: Icons.my_location_outlined,
    ),
    StepperData(
      title: '415 W Erin Rd, Van Wert , OH',
      subtitle: '18 January 2022',
      iconData: Icons.my_location_outlined,
    ),
    StepperData(
      title: '1110 Elida Ave, Delphos,OH',
      subtitle: '18 January 2022',
      iconData: Icons.my_location_outlined,
    ),
    StepperData(
      title: '121 Pike St, Marietta,OH ',
      subtitle: '18 January 2022',
      iconData: Icons.location_pin,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Add padding from all sides
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Headline('Your Job Details'),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Headline("MM09130520"),
                    BodyText("Track Number"),
                  ],
                ),
                Column(
                  children: [
                    Headline("1-3 Hours"),
                    BodyText("Estimate Time"),
                  ],
                ),
                Column(
                  children: [
                    Headline("5.5kg"),
                    BodyText("Package Weight"),
                  ],
                ),
              ],
            ),
            const Divider(),
            const SizedBox(
              height: 30,
            ),
            AnotherStepper(
              stepperList: myStepperData,
              stepperDirection: Axis.vertical,
              iconWidth: 40,
              iconHeight: 40,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomElevatedButton(text: "Pending", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
