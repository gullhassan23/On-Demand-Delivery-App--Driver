// ignore_for_file: file_names
import 'package:driverapp/constants/icons.dart';
import 'package:flutter/material.dart';

import '../../widgets/textformfield.dart';

import '../../widgets/font.dart';


class Insurance extends StatefulWidget {
  Insurance({super.key});

  @override
  State<Insurance> createState() => _InsuranceState();
}

class _InsuranceState extends State<Insurance> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: screenSize.height*0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_back_outlined),
                    SizedBox(width: 80),
                    Headline("Help Center"),
                    SizedBox(width: 80),
                  ],
                ),
                SizedBox(height: screenSize.height*0.03),
                CustomTextField(prefixIcon: AppIcons.help, hintText: "Tap to Search faq"),
                SizedBox(height: screenSize.height*0.03),
                Row(
                  children: [
                    Headline(" See Other Category"),
                  ],
                ),
                SizedBox(height: screenSize.height*0.03),
                Row(
                  children: [
                    Icon(Icons.home_work_rounded,color: Colors.green,),
                    SizedBox(width: 30,),
                    SimpleText("Insurance"),
                  ],
                ),
                Divider(),
                SizedBox(height: screenSize.height*0.02,),
                Row(
                  children: [
                    SimpleText("Tracky insurance terms"),
                  ],
                ),SizedBox(height: screenSize.height*0.02,),
                Divider(),
                Row(
                  children: [
                    SimpleText("Why did the expedition turing around?"),
                  ],
                ),



              ],
            )
          ],
        ),
      ),
    );
  }
}
