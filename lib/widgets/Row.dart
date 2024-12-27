// ignore_for_file: file_names, non_constant_identifier_names
import 'package:driverapp/global/refs.dart';
import 'package:driverapp/models/jobs.dart';
import 'package:driverapp/screens/Available-Orders/OrderDetails.dart';
import 'package:driverapp/constants/icons.dart';
import 'package:driverapp/screens/MyProfile/chatscreen.dart';
import 'package:driverapp/screens/ondemand/OrderDeatils2.dart';
import 'package:driverapp/widgets/buttons.dart';
import 'package:driverapp/widgets/colors.dart';
import 'package:driverapp/widgets/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../services/user_services.dart';

class CustomRowWidget extends StatelessWidget {
  final String heading;

  CustomRowWidget({
    super.key,
    required this.heading,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return // Grey background color
        // Padding for the container
        Row(
      mainAxisAlignment:
          MainAxisAlignment.center, // Center the content horizontally
      children: [
        Container(
          width: 60,
          height: screenSize.height * 0.06,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => DetailLocation()),
              // );
            },
            icon: SvgPicture.asset('assets/package.svg'),
            color: AppColors.greendark,
          ),
        ),
        // Icon button in the center
        SizedBox(width: 8.0), // Space between icon and text
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              heading,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            BodyText("processed at sort facility")
          ],
        ),
        Spacer(), // Spacer to push text to the left
        Text(
          "2 Hrs",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}

///another row
///

class JobDetailsRow extends StatelessWidget {
  final String heading;
  final String IconData;
  final String bodyText;
  final String price;

  JobDetailsRow({
    super.key,
    required this.heading,
    required this.bodyText,
    required this.IconData,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return // Grey background color
        // Padding for the container
        Row(
      mainAxisAlignment:
          MainAxisAlignment.center, // Center the content horizontally
      children: [
        Container(
          width: 60,
          height: screenSize.height * 0.06,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => DetailLocation()),
              // );
            },
            icon: SvgPicture.asset(IconData),
            color: AppColors.greendark,
          ),
        ),

        // Icon button in the center
        SizedBox(width: 8.0), // Space between icon and text
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              heading,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            BodyText(bodyText),
          ],
        ),
        Spacer(), // Spacer to push text to the left
        Text(
          price,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}

///Massagecustomrom

class MessageCustomRow extends StatelessWidget {
  final String heading;
  final String image; // Image path or URL
  final String bodyText;
  final String price;

  MessageCustomRow({
    super.key,
    required this.heading,
    required this.image,
    required this.bodyText,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ChatScreen(), // Replace 'NewScreen' with your destination screen
          ),
        );
      },
      child: ListTile(
        leading: SizedBox(
          width: screenSize.width * 0.15,
          height: screenSize.width * 0.15,
          child: CircleAvatar(
            backgroundImage: AssetImage(image),
            radius: 30,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              heading,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.003,
            ),
            Text(
              bodyText,
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ],
        ),
        trailing: Text(
          price,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}

//profile row

class ProfileRow extends StatelessWidget {
  final String heading;
  final String IconData;

  ProfileRow({
    super.key,
    required this.heading,
    required this.IconData,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return // Grey background color
        // Padding for the container
        Container(
      height: screenSize.height * 0.06,
      width: context.width * 0.9,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: Color(0xFFF3F3F3),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.start, // Center the content horizontally
        children: [
          Container(
            width: 60,
            height: screenSize.height * 0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: IconButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => DetailLocation()),
                // );
              },
              icon: SvgPicture.asset(IconData),
              color: AppColors.greendark,
            ),
          ),

          // Icon button in the center
          SizedBox(width: 8.0), // Space between icon and text
          Text(
            heading,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}

//scheduled Jobs row

class ScheduledJobRow extends StatelessWidget {
  JobModel data;
  final String heading;
  final String IconData;
  final String bodyText;

  ScheduledJobRow({
    super.key,
    required this.data,
    required this.heading,
    required this.bodyText,
    required this.IconData,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        _showPopupschdulejob(context, data);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: screenSize.height * 0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AppColors.lightgrey,
              ),
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(IconData),
                color: AppColors.greendark,
              ),
            ),
          ),
          SizedBox(width: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Headline(heading),
              SizedBox(height: 6),
              BodyText(bodyText),
            ],
          ),
        ],
      ),
    );
  }
}

