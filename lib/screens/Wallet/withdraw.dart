// ignore_for_file: deprecated_member_use, non_constant_identifier_names

import 'package:driverapp/constants/icons.dart';
import 'package:driverapp/screens/Wallet/paymentHistory.dart';
import 'package:driverapp/screens/Wallet/paymentmethod.dart';
import 'package:driverapp/widgets/buttons.dart';
import 'package:driverapp/widgets/colors.dart';
import 'package:driverapp/widgets/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Withdraw extends StatefulWidget {
  Withdraw({super.key});

  @override
  State<Withdraw> createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Headline("Withdraw"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      
        
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.0), // Add padding around the ListView
        child: ListView(
          children: [
             SizedBox(height: screenSize.height*0.04),
            Container(
              height: screenSize.height*0.010,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child:  Column(
                children: [
                  SizedBox(height: 16.0), // Adjusted padding here
                  Row(
                    children: [
                      SizedBox(width: 16.0), // Adjusted padding here
                      BodyText('My Balance'),
                      SizedBox(width: 150,),
                      InkWell(
                        onTap: (){
                           Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                WithdrawHistory()), // Replace with your destination page
                      );
                        },
                        child: WhiteText('View History '))
                    ],
                  ),
                  SizedBox(
                    height: screenSize.height*0.02,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 16.0), // Adjusted padding here
                      WhiteText('\$,875.00'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: screenSize.height*0.03),
            Row(
              children: [
                Headline('Withdrawal Balance'),
              ],
            ),
            SizedBox(height: screenSize.height*0.01),
            Row(
              children: [
                BodyText('Choose a saved bank account to continue'),
              ],
            ),
            SizedBox(
              height: screenSize.height*0.02,
            ),
            SizedBox(
              height: screenSize.height*0.05,
              width: context.width * 0.8,
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Select payment Method',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 14, // Adjust the font size as needed
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15), // Adjust padding as needed
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: Transform.scale(
                      scale:
                          0.5, // Adjust the scale factor to decrease the size (0.5 is just an example)
                      child: SvgPicture.asset(AppIcons.Dropdown,
                          color: Colors.black),
                    )),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            CustomElevatedButton(
                text: 'Continue',
                onPressed: () {
                  _Continuesheet(context);
                }),
          ],
        ),
      ),
    );
  }
}

void _Continuesheet(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: screenSize.height*0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Headline("Bank Accounts "),
                ],
              ),
              SizedBox(height: screenSize.height*0.02),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Black outline color
                    width: 1.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: SizedBox(
                  width: double.infinity, // Expands to screen width
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Withdraw()), // Replace with your destination page
                      );
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: screenSize.height*0.06,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: AppColors.lightgrey,
                            ),
                            child: Image.asset(
                                'assets/images/Mastercard Icon.png'),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Headline('ABC'),
                            SizedBox(height: 6),
                            BodyText('73842 2848274 2748248'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(),
              SizedBox(height: screenSize.height*0.01),
            GestureDetector(
  onTap: () {
   Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => paymentscreen(),
  ),
);

  },
  child: Row(
    children: [
      SvgPicture.asset(AppIcons.Add),
      SizedBox(width: 30),
      Headline('Add New Bank Account'),
    ],
  ),
),

              SizedBox(height: screenSize.height*0.01),
              Divider(),
              SizedBox(height: screenSize.height*0.04),
              CustomElevatedButton(
                text: 'Confirm Request',
                onPressed: () {
                  _withdrawRequest(context);
                },
              ),
              SizedBox(
                height: screenSize.height*0.02,
              ),
            ],
          ),
        ),
      );
    },
  );
}

void _withdrawRequest(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      double screenHeight = MediaQuery.of(context).size.height;
      double screenWidth = MediaQuery.of(context).size.width;

      return SingleChildScrollView(
        child: Container(
          height: screenHeight * 0.7,
          padding: EdgeInsets.only(top: 10, bottom: 24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffFDFDFE).withOpacity(0),
                Color(0xffFDFDFE),
              ],
            ),
          ),
          child: Stack(
            children: [
              SheetBack(),
              Positioned(
                top: 0,
                child: SizedBox(
                  height: screenHeight * 0.6,
                  width: screenWidth,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/withdrawl (2).png'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                left: screenWidth * 0.1,
                right: screenWidth * 0.1,
                child: Container(
                  height: screenHeight * 0.5,
                  width: screenWidth * 0.9,
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: screenSize.height*0.01),
                      Headline("Withdrawl Request"),
                      SizedBox(height: screenSize.height*0.02),
                      BodyText("Congratulations! Your Request already."),
                      SizedBox(height: screenSize.height*0.01),
                      BodyText("Added."),
                      SizedBox(height: screenSize.height*0.01),
                      BodyText("and please check your balanace"),
                      SizedBox(height: screenSize.height*0.04),
                      CustomElevatedButton(
                        text: 'Close',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Withdraw()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
