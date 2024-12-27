// ignore_for_file: file_names, library_private_types_in_public_api
import 'package:driverapp/constants/icons.dart';
import 'package:flutter/material.dart';

import '../../widgets/buttons.dart';
import '../../widgets/textformfield.dart';

import '../../widgets/font.dart';
import 'Insurance.dart';


class HelpCenter extends StatefulWidget {
  HelpCenter({Key? key}) : super(key: key);

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(backgroundColor: Colors.white,
    appBar: AppBar(
      leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      color: Colors.transparent,
                      padding: EdgeInsets.all(0), // Optional: Remove padding if needed
                      splashRadius: 40, // Optional: Set the splash radius to match the borderRadius
                      splashColor: Colors.transparent, // Optional: Set the splash color to transparent
                      highlightColor: Colors.transparent, // Optional: Set the highlight color to transparent
                    ),
                    centerTitle: true,
                    title: Headline("Help Center"),
                    backgroundColor: Colors.white,
    ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Column(
              children: [
                
               
                SizedBox(height: screenSize.height*0.02),
                CustomTextField(prefixIcon: AppIcons.customcall, hintText: "Tap to Search faq"),
                SizedBox(height: screenSize.height*0.03),
                Row(
                  children: [
                    Headline("Category"),
                  ],
                ),
                SizedBox(height: screenSize.height*0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        CustomWidget(iconData: Icons.museum_sharp, text: "Insurance", onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Insurance(),
                          ));
                        }),
                        SizedBox(height: screenSize.height*0.02,),
                        CustomWidget(iconData: Icons.border_all_sharp, text: "Orders", onPressed: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //   builder: (context) => HomePage(),
                          // ));
                        }),
                      ],
                    ),
                    Column(
                      children: [
                        CustomWidget(iconData: Icons.mobile_screen_share_sharp, text: "App guide", onPressed: () {}),
                        SizedBox(height: screenSize.height*0.02,),
                        CustomWidget(iconData: Icons.monetization_on_rounded, text: "Check Rates", onPressed: () {}),
                      ],
                    )


                  ],
                ),
                SizedBox(height: screenSize.height*0.03),
                Headline("Popular Searched"),
                SizedBox(height: screenSize.height*0.02),
                CustomRowWidget2(text: 'Why my track is not showing ',),
                CustomRowWidget2(text: "Tracky insurance terms"),
                CustomRowWidget2(text: 'How to place order ',),
                CustomRowWidget2(text: "How to do track "),
                SizedBox(height: screenSize.height*0.03),
                Headline("Contact Customer Services"),
                SizedBox(height: screenSize.height*0.02),
                CustomOutlinedButton(text: "Contact Via Email", onPressed: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomWidget extends StatelessWidget {
  final IconData iconData;
  final String text;
  final VoidCallback onPressed;

  CustomWidget({super.key, required this.iconData, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height*0.06,
      width: 160,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(2.0),
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                iconData,
                color: Colors.green,
              ),
              onPressed: onPressed,
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}

class CustomRowWidget2 extends StatefulWidget {
  final String text;

  CustomRowWidget2({super.key, required this.text});

  @override
  _CustomRowWidget2State createState() => _CustomRowWidget2State();
}

class _CustomRowWidget2State extends State<CustomRowWidget2> {
  bool showHelpText = false;

  void toggleHelpText() {
    setState(() {
      showHelpText = !showHelpText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.text,
                style: TextStyle(fontSize: 18),
              ),
              if (!showHelpText)
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: toggleHelpText,
                ),
              if (showHelpText)
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: toggleHelpText,
                ),
            ],
          ),
          if (showHelpText)
            HelpTextWidget(),
        ],
      ),
    );
  }
}

class HelpTextWidget extends StatelessWidget {
  HelpTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(height: 8),
          Text('Justo , fames hikjsfj euriwusn jskjfue hfiurwj hfshnnxfj sjcnshf fhjshf fyejfsu hdefs. Does it Help you?'),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                onPressed: () {
                  // Handle "Yes" button press
                },
                child: Headline("Yes"),
              ),
              OutlinedButton(
                onPressed: () {
                  // Handle "No" button press
                },
                child: Headline("No"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}




