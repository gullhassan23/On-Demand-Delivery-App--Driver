// ignore_for_file: use_build_context_synchronously

import 'package:driverapp/widgets/buttons.dart';
import 'package:driverapp/widgets/font.dart';
import 'package:driverapp/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



class paymentscreen extends StatefulWidget {
  paymentscreen({super.key, });


  @override
  State<paymentscreen> createState() => _paymentscreenState();
}

class _paymentscreenState extends State<paymentscreen> {
  bool terms = false;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Headline("Payment Methods"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: screenSize.height*0.03),
            Headline("Add payment Mehtods"),
            SizedBox(height: screenSize.height*0.02),
           CustomTextField4(hintText: 'Bank Name'),
            Divider(),
            SizedBox(height: screenSize.height*0.015),
           CustomTextField4(hintText: 'Account Number'),
            Divider(),
            SizedBox(height: screenSize.height*0.015),
           CustomTextField4(hintText: 'Your Name'),
            Divider(),
            SizedBox(height: screenSize.height*0.02),
           CustomTextField4(hintText: 'Phone Number'),
            Divider(),
            SizedBox(height: screenSize.height*0.02),
           CustomTextField4(hintText: 'CNIC'),
            SizedBox(height: screenSize.height*0.1),
            // CustomCheckRow(
            //   text: "Agree to our terms of services",
            //   onCheck: (value) {
            //     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            //       setState(() {
            //         terms = value;
            //       });
            //     });
            //   },
            // ),
            SizedBox(height: screenSize.height*0.01),
            CustomElevatedButton(
              text: "Add Account",
              onPressed: () {
                if (terms == false) {
                  Fluttertoast.showToast(
                    msg: 'Please agree to our terms first',
                  );
                }
                 else {
                  //confirmPopup(context, widget.job);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

