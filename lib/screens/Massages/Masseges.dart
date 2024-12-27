// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driverapp/screens/MyProfile/notification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../message_module/chat_messege_service.dart';
import '../../message_module/chatspersons.dart';
import '../../message_module/contact_model.dart';
import '../../message_module/pagination.dart';
import '../../widgets/Row.dart';

class Massages extends StatefulWidget {
  Massages({super.key});

  @override
  State<Massages> createState() => _MassagesState();
}

class _MassagesState extends State<Massages> {
  ChatMessageService chatMessageService = ChatMessageService();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: // Add padding from all sides
          Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0), // Add padding from all sides
            child: Column(children: [
              SizedBox(
                    height: screenSize.height * 0.035,
                  ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Text(
                    " Massages",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  // IconButton(
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => customernotification()),
                  //     );
                  //   },
                  //   icon: Icon(Icons.notifications_active),
                  //   color: Colors.white,
                  // ),
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
                  hintText: 'Search Messages',
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
              // Container(
              //   height: screenSize.height*0.04.0, // Adjust the height as per your requirements
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(
              //         10.0), // Adjust the radius for rounded corners
              //     color: Colors.green, // Background color
              //     border: Border.all(color: Colors.green), // Border color
              //   ),
              //   child: TextFormField(
              //     style: TextStyle(color: Colors.white), // Text color
              //     decoration: InputDecoration(
              //       prefixIcon: Icon(
              //         Icons.search,
              //         color: Colors.white, // Icon color
              //       ),
              //       hintText: 'Search Messages',
              //       hintStyle: TextStyle(
              //           color: Colors.white,
              //           fontWeight: FontWeight.bold), // Hint text color
              //       border: InputBorder.none, // Remove default border
              //     ),
              //   ),
              // )
            ]),
          ),
          SizedBox(
            height: screenSize.height * 0.05,
          ),
          Expanded(
            child: Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  // You can adjust the padding value as needed
                  child: StreamBuilder(
                    stream: chatMessageService
                        .fetchChatListQuery(userId: _auth.currentUser!.uid)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return LoaderWidget(); // Show loader while fetching data
                      } else if (snapshot.hasError) {
                        return BackgroundComponent(); // Show error component if there's an error
                      } else if (!snapshot.hasData ||
                          snapshot.data!.docs.isEmpty) {
                        return BackgroundComponent(); // Show empty component if no data
                      } else {
                        print("contact ${snapshot.data!.docs.length}");
                        // Process the data retrieved
                        return ListView.builder(
                          padding: EdgeInsets.only(
                              left: 0, top: 8, right: 0, bottom: 0),
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            ContactModel contact = ContactModel.fromJson(
                                snapshot.data!.docs[index].data()
                                    as Map<String, dynamic>);

                            print("contact uid ${contact.uid!}");

                            return UserItemBuilder(userUid: contact.uid!);
                          },
                        );
                      }
                    },
                  ),
                )),
          ),
          // Container(
          //     color: Colors.white,
          //     child: Padding(
          //       padding: EdgeInsets.all(3.0),
          //       // You can adjust the padding value as needed
          //       child: Column(
          //         children: [
          //           SingleChildScrollView(
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 MessageCustomRow(
          //                     heading: "Maddy Lin",
          //                     image: "assets/images/alice.jpeg",
          //                     bodyText: "Hai Rizal , I'm on the way to Your",
          //                     price: "3:47 Pm"),
          //                 Divider(),
          //                 SizedBox(
          //                   height: screenSize.height * 0.02,
          //                 ),
          //                 MessageCustomRow(
          //                     heading: "Sarah Jen ",
          //                     image: "assets/images/sarah.jpeg",
          //                     bodyText: "woohooo",
          //                     price: "6:32 Pm"),
          //                 Divider(),
          //                 SizedBox(
          //                   height: screenSize.height * 0.02,
          //                 ),
          //                 MessageCustomRow(
          //                     heading: "Ron Edward",
          //                     image: "assets/images/Ron.jpeg",
          //                     bodyText: "Haha that's terrifying",
          //                     price: "7:22 Pm"),
          //                 Divider(),
          //                 SizedBox(
          //                   height: screenSize.height * 0.02,
          //                 ),
          //                 MessageCustomRow(
          //                     heading: "Alice Adam",
          //                     image: "assets/images/maddy.jpeg",
          //                     bodyText: "Wow , this is really epic",
          //                     price: "Yesterday"),
          //                 Divider(),
          //                 SizedBox(
          //                   height: screenSize.height * 0.02,
          //                 ),
          //                 MessageCustomRow(
          //                     heading: "Jassica Ben",
          //                     image: "assets/images/jessica.jpeg",
          //                     bodyText: "How are you?",
          //                     price: "Yesterday"),
          //                 Divider(),
          //                 SizedBox(
          //                   height: screenSize.height * 0.02,
          //                 ),
          //                 MessageCustomRow(
          //                     heading: "Will smith",
          //                     image: "assets/images/will.jpeg",
          //                     bodyText: "Just ideas for nexttime",
          //                     price: "Yesterday"),
          //                 Divider(),
          //                 SizedBox(
          //                   height: screenSize.height * 0.07,
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ],
          //       ),
          //     ))
      
        ],
      ),
    );
  }
}
