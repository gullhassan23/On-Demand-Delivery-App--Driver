// // ignore_for_file: camel_case_types

// import 'package:flutter/material.dart';
// import 'package:driverapp/widgets/font.dart';
// import '../../widgets/notificationRow.dart';

// class customernotification extends StatefulWidget {
//   customernotification({super.key});

//   @override
//   State<customernotification> createState() => _customernotificationState();
// }

// class _customernotificationState extends State<customernotification> {
//   @override
//   Widget build(BuildContext context) {
//     // Calculate dynamic padding based on screen size
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     double paddingValue = screenWidth * 0.03; // 5% of screen width
//     var screenSize = MediaQuery.of(context).size;

//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           color: Colors.transparent,
//           padding: EdgeInsets.all(0), // Optional: Remove padding if needed
//           splashRadius: 40, // Optional: Set the splash radius to match the borderRadius
//           splashColor: Colors.transparent, // Optional: Set the splash color to transparent
//           highlightColor: Colors.transparent, // Optional: Set the highlight color to transparent
//         ),
//         title: Headline("Notification"),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(height: screenSize.height*0.02),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Headline("Recent"),
//                     SizedBox(width: 100),
//                     TextButton(
//                       onPressed: () {},
//                       child: Text(
//                         'Clear All',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.green,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Divider(),
//               SizedBox(height: screenSize.height*0.02),
//               CustomRowWidget2(
//                 heading: 'Kathryn Sent You a ',
//                 Textbottom: 'Message', date: DateTime.now(),
           
//               ),
//               Divider(),
//               SizedBox(height: screenSize.height*0.02),
//               CustomRowWidget2(
//                 heading: 'Your Shipping Already  ',
//                 Textbottom: 'Delivered',
//               date: DateTime.now(),
//               ),
//               Divider(),
//               SizedBox(height: screenSize.height*0.02),
//               CustomRowWidget2(
//                 heading: 'Try the latest Services From ',
//                 Textbottom: 'Tracky!',
//               date: DateTime.now(),
//               ),
//               Divider(),
//               SizedBox(height: screenSize.height*0.02),
//               CustomRowWidget2(
//                 heading: 'Get 20% Discount for First ',
//                 Textbottom: 'Transaction',
//             date: DateTime.now(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driverapp/global/refs.dart';
import 'package:driverapp/models/notificationmodel.dart';
import 'package:flutter/material.dart';
import 'package:driverapp/widgets/font.dart';
import 'package:get/get.dart';
import '../../message_module/messege_view.dart';
import '../../models/customers.dart';
import '../../models/jobs.dart';
import '../../services/user_services.dart';
import '../../widgets/notificationRow.dart';
import '../ondemand/ondemand.dart';

class customernotification extends StatefulWidget {
  customernotification({super.key});

  @override
  State<customernotification> createState() => _customernotificationState();
}

class _customernotificationState extends State<customernotification> {
  UserServices controller = Get.find<UserServices>();

  @override
  Widget build(BuildContext context) {
    // Calculate dynamic padding based on screen size
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double paddingValue = screenWidth * 0.03; // 5% of screen width
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
          color: Colors.transparent,
          padding: EdgeInsets.all(0), // Optional: Remove padding if needed
          splashRadius:
              40, // Optional: Set the splash radius to match the borderRadius
          splashColor: Colors
              .transparent, // Optional: Set the splash color to transparent
          highlightColor: Colors
              .transparent, // Optional: Set the highlight color to transparent
        ),
        title: Headline("Notification"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenSize.height * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Headline("Recent"),
                    SizedBox(width: 100),
                    TextButton(
                      onPressed: () {
                        print(controller.driver.id);
                        print(controller.driver.id);
                        notificationRef
                            .doc(controller.driver
                                .id) // Replace with the document ID or path
                            .collection("notification")
                            .doc()
                            .delete()
                            .then((_) {
                          print("Document successfully deleted");
                          notificationRef
                              .doc(controller.driver.id).collection("notification").doc()
                              .get()
                              .then((docSnapshot) {
                            if (docSnapshot.exists) {
                              print("Document still exists");
                            } else {
                              print("Document doesn't exist");
                            }
                          }).catchError((error) {
                            print("Error fetching document: $error");
                          });
                        }).catchError((error) {
                          print("Error deleting document: $error");
                        });

                        // notificationRef // Replace with your collection name
                        //     .doc(controller.driver
                        //         .id) // Replace with the document ID or path
                        //     .delete()
                        //     .then((_) {
                        //   print("Document successfully deleted");
                        // }).catchError((error) {
                        //   print("Error deleting document: $error");
                        // });
                        // notificationRef
                        //     .doc(controller.driver.id)
                        //     .get()
                        //     .then((docSnapshot) {
                        //   if (docSnapshot.exists) {
                        //     print("Document still exists");
                        //   } else {
                        //     print(
                        //         "Document doesn't exist"); // Expected result after deletion
                        //   }
                        // }).catchError((error) {
                        //   print("Error fetching document: $error");
                        // });
                      },
                      child: Text(
                        'Clear All',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              // Text(controller.driver.id.toString()),
              StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: notificationRef
                      .doc(controller.driver.id)
                      .collection("notification")
                      .orderBy("created", descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    print(snapshot.data!.docs.length);
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          // var document = snapshot.data!.docs[index];
                          List<DocumentSnapshot> documents =
                              snapshot.data!.docs;
                          List<NotificationModel> notification =
                              documents.map((doc) {
                            return NotificationModel.fromMap(
                                doc.data() as Map<String, dynamic>);
                          }).toList();

                          return Column(
                            children: [
                              CustomRowWidget2(
                                heading: notification[index].title.toString(),
                                Textbottom: notification[index].body.toString(),
                                date: notification[index].created!,
                                onTap: () async {
                                  print("ontap ${notification[index].jobid}");
                                  print(
                                      "ontap sender${notification[index].senderid}");
                                  if (notification[index].jobid.toString() !=
                                      "") {
                                    print("ontap if");

                                    await jobsRef
                                        .doc(notification[index]
                                            .jobid
                                            .toString())
                                        .get()
                                        .then((value) async {
                                      if (value.data() != null) {
                                        JobModel jobdata =
                                            JobModel.fromMap(value.data()!);
                                        Get.to(() => OnDemandScreen(
                                              offerdata: jobdata,
                                            ));
                                      }
                                    });
                                  } else {
                                    print("ontap else");

                                    await customersRef
                                        .doc(notification[index]
                                            .senderid
                                            .toString())
                                        .get()
                                        .then((value) async {
                                      print("ontap value ${value.data()}");

                                      if (value.data() != null) {
                                        CustomerModel customer =
                                            CustomerModel.fromMap(
                                                value.data()!);
                                        Get.to(() =>
                                            ChatScreen(receiverUser: customer));
                                      }
                                    });
                                  }
                                },
                              ),
                              Divider(),
                            ],
                          );
                        });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
