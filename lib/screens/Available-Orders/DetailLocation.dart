// ignore_for_file: file_names, non_ant_identifier_names
import 'package:flutter/material.dart';

import 'package:driverapp/widgets/buttons.dart';
import 'package:driverapp/widgets/font.dart';

void main() => runApp(MaterialApp(home: DetailLocation()));

class DetailLocation extends StatefulWidget {
  DetailLocation({super.key});

  @override
  State<DetailLocation> createState() => _DetailLocationState();
}

class _DetailLocationState extends State<DetailLocation> {
  List<StepperData> myStepperData = [
    StepperData(
      title: '1213 Washington Blvd, Belpre , OH',
      subtitle: '18 January 2022, 4:38 PM',
      iconData: Icons.my_location_outlined,
    ),
    StepperData(
      title: '415 W Erin Rd, Van Wert , OH',
      subtitle: '18 January 2022',
      iconData: Icons.my_location_outlined,
    ),
    StepperData(
      title: '1110 Elida Ave, Delphos,OH',
      subtitle: '18 January 2022',
      iconData: Icons.my_location_outlined,
    ),
    StepperData(
      title: '121 Pike St, Marietta,OH ',
      subtitle: '18 January 2022',
      iconData: Icons.location_pin,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
          color: Colors.transparent,
          padding: EdgeInsets.all(0), // Optional: Remove padding if needed
          splashRadius:
              40, // Optional: Set the splash radius to match the borderRadius
          splashColor: Colors
              .transparent, // Optional: Set the splash color to transparent
          highlightColor: Colors
              .transparent, // Optional: Set the highlight color to transparent
        ),
        title: Text("Detail Location",
            style: TextStyle(fontSize: 20, color: Colors.black)),
        centerTitle: true,
        actions: [
          Icon(
            Icons.settings,
            color: Colors.black,
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0), // Add padding from all sides
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                width: double.infinity, // Take up the remaining width
                child:
                    Image.asset("assets/images/maps.jpeg", fit: BoxFit.cover),
              ),
              SizedBox(height: screenSize.height * 0.05),
              CustomElevatedButton(
                text: "Show Details",
                onPressed: () => _showPopup(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        var screenSize = MediaQuery.of(context).size;

        return Padding(
          padding: EdgeInsets.all(16.0), // Add padding from all sides
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: screenSize.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Headline('Electronics'),
                    TextButton(
                        onPressed: () => _Dropoff(context),
                        child: Text(
                          'Complete drop off',
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        )),
                  ],
                ),
                SizedBox(height: screenSize.height * 0.01),
                Text("Arriving at pickup point in 2 mins."),
                SizedBox(height: screenSize.height * 0.02),
                Divider(),
                SizedBox(height: screenSize.height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: screenSize.height * 0.05,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors
                            .white, // Optional: Set the background color of the container
                      ),
                      child: CircleAvatar(
                        radius: 24.0, // Set the radius of the circle
                        backgroundImage: AssetImage(
                            "assets/images/alice.jpeg"), // Replace with the path to your image asset
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Harry Johnson", style: TextStyle(fontSize: 18)),
                        Icon(Icons.star, color: Colors.green),
                        SizedBox(width: 20),
                        Text("4.9"),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.phone),
                      onPressed: () {
                        // Add phone button onPressed action
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.message),
                      onPressed: () {
                        //             Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => ChatScreen()),
                        // );
                      },
                    )
                  ],
                ),
                Divider(),
                SizedBox(
                  height: screenSize.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Headline("MM09130520"),
                        BodyText("Track Number"),
                      ],
                    ),
                    Column(
                      children: [
                        Headline("1-3 Hours"),
                        BodyText("Estimate Time"),
                      ],
                    ),
                    Column(
                      children: [
                        Headline("5.5kg"),
                        BodyText("Package Weight"),
                      ],
                    ),
                  ],
                ),
                Divider(),
                SizedBox(
                  height: screenSize.height * 0.03,
                ),
                AnotherStepper(
                  stepperList: myStepperData,
                  stepperDirection: Axis.vertical,
                  iconWidth: 40,
                  iconHeight: screenSize.height * 0.04,
                ),
                SizedBox(
                  height: screenSize.height * 0.03,
                ),
                CustomElevatedButton(text: "Mark as Done", onPressed: () {}),
              ],
            ),
          ),
        );
      },
    );
  }
}

class StepperData {
  final IconData iconData;
  final String title;
  final String subtitle;
  bool tapped; // Add a tapped property

  StepperData({
    required this.iconData,
    required this.title,
    required this.subtitle,
    this.tapped = true, // Default value is false
  });
}

class AnotherStepper extends StatelessWidget {
  final List<StepperData> stepperList;
  final Axis stepperDirection;
  final double iconWidth;
  final double iconHeight;

  AnotherStepper({
    super.key,
    required this.stepperList,
    required this.stepperDirection,
    this.iconWidth = 40,
    this.iconHeight = 40,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Column(
      children: stepperList.asMap().entries.map((entry) {
        final index = entry.key;
        final step = entry.value;
        return Column(
          children: [
            if (index != 0)
              SizedBox(
                height: screenSize.height * 0.01,
                width: iconWidth / 2, // Adjust the width of the dotted line
                child: Center(
                  child: CustomPaint(),
                ),
              ),
            GestureDetector(
              onTap: () {
                // Handle icon tap here
                // Update the 'tapped' property of the StepperData object.
                step.tapped = !step.tapped;
              },
              child: SizedBox(
                child: Row(
                  children: [
                    Container(
                      width: iconWidth,
                      height: iconHeight,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors
                              .white70, // Change icon border color when tapped
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          step.iconData,
                          color: step.tapped
                              ? Colors.green
                              : Colors.grey, // Change icon color when tapped
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            step.title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            step.subtitle,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}

void _Dropoff(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      double screenHeight = MediaQuery.of(context).size.height;
      double screenWidth = MediaQuery.of(context).size.width;
      var screenSize = MediaQuery.of(context).size;

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
                        image: AssetImage('assets/images/Frame 162397 (1).png'),
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
                  height: screenHeight * 0.28,
                  width: screenWidth * 0.8,
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: screenSize.height * 0.04),
                      Headline("Drop off Complete "),
                      SizedBox(height: screenSize.height * 0.02),
                      BodyText("Take a picture of your delivery as a proof"),
                      SizedBox(height: screenSize.height * 0.01),
                      BodyText("that you have deliverd your order."),
                      SizedBox(height: screenSize.height * 0.04),
                      CustomElevatedButton(
                        text: 'Take Picture of Delivery',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailLocation()),
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
