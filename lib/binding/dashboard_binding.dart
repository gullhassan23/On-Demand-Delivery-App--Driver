// ignore_for_file: file_names

import 'package:driverapp/controllers/dashboard_controller.dart';
import 'package:get/get.dart' hide Trans;


class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DashboardContoller>(DashboardContoller());
  }
}
