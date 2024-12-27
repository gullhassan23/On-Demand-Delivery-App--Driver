import 'package:driverapp/constants/icons.dart';
import 'package:driverapp/screens/Registration/forgot_password.dart';
import 'package:driverapp/services/user_services.dart';
import 'package:driverapp/widgets/buttons.dart';
import 'package:driverapp/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:driverapp/widgets/font.dart';
import 'package:get/get.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  GlobalKey<FormState> form = GlobalKey<FormState>();
  TextEditingController current = TextEditingController(),
      newPass = TextEditingController(),
      confirmPass = TextEditingController();
  bool hide = true;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Headline("Change Password"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(24.0), // Add padding from all sides
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: screenSize.height*0.05),
                Row(children: [Headline("Current Password")]),
                SizedBox(height: screenSize.height*0.02),
                CustomTextField2(
                  obsecure: hide,
                  controller: current,
                  prefixIcon: AppIcons.customlock,
                  suffixIcon: AppIcons.passwrd,
                  hintText: "Micheal Sam",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '*Required';
                    } else if (value !=
                        Get.find<UserServices>().driver.password) {
                      return 'Incorrect password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenSize.height*0.02),
                InkWell(
                  onTap: () => Get.to(() => ForgotPasswordScreen()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [BodyText("Forget Password")],
                  ),
                ),
                SizedBox(height: screenSize.height*0.02),
                Row(children: [Headline("New Password")]),
                SizedBox(height: screenSize.height*0.02),
                CustomTextField(
                  obsecure: hide,
                  controller: newPass,
                  prefixIcon: AppIcons.customlock,
                  hintText: "New assword",
                ),
                SizedBox(height: screenSize.height*0.02),
                Row(children: [Headline("Confirm Password")]),
                SizedBox(height: screenSize.height*0.02),
                CustomTextField(
                  obsecure: hide,
                  controller: confirmPass,
                  prefixIcon: AppIcons.customlock,
                  hintText: "Repeat Your new Password",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '*Required';
                    } else if (value != newPass.text) {
                      return 'Password don\'t match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenSize.height*0.020),
                CustomElevatedButton(
                  text: "Change password",
                  onPressed: () async {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
