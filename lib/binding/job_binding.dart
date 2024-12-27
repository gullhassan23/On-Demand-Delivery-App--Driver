// ignore_for_file: file_names

import 'package:driverapp/controllers/dashboard_controller.dart';
import 'package:get/get.dart' hide Trans;

import '../controllers/jobscontroller.dart';


class JobBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<JobContoller>(JobContoller());
  }
}
