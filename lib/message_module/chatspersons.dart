import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driverapp/widgets/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/customers.dart';
import 'chat_messege_service.dart';
import 'package:nb_utils/nb_utils.dart';

import 'chat_model.dart';
import 'constant.dart';
import 'package:intl/intl.dart';

import 'messege_view.dart';

class UserItemBuilder extends StatefulWidget {
  final String userUid;

  UserItemBuilder({required this.userUid});

  @override
  State<UserItemBuilder> createState() => _UserItemBuilderState();
}

class _UserItemBuilderState extends State<UserItemBuilder> {
  ChatMessageService chatMessageService = ChatMessageService();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return StreamBuilder<CustomerModel>(
      stream: chatMessageService.getUserDetailsById(id: widget.userUid),
      builder: (context, snap) {
              // print("snappp${snap.data!}");
              // print("snap${snap.data!.email}");
        if (snap.hasData) {
          CustomerModel data = snap.data!;

          return InkWell(
            onTap: () async {
              print("snap${snap.data!.id}");
              print("snap${snap.data!.email}");

           
              Get.to(() => ChatScreen(receiverUser: snap.data!));
          
            },
            child: Container(
              // padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                children: [
               data.profile.toString()==""?   SizedBox(
                    width: 60,
                    height: 60,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/alice.jpeg"),
                      radius: 30,
                    ),
                  ):SizedBox(
                    width: 60,
                    height: 60,
                    child: CircleAvatar(
                      backgroundColor: AppColors.primaryDark,
                      backgroundImage: NetworkImage(data.profile.toString()),
                      radius: 30,
                    ),
                  ),
                  16.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            data.name.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ).expand(),
                          StreamBuilder<int>(
                            stream: chatMessageService.getUnReadCount(
                                senderId: _auth.currentUser!.uid,
                                receiverId: data.id!),
                            builder: (context, snap) {
                              if (snap.hasData) {
                                if (snap.data != 0) {
                                  return Container(
                                    height: 18,
                                    width: 18,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.green),
                                    child: Text(
                                      snap.data.validate().toString(),
                                      style: secondaryTextStyle(
                                          size: 12, color: white),
                                    ).fit().center(),
                                  );
                                }
                              }
                              return SizedBox(height: 18, width: 18);
                            },
                          ),
                        ],
                      ),
                      4.height,
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          LastMessageChat(
                            stream: chatMessageService.fetchLastMessageBetween(
                                senderId: _auth.currentUser!.uid,
                                receiverId: widget.userUid),
                          ),
                        ],
                      ),
                    ],
                  ).expand(),
                ],
              ),
            ),
          );
        }
        return snapWidgetHelper(snap,
            errorWidget: Offstage(), loadingWidget: Offstage());
      },
    );
  }
}

class LastMessageChat extends StatelessWidget {
  final stream;

  LastMessageChat({required this.stream});

  Widget typeWidget(ChatMessageModel message) {
    String? type = message.messageType;
    switch (type) {
      case TEXT:
        return SizedBox(
          // width: screenSize.width*0.5,
          child: Text(
            "${message.message.toString()}",
            style: const TextStyle(
              fontSize: 14.0,
            ),
            maxLines: 1,
          ),
        );
      case IMAGE:
        return Row(
          children: [
            Icon(Icons.photo_sharp, size: 16),
            6.width,
            Text('Image', style: secondaryTextStyle(size: 16)),
          ],
        );
      case VIDEO:
        return Row(
          children: [
            Icon(Icons.videocam_outlined, size: 16),
            6.width,
            Text('Video', style: secondaryTextStyle(size: 16)),
          ],
        );
      case AUDIO:
        return Row(
          children: [
            Icon(Icons.audiotrack, size: 16),
            6.width,
            Text('Audio', style: secondaryTextStyle(size: 16)),
          ],
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          var docList = snapshot.data!.docs;

          if (docList.isNotEmpty) {
            ChatMessageModel message = ChatMessageModel.fromJson(
                docList.last.data() as Map<String, dynamic>);
            String time = '';
            DateTime date =
                DateTime.fromMicrosecondsSinceEpoch(message.createdAt! * 1000);
            time = DateFormat('hh:mm a').format(
                DateTime.fromMicrosecondsSinceEpoch(message.createdAt! * 1000));

            /*  if (date.day == DateTime.now().day) {
              time = DateFormat('hh:mm a').format(DateTime.fromMicrosecondsSinceEpoch(message.createdAt! * 1000));
            } else {
              time = DateFormat('dd/MM/yyy').format(DateTime.fromMicrosecondsSinceEpoch(message.createdAt! * 1000));
            }*/
            return Row(
              children: [
                typeWidget(message).expand(),
                Text(
                  " ${time}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ).paddingTop(2).expand();
          }
          return Text("", style: TextStyle(color: Colors.grey, fontSize: 14));
        }
        return Text("..", style: TextStyle(color: Colors.grey, fontSize: 14));
      },
    );
  }
}
