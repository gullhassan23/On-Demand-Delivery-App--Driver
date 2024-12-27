import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driverapp/global/refs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stepper_a/stepper_a.dart';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;
import '../models/jobs.dart';
import '../models/marker.dart';
import '../models/notificationmodel.dart';
import 'user_controller.dart';

class DashboardContoller extends GetxController {
  String serverkey =
      "key=AAAAjE_wJew:APA91bEA0yIcxJ9t0CXx4re8uokdvxR8mbG-bU4fz-xLj7XlrkAIp4GA14oPvUKYvjOZ8lDV3bQH3ZTTtX8-JAGqLXdF0fCEol6DumO0ED-USqgu9eOPnBHKfKBgX5s371Zx9c1Ds9yI";
  var onDemand = false.obs;
  CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(33.6844, 73.0479),
    zoom: 12,
  );
  List<Marker> onboardmarkers = <Marker>[].obs;

  CameraPosition onboardkGooglePlex = CameraPosition(
    target: LatLng(33.6844, 73.0479),
    zoom: 12,
  );
  List<Marker> markers = <Marker>[].obs;
  Rx<MarkerDetails?> tappedMarkerDetails = Rx<MarkerDetails?>(null);
// Function to calculate distance using Haversine formula
  double calculateDistance(LatLng point1, LatLng point2) {
    const int earthRadius = 6371; // Earth's radius in kilometers (approximate)
    double lat1 = point1.latitude * pi / 180.0;
    double lon1 = point1.longitude * pi / 180.0;
    double lat2 = point2.latitude * pi / 180.0;
    double lon2 = point2.longitude * pi / 180.0;

    double dLat = lat2 - lat1;
    double dLon = lon2 - lon1;

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(lat1) * cos(lat2) * sin(dLon / 2) * sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    double distance = earthRadius * c;

    return distance; // Distance in kilometers
  }

  // Method to get marker details
  MarkerDetails getMarkerDetails(Marker marker) {
    // Here, you should retrieve details associated with the marker
    // This is just a mock implementation; replace it with your logic
    return MarkerDetails(
      title: 'Marker ${marker.markerId.value}',
      description: 'Description for Marker ${marker.markerId.value}',
    );
  }

  sendNotification(
      {required String type,
      required String data,
      required BuildContext context,
      required String id,
      required JobModel jobdata,
      required String clickaction}) async {
    UserController controller = Get.find<UserController>();
    print(id);
    String deviceRegistrationToken = "";
    try {
      // Get a reference to the specific document by its ID (userId in this case)
      DocumentSnapshot documentSnapshot = await customersRef.doc(id).get();
      print(documentSnapshot.exists);
      if (documentSnapshot.exists) {
        // Extract a specific field value from the document
        deviceRegistrationToken = documentSnapshot
            .get('devicetoken'); // Replace 'fieldName' with your field name
        print('device token $deviceRegistrationToken');
      } else {
        print('Document does not exist');
      }
    } catch (e) {
      print('Error getting document: $e');
    }
    print(deviceRegistrationToken);
    Map<String, String> headerNotification = {
      'Content-Type': 'application/json',
      'Authorization': serverkey
    };

    Map bodyNotification = {"body": "${data}", "title": "${type}"};
    print("bodyNotification ${bodyNotification}");
    Map dataMap = {
      "click_action": "${clickaction}",
      "jobid": jobdata.id,
      "senderid": controller.driver.value.id,
    }; 
      print("handle  ${dataMap}");


    // Map<String, dynamic> dataMap = jsonDecode(data.toString());

    Map officialNotificationFormat = {
      "notification": bodyNotification,
      "data": dataMap,
      "priority": "high",
      "to": deviceRegistrationToken,
    };

    var responseNotification = await http.post(
      Uri.parse("https://fcm.googleapis.com/fcm/send"),
      headers: headerNotification,
      body: jsonEncode(officialNotificationFormat),
    );

    String documentId = notificationRef.doc().id;
    NotificationModel notification = NotificationModel(
        title: type,
        body: data,
        id: documentId,
        jobid: jobdata.id,
        senderid: controller.driver.value.id);

    notificationRef
        .doc(id)
        .collection("notification")
        .doc(documentId) // Set the generated document ID
        .set(notification.toMap());
    // notificationRef.add()
    print(responseNotification.body);
  }
}
