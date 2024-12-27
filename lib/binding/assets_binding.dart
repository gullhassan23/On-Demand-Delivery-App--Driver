// ignore_for_file: file_names

import 'package:get/get.dart' hide Trans;

import '../controllers/assets_controller.dart';


class AssetsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AssetsContoller>(AssetsContoller());
  }
}