void _showPopupschdulejob(BuildContext context, JobModel jobdetail) {
  var screenSize = MediaQuery.of(context).size;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: screenSize.height * 0.08,
                width: 150,
                color: AppColors.lightgrey,
                child: SvgPicture.asset(AppIcons.NewLocation),
              ),
              SizedBox(height: screenSize.height * 0.01),
              Headline("New Montgomery "),
              SizedBox(height: screenSize.height * 0.02),
              BodyText("Are you committed to this job?"),
              SizedBox(height: screenSize.height * 0.01),
              BodyText(
                  "Penalities including removing access to the applications may occur ."),
              SizedBox(height: screenSize.height * 0.03),
              Row(
                children: [Headline('Pickup Details')],
              ),
              SizedBox(height: screenSize.height * 0.008),
              Row(
                children: [
                  SizedBox(
                    width: screenSize.width * 0.008,
                  ),
                  Headline('Full Name:'),
                  SizedBox(
                    width: screenSize.width * 0.008,
                  ),
                  SimpleText(jobdetail.pickup!.name.toString()),
                ],
              ),
              SizedBox(height: screenSize.height * 0.004),
              Row(
                children: [
                  SvgPicture.asset(AppIcons.Box),
                  SizedBox(
                    width: screenSize.width * 0.008,
                  ),
                  Headline('Item Name:'),
                  SizedBox(
                    width: screenSize.width * 0.008,
                  ),
                  SimpleText(jobdetail.item!.name.toString()),
                ],
              ),
              SizedBox(height: screenSize.height * 0.004),
              Row(
                children: [
                  SizedBox(
                    width: screenSize.width * 0.008,
                  ),
                  Headline('Weight: '),
                  SizedBox(
                    width: screenSize.width * 0.008,
                  ),
                  SimpleText('${jobdetail.item!.weight.toString()} lb'),
                ],
              ),
              SizedBox(height: screenSize.height * 0.004),
              Row(
                children: [
                  Headline('Dimention:'),
                  SizedBox(
                    width: screenSize.width * 0.008,
                  ),
                  SizedBox(
                      width: screenSize.width * 0.6,
                      child: SimpleText(
                          'Lenght: ${jobdetail.item!.length.toString()}in ,Widht: ${jobdetail.item!.width.toString()}in ,height: ${jobdetail.item!.height.toString()}in')),
                ],
              ),
              SizedBox(height: screenSize.height * 0.004),
              Row(
                children: [
                  SizedBox(
                    width: screenSize.width * 0.008,
                  ),
                  Headline('Fare: '),
                  SizedBox(
                    width: screenSize.width * 0.008,
                  ),
                  SimpleText('${jobdetail.amount!.toString()}\$'),
                ],
              ),
              SizedBox(height: screenSize.height * 0.004),
              Row(
                children: [
                  SvgPicture.asset(AppIcons.location),
                  SizedBox(
                    width: screenSize.width * 0.008,
                  ),
                  Headline(' Pickup City: '),
                  SizedBox(
                    width: screenSize.width * 0.008,
                  ),
                  SimpleText('${jobdetail.pickup!.city.toString()}'),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: screenSize.width * 0.008,
                  ),
                  Headline('Pickup Address: '),
                  SizedBox(
                    width: screenSize.width * 0.008,
                  ),
                  SizedBox(
                      width: screenSize.width * 0.4,
                      child: SimpleText(
                          '${jobdetail.pickup!.address!.toString()}')),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: screenSize.width * 0.008,
                  ),
                  Headline('Detail Address: '),
                  SizedBox(
                    width: screenSize.width * 0.008,
                  ),
                  SizedBox(
                      width: screenSize.width * 0.4,
                      child: SimpleText(
                          '${jobdetail.pickup!.location!.toString()}')),
                ],
              ),
              Divider(),
              SizedBox(height: screenSize.height * 0.004),
              Row(
                children: [Headline('Dropoff Details')],
              ),
              SizedBox(height: screenSize.height * 0.004),
              Row(
                children: [
                  SizedBox(
                    width: screenSize.width * 0.008,
                  ),
                  Headline('Full Name: '),
                  SizedBox(
                    width: screenSize.width * 0.008,
                  ),
                  SimpleText('${jobdetail.dropoff!.name!.toString()}'),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(AppIcons.location),
                  SizedBox(
                    width: screenSize.width * 0.008,
                  ),
                  Headline(' Destination City:'),
                  SizedBox(
                    width: screenSize.width * 0.008,
                  ),
                  SimpleText('${jobdetail.dropoff!.city.toString()}'),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: screenSize.width * 0.008,
                  ),
                  Headline('Dropoff Address: '),
                  SizedBox(
                    width: screenSize.width * 0.008,
                  ),
                  SizedBox(
                      width: screenSize.width * 0.4,
                      child: SimpleText(
                          '${jobdetail.dropoff!.address!.toString()}')),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(AppIcons.timer),
                  SizedBox(
                    width: 10,
                  ),
                  Headline(
                    '9:00 AM- 5:00 PM',
                  ),

                  SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset(AppIcons.NewMontgomery),
                  SizedBox(
                    width: 10,
                  ),
                  // Headline('4.5 KM from you')
                ],
              ),
              SizedBox(height: screenSize.height * 0.04),
              CustomElevatedButton(
                text: 'Accept',
                onPressed: () {
                  UserServices controller = Get.find<UserServices>();

                  jobsRef.doc(jobdetail.id).update({
                    "status": 1,
               
                    "driver": controller.driver.id
                  });
                
                  Get.offAllNamed("/mainpage");
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => JobDetails4()),
                  // );
                },
              ),
              SizedBox(
                height: screenSize.height * 0.02,
              ),
              CustomOutlinedButton(text: 'Decline', onPressed: () {
                 jobsRef.doc(jobdetail.id).update({
                    // "status": 0,
               
                    "driver": ""
                  });
                  Get.back();
              }),
            ],
          ),
        ),
      );
    },
  );
}

