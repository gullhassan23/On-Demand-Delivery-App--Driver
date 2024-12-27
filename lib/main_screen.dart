import 'package:driverapp/screens/Dashboard/dashboard.dart';
import 'package:driverapp/screens/Registration/signup.dart';
import 'package:driverapp/services/user_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Get.find<UserServices>().isAuth ? HomeScreen() : Signup());
  }
}
