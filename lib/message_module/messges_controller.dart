import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/drivers.dart';
import 'chat_messege_service.dart';
import 'chat_model.dart';
import 'contact_model.dart';
import 'userdata.dart';

class MessageController extends GetxController {
  TextEditingController message = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FocusNode messageFocus = FocusNode();
  ChatMessageService chatMessageService = ChatMessageService();
  late final DriverModel senderUser;

  // ref = fireStore.collection(MESSAGES_COLLECTION);

  @override
  void onInit() {
    // TODO: implement onInit
  }

  Stream<QuerySnapshot> fetchLastMessageBetween(
      {required String senderId, required String receiverId}) {
    return _firestore
        .collection("messages")
        .doc(senderId.toString())
        .collection(receiverId.toString())
        .orderBy(
          "createdAt",
          descending: false,
        )
        .snapshots();
  }

  Future<void> sendMessages(String reciverid) async {
    print("sender id ${_auth.currentUser!.uid}");
    print("reciverid id $reciverid");

    // If Message TextField is Empty.
    if (message.text.trim().isEmpty) {
      messageFocus.requestFocus();
      return;
    }
    String messege = message.text;
    message.clear();
    // Making Request for sending data to firebase
    ChatMessageModel data = ChatMessageModel();

    data.receiverId = reciverid;
    data.senderId = _auth.currentUser!.uid;
    data.message = messege;
    data.isMessageRead = false;
    data.createdAt = DateTime.now().millisecondsSinceEpoch;
    data.messageType = "text";

    message.clear();

    await addMessage(data).then((value) async {
      print("--Message Successfully Added--");

      // await addMessageToDb(
      //         senderRef: value,
      //         chatData: data,
      //         sender: senderUser,
      //         // receiverUser: widget.receiverUser)
      //         receiverUser: senderUser)
      //     .then((value) {
      //   //
      // }).catchError((e) {
      //   log(e.toString());
      // });
      print("recc 1   ${data.receiverId}");
      print("${data.senderId}");

      // DocumentReference receiverDoc =
      await _firestore
          .collection("messages")
          .doc(data.receiverId)
          .collection(data.senderId!)
          .add(data.toJson());
      print("recc 2   ${data.receiverId}");
      print("${data.senderId}");
      // DocumentReference rDoc =

      addToContacts(senderId: _auth.currentUser!.uid, receiverId: reciverid)
          .then((value) {
        //
        /// Save receiverId to Sender Doc.
        saveToContacts(senderId: _auth.currentUser!.uid, receiverId: reciverid)
            .then((value) => print("---ReceiverId to Sender Doc.---"))
            .catchError((e) {
          print(e.toString());
        });

        /// Save senderId to Receiver Doc.
        saveToContactsd(senderId: reciverid, receiverId: _auth.currentUser!.uid)
            .then((value) => print("---SenderId to Receiver Doc.---"))
            .catchError((e) {
          print(e.toString());
        });
      }).catchError((e) {
        print("e.toString() ${e.toString()}");
      });
    }).catchError((e) {
      print(e.toString());
    });
  }

  Future<void> saveToContacts(
      {required String senderId, required String receiverId}) async {
    print("driver");
    print(senderId);
    print(receiverId);
    return _firestore
        .collection("Drivers")
        .doc(senderId)
        .collection("contact")
        .doc(receiverId)
        .update({
      'lastMessageTime': DateTime.now().millisecondsSinceEpoch
    }).catchError((e) {
      print(senderId);
      print(receiverId);
      throw "USER_NOT_CREATED";
    });
  }

  Future<void> saveToContactsd(
      {required String senderId, required String receiverId}) async {
    print("customer");

    print(receiverId);
    print(senderId);

    return _firestore
        .collection("Customers")
        .doc(receiverId)
        .collection("contact")
        .doc(senderId)
        .update({
      'lastMessageTime': DateTime.now().millisecondsSinceEpoch
    }).catchError((e) {
      print(senderId);
      print(receiverId);
      throw "USER_NOT_CREATED";
    });
  }

  Future<DocumentReference> addMessage(ChatMessageModel data) async {
    var doc = await _firestore
        .collection("messages")
        .doc(data.senderId)
        .collection(data.receiverId!)
        .add(data.toJson());

    doc.update({'id': doc.id});
    return doc;
  }

  DocumentReference getContactsDocument({String? of, String? forContact}) {
    return _firestore
        .collection("Drivers")
        .doc(of)
        .collection("contact")
        .doc(forContact);
  }

  DocumentReference getContactsDocumentcustomer(
      {String? of, String? forContact}) {
    return _firestore
        .collection("Customers")
        .doc(forContact)
        .collection("contact")
        .doc(of);
  }

