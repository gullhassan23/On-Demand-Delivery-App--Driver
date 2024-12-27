import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driverapp/controllers/dashboard_controller.dart';
import 'package:driverapp/models/jobs.dart';
import 'package:driverapp/widgets/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

import '../models/customers.dart';
import '../models/drivers.dart';
import 'chat_messege_service.dart';
import 'constant.dart';
import 'messges_controller.dart';
import 'userdata.dart';

bool isMe = true;

class ChatScreen extends StatefulWidget {
  CustomerModel receiverUser;
  // String name, reciverid, email;
  // ChatScreen(this.name, this.reciverid, this.email, {super.key});
  ChatScreen({required this.receiverUser, super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  MessageController controller = MessageController();
  ChatMessageService chatMessageService = ChatMessageService();
  DashboardContoller _dashboardContoller = DashboardContoller();

  final double kBubblePadding = 8;

  final BoxConstraints bubbleConstraints = const BoxConstraints(maxWidth: 250);

  final Color backgroundColor = Colors.white;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late ScrollController _scrollController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
    init();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void init() async {
    print(widget.receiverUser.email);

    // if (widget.receiverUser.id!.isEmpty) {
    //   print(widget.receiverUser.email);

    //   await controller
    //       .getUser(email: widget.receiverUser.email.toString())
    //       .then((value) {
    //     print("valueeee $value");
    //     // widget.reciverid = value!.uid;
    //   }).catchError((e) {
    //     print(e.toString());
    //   });
    // }
    controller.senderUser =
        await controller.getUser(email: widget.receiverUser.email.toString());
    // setState(() {});

    chatMessageService = ChatMessageService();
    controller.setUnReadStatusToTrue(
        senderId: _auth.currentUser!.uid,
        receiverId: widget.receiverUser.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        // fit: StackFit.expand,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 50,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Get.back();
                },
              ),
              // const SizedBox(width: 20),
             widget.receiverUser.profile.toString()==""?  SizedBox(
                width: 60,
                height: 60,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/alice.jpeg'),
                  radius: 30,
                ),
              ): SizedBox(
                width: 60,
                height: 60,
                child: CircleAvatar(
                  backgroundColor: AppColors.primaryDark,
                  backgroundImage: NetworkImage(widget.receiverUser.profile.toString()),
                  radius: 30,
                ),
              ),
              const SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.receiverUser.name.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    "",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              // IconButton(
              //   icon: const Icon(Icons.phone),
              //   onPressed: () {},
              // ),
              // IconButton(
              //   icon: const Icon(Icons.more_vert), // Vertical three dots icon
              //   onPressed: () {},
              // ),
            ],
          ),
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("messages")
                  .doc(_auth.currentUser!.uid.toString())
                  .collection(widget.receiverUser.id.toString())
                  .orderBy("createdAt", descending: false)
                  .snapshots(),
              builder: (context, snapshot) {
                // print("sssssssssss${snapshot.data!.docs.length}");
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                        controller: _scrollController,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: ((context, index) {
                          DocumentSnapshot data = snapshot.data!.docs[index];

                          isMe = data["senderId"] == _auth.currentUser!.uid;
                          String time;

                          DateTime date = DateTime.fromMicrosecondsSinceEpoch(
                              data["createdAt"] * 1000);
                          if (date.day == DateTime.now().day) {
                            time = formatDate(data["createdAt"].toString(),
                                format: HOUR_12_FORMAT,
                                isFromMicrosecondsSinceEpoch: true);
                          } else {
                            time = formatDate(data["createdAt"].toString(),
                                format: DATE_FORMAT_1,
                                isFromMicrosecondsSinceEpoch: true);
                          }
                          // print("timeee$time");

                          return Align(
                            alignment: isMe
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              margin: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color: isMe ? Colors.green : Colors.grey,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Text(
                                "${data["message"]}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          );
                        })),
                  );
                }
                return const CircularProgressIndicator();
              }),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: SizedBox(
                  height: 40.0, // Adjust the height as needed
                  child: TextFormField(
                    controller: controller.message,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20), // Removes vertical padding
                      hintText: 'Type a message...',
                      // prefixIcon:
                      //     const Icon(Icons.attach_file, color: Colors.grey),
                      // suffixIcon: const Icon(Icons.sentiment_satisfied,
                      //     color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            20.0), // Adjust the border radius as needed
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            30.0), // Adjust the border radius as needed
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                )),
                IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    String mess=controller.message.text;
                    controller
                        .sendMessages(widget.receiverUser.id.toString())
                        .then((value) {
                      _dashboardContoller.sendNotification(
                          type:
                              "${widget.receiverUser.name} sent you a message",
                          data: "${mess}",
                          context: context,
                          id: widget.receiverUser.id.toString(),
                          jobdata: JobModel(),
                          clickaction: 'message'
                          );
                    });
                    // Implement send message logic here
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget chatItem(String? messageTypes, String msg, bool ismsgread, String time) {
  print(messageTypes);
  // switch (messageTypes) {
  //   case TEXT:
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          msg,
          style: const TextStyle(color: Colors.white),
          maxLines: null,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              time,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
            isMe
                ? ismsgread
                    ? const Icon(Icons.done, size: 12, color: Colors.white60)
                    : const Icon(Icons.done_all,
                        size: 12, color: Colors.white60)
                : const Offstage()
          ],
        ),
      ],
    ),
  );

  // default:
  //   return Container(
  //     height: 200,
  //   );
  // }
}

String formatDate(String? dateTime,
    {String format = DATE_FORMAT_1,
    bool isFromMicrosecondsSinceEpoch = false}) {
  if (isFromMicrosecondsSinceEpoch) {
    return DateFormat(format).format(DateTime.fromMicrosecondsSinceEpoch(
        int.parse(dateTime.toString()) * 1000));
  } else {
    return DateFormat(format).format(DateTime.parse(dateTime.toString()));
  }
}