void _showPopup(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: screenSize.height * 0.08,
                width: 150,
                color: AppColors.lightgrey,
                child: SvgPicture.asset(AppIcons.NewLocation),
              ),
              SizedBox(height: screenSize.height * 0.01),
              Headline("New Montgomery "),
              SizedBox(height: screenSize.height * 0.02),
              BodyText("Are you committed to this job?"),
              SizedBox(height: screenSize.height * 0.01),
              BodyText(
                  "Penalities including removing access to the applications may occur ."),
              SizedBox(height: screenSize.height * 0.03),
              Row(
                children: [
                  SvgPicture.asset(AppIcons.timer),
                  SizedBox(
                    width: 10,
                  ),
                  Headline(
                    '9:00 AM- 5:00 PM',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset(AppIcons.NewMontgomery),
                  SizedBox(
                    width: 10,
                  ),
                  Headline('4.5 KM from you')
                ],
              ),
              SizedBox(height: screenSize.height * 0.04),
              CustomElevatedButton(
                text: 'Accept',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JobDetails4()),
                  );
                },
              ),
              SizedBox(
                height: screenSize.height * 0.02,
              ),
              CustomOutlinedButton(text: 'Decline', onPressed: () {}),
            ],
          ),
        ),
      );
    },
  );
}

//on demand Rows

class OnDemandRow extends StatelessWidget {
  final String heading;
  final String image; // Image path or URL
  final String bodyText;
  final String price;

  OnDemandRow({
    super.key,
    required this.heading,
    required this.image,
    required this.bodyText,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        _OndemandBottomSheet(context); // Call _showPopup when tapped
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 30,
            height: screenSize.height * 0.03,
            child: SvgPicture.asset(image),
          ),
          SizedBox(width: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Headline(heading), // Replace with your Headline widget
              SizedBox(height: screenSize.height * 0.01),
              BodyText(bodyText), // Replace with your BodyText widget
            ],
          ),
          Spacer(),
          Headline(price), // Replace with your Headline widget
        ],
      ),
    );
  }
}

void _OndemandBottomSheet(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: screenSize.height * 0.08,
                width: 150,
                color: AppColors.lightgrey,
                child: SvgPicture.asset(AppIcons.NewLocation),
              ),
              SizedBox(height: screenSize.height * 0.01),
              Headline("New Montgomery "),
              SizedBox(height: screenSize.height * 0.02),
              BodyText("Are you committed to this job?"),
              SizedBox(height: screenSize.height * 0.01),
              BodyText(
                  "Penalities including removing access to the applications may occur ."),
              SizedBox(height: screenSize.height * 0.03),
              Row(
                children: [
                  SvgPicture.asset(AppIcons.timer),
                  SizedBox(
                    width: 10,
                  ),
                  Headline(
                    '9:00 AM- 5:00 PM',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset(AppIcons.NewMontgomery),
                  SizedBox(
                    width: 10,
                  ),
                  Headline('4.5 KM from you')
                ],
              ),
              Divider(),
              SizedBox(height: screenSize.height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BodyText('0382892849284'),
                ],
              ),
              SizedBox(height: screenSize.height * 0.01),
              Divider(),
              SizedBox(height: screenSize.height * 0.04),
              CustomElevatedButton(
                text: 'Details',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderDeatils2()),
                  );
                },
              ),
              SizedBox(
                height: screenSize.height * 0.02,
              ),
              CustomOutlinedButton(text: 'Direction', onPressed: () {}),
            ],
          ),
        ),
      );
    },
  );
}

// MyjobsRow
class MyjobsRow extends StatefulWidget {
  final String heading;
  final String IconData;
  final String bodyText;
  final String price;
  final Function() onPressed;

  MyjobsRow({
    Key? key,
    required this.heading,
    required this.bodyText,
    required this.IconData,
    required this.price,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<MyjobsRow> createState() => _MyjobsRowState();
}

class _MyjobsRowState extends State<MyjobsRow> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 60,
          height: screenSize.height * 0.06,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: IconButton(
            onPressed: () {
              // Call the onPressed function to navigate
              widget.onPressed();
            },
            icon: SvgPicture.asset(widget.IconData),
            color: AppColors.greendark,
          ),
        ),
        SizedBox(width: 8.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.heading,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            BodyText(widget.bodyText),
          ],
        ),
        Spacer(),
        Text(
          widget.price,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