  addToContacts({String? senderId, String? receiverId}) async {
    Timestamp currentTime = Timestamp.now();

    await addToSenderContacts(senderId, receiverId, currentTime);
    await addToReceiverContacts(receiverId, senderId, currentTime);
  }

  Future<void> addToSenderContacts(
      String? senderId, String? receiverId, currentTime) async {
    DocumentSnapshot senderSnapshot =
        await getContactsDocument(of: senderId, forContact: receiverId).get();

    if (!senderSnapshot.exists) {
      //does not exists
      ContactModel receiverContact = ContactModel(
        uid: receiverId,
        addedOn: currentTime,
      );

      await getContactsDocument(of: senderId, forContact: receiverId)
          .set(receiverContact.toJson());
    }
  }

  Future<void> addMessageToDb(
      {required DocumentReference senderRef,
      required ChatMessageModel chatData,
      required DriverModel sender,
      DriverModel? receiverUser,
      File? image}) async {
    String imageUrl = '';

    if (image != null) {
      // String fileName = basename(image.path);
      // Reference storageRef = _storage
      //     .ref()
      //     .child("$CHAT_DATA_IMAGES/${getStringAsync(USER_ID)}/$fileName");

      // UploadTask uploadTask = storageRef.putFile(image);

      // await uploadTask.then((e) async {
      //   await e.ref.getDownloadURL().then((value) async {
      //     imageUrl = value;
      //   }).catchError((e) {
      //     log(e);
      //   });
      // }).catchError((e) {
      //   log(e);
      // });
    }

    updateChatDocument(senderRef, image: image, imageUrl: imageUrl);

    _firestore
        .collection("Customers")
        .doc(chatData.senderId)
        .update({"lastMessageTime": chatData.createdAt});
    addToContacts(senderId: chatData.senderId, receiverId: chatData.receiverId);

    DocumentReference receiverDoc = await _firestore
        .collection("messeges")!
        .doc(chatData.receiverId)
        .collection(chatData.senderId!)
        .add(chatData.toJson());

    DocumentReference rDoc = await _firestore
        .collection("messeges")!
        .doc(chatData.senderId)
        .collection(chatData.receiverId!)
        .add(chatData.toJson());

    // updateChatDocument(receiverDoc, image: image, imageUrl: imageUrl);

    _firestore
        .collection("Customers")!
        .doc(chatData.receiverId)
        .update({"lastMessageTime": chatData.createdAt});
  }

  DocumentReference? updateChatDocument(DocumentReference data,
      {File? image, String? imageUrl}) {
    Map<String, dynamic> sendData = {'id': data.id};

    if (image != null) {
      sendData.putIfAbsent('photoUrl', () => imageUrl);
    }
    log(sendData as String);
    data.update(sendData);

    log("Data $sendData");
    return null;
  }

  Future<void> addToReceiverContacts(
    String? senderId,
    String? receiverId,
    currentTime,
  ) async {
    DocumentSnapshot receiverSnapshot =
        await getContactsDocumentcustomer(of: receiverId, forContact: senderId)
            .get();

    if (!receiverSnapshot.exists) {
      //does not exists
      ContactModel senderContact = ContactModel(
        uid: receiverId,
        addedOn: currentTime,
      );
      await getContactsDocumentcustomer(of: receiverId, forContact: senderId)
          .set(senderContact.toJson());
    }
  }

  //  void onSendMessage() async {
  //   if (messege.text.isNotEmpty) {
  //     Map<String, dynamic> messages = {
  //       "sendby": _auth.currentUser!.uid,
  //       "message": messege.text,
  //       "type": "text",
  //       "time": FieldValue.serverTimestamp(),
  //     };

  //     messege.clear();
  //     await _firestore
  //         .collection('chatroom')
  //         .doc(chatRoomId)
  //         .collection('chats')
  //         .add(messages);
  //   } else {
  //     print("Enter Some Text");
  //   }
  // }
  Future<void> setUnReadStatusToTrue(
      {required String senderId,
      required String receiverId,
      String? documentId}) async {
        print("senderId ${senderId}");
        print("receiverId ${receiverId}");

    _firestore
        .collection("messages")
        .doc(senderId)
        .collection(receiverId)
        .where('isMessageRead', isEqualTo: false)
        .get()
        .then((value) {
      for (var element in value.docs) {
        element.reference.update({
          'isMessageRead': true,
        });
      }
    });
  }

  Future<DriverModel> getUser({String? email}) {
    return _firestore
        .collection("Customers")
        .where("email", isEqualTo: email)
        .limit(1)
        .get()
        .then((value) {
      if (value.docs.length == 1) {
        print("${value.docs.first.data().runtimeType}");
        return DriverModel.fromMap(value.docs.first.data());
      } else {
        throw "USer not found";
      }
    });
  }
}
