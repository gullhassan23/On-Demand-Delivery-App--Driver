import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driverapp/global/refs.dart';
import 'package:driverapp/models/assets.dart';
import 'package:driverapp/services/user_services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AssetsContoller extends GetxController {
  Assets vehicleasset = Assets();
  TextEditingController assetsname = TextEditingController();
  TextEditingController assetsmake = TextEditingController();
  TextEditingController assetsmodel = TextEditingController();
  TextEditingController assetstrailertype = TextEditingController();
  TextEditingController assetssize = TextEditingController();

  UserServices userservice = Get.find<UserServices>();
  List<String> imagesuploadlink = [];
  Future<void> adddriverassets() async {
    print(userservice.driver.id);
    try {
      driverRef
          .doc(userservice.driver.id)
          .update({"asset": vehicleasset.toMap()});
      print('data URL added to Firestore');
    } catch (e) {
      print('Error saving image URL to Firestore: $e');
    }
  }

  Future<String> uploadinstorage(var imageFile) async {
    print("upload call");
    String imageName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference storageRef =
        storage.ref().child('drivers_documents/$imageName.jpg');

    UploadTask uploadTask = storageRef.putFile(File(imageFile!.path));

    uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
      double progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
      print('Upload progress: $progress%');
    }, onError: (error) {
      print('Upload error: $error');
    });

    // Wait for the upload to complete
    await uploadTask.whenComplete(() {
      print('Upload complete');
    });

    // Get the download URL of the uploaded image
    String downloadURL = await storageRef.getDownloadURL();

    return downloadURL;
  }
}
