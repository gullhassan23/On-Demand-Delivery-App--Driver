import 'package:driverapp/controllers/user_controller.dart';
import 'package:driverapp/models/drivers.dart';
import 'package:driverapp/models/settings.dart';
import 'package:get/get.dart';

class UserServices extends GetxService {
  final UserController controller = Get.put(UserController());

  Future<UserServices> init() async {
    await controller.checkUserLogin();
    return this;
  }

  DriverModel get driver => controller.driver.value;
  SettingModel get settings => controller.settings.value;

  bool get isAuth => controller.isAuth.value;

  String get userid => driver.id ?? '';

  register(DriverModel driver) async => await controller.register(driver);
  login(String email, String password) async =>
      await controller.login(email, password);
  logout() async => await controller.logout();
  delete() async => await controller.deleteProfile();
    updateProfile({
    required String name,
    required String phone,
    required String image,
  }) async =>
      await controller.updateProfile(
        name: name,
        phone: phone,
        image: image,
      );
}
