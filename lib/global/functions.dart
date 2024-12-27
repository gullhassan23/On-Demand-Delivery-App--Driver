import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

String formatError(FirebaseAuthException e) =>
    e.code.replaceAll('-', ' ').capitalizeFirst!;

String getFileName(String path) => File(path).uri.pathSegments.last;

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

Future<GeoPoint?> getPoints(String address) async {
  try {
    final location = await locationFromAddress(address);
    if (location.isEmpty) {
      Fluttertoast.showToast(msg: 'Incorrect Address');
      return null;
    } else {
      return GeoPoint(location.first.latitude, location.first.longitude);
    }
  } catch (e) {
    Fluttertoast.showToast(msg: 'Incorrect Address');
    return null;
  }
}


Future<String> uploadFile(String pickedFile, String path) async {
  String link = '';
  try {
    Reference storageRef = FirebaseStorage.instance
        .ref()
        .child('$path/${getFileName(pickedFile)}');
    UploadTask uploadTask = storageRef.putFile(File(pickedFile));
    TaskSnapshot tasksnapshot = await uploadTask;

    await tasksnapshot.ref.getDownloadURL().then((url) async {
      debugPrint('url: $url');
      link = url;
      return link;
    });
    return link;
  } catch (e) {
    debugPrint(e.toString());
    return '';
  }
}