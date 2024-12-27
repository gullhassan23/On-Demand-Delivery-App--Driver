// ignore_for_file: library_private_types_in_public_api

import 'package:driverapp/constants/strings.dart';
import 'package:driverapp/constants/icons.dart';
import 'package:driverapp/global/refs.dart';
import 'package:driverapp/services/user_services.dart';
import 'package:driverapp/widgets/buttons.dart';
import 'package:driverapp/widgets/font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../notification_services.dart';
import 'signup.dart';
import '../../widgets/textformfield.dart';

class Signin extends StatefulWidget {
  Signin({super.key});

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController(),
      password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Form(
      key: form,
      child: Column(
        children: [
          SizedBox(height: screenSize.height * 0.02),

          /////////////////////////////////////////SizedBox(height: screenSize.height*0.03),
          SizedBox(width: 50),

          Row(children: [Headline("Email Address")]),
          SizedBox(height: screenSize.height * 0.02),
          CustomTextField(
            controller: email,
            inputType: TextInputType.emailAddress,
            prefixIcon: AppIcons.customcall,
            hintText: "Enter your email address",
            validator: (val) {
              if (val!.isEmpty) {
                return '*Required';
              } else if (!GetUtils.isEmail(val)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          SizedBox(height: screenSize.height * 0.02),
          Row(children: [Headline("Password")]),
          SizedBox(height: screenSize.height * 0.02),
          CustomTextField(
            controller: password,
            prefixIcon: AppIcons.customlock,
            hintText: "Enter your password",
          ),
          SizedBox(height: screenSize.height * 0.05),

          SizedBox(height: screenSize.height * 0.02),
          CustomElevatedButton(
            text: "Sign In ",
            onPressed: () async {
              Get.focusScope!.unfocus();
              form.currentState!.save();
              if (form.currentState!.validate()) {
                await Get.find<UserServices>().login(
                  email.text.trim(),
                  password.text,
                );
              }
            },
          ),
          Divider(),
          SizedBox(height: screenSize.height * 0.04),
        ],
      ),
    );
  }
}

// container
class RoundedContainer extends StatefulWidget {
  final String text;
  final Color color;
  final Function onTap;

  RoundedContainer(
      {super.key,
      required this.text,
      required this.color,
      required this.onTap});

  @override
  _RoundedContainerState createState() => _RoundedContainerState();
}

class _RoundedContainerState extends State<RoundedContainer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        setState(() {});
        widget.onTap();
      },
      child: Container(
        width: 100,
        height: screenSize.height * 0.05,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
