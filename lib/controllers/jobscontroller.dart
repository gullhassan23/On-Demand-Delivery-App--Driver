import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driverapp/global/refs.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class JobContoller extends GetxController {
  RxString imagepath = "".obs;
  Future<void> captureImage() async {
    final picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // Do something with the captured image (e.g., display it)
      // pickedFile.path contains the path of the captured image file
      imagepath (pickedFile.path);
      print('Image saved to ${pickedFile.path}');
    } else {
      // User canceled the image picker
      print('No image selected.');
    }
    update();
  }

  Future<void> uploadinstorage(String docid) async {
    UploadTask uploadTask = jobimageRef.putFile(File(imagepath.toString()));

    await uploadTask.whenComplete(() {
      print('Image uploaded to Firebase');
      imagepath  ("");
    });
    // Get the download URL after the image is uploaded
    TaskSnapshot storageSnapshot = await uploadTask;
    String downloadUrl = await storageSnapshot.ref.getDownloadURL();

    // Save the download URL to Firestore
    await saveImageUrlToFirestore(downloadUrl,docid);
  }

  Future<void> saveImageUrlToFirestore(String downloadUrl,String docid) async {
    try {
      await jobsRef.doc(docid).update({
        'image': downloadUrl, // Save the download URL in Firestore
      });
      print('Image URL added to Firestore');
    } catch (e) {
      print('Error saving image URL to Firestore: $e');
    }
  }
}
