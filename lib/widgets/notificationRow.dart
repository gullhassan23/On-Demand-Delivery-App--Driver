// ignore_for_file: file_names, non_constant_identifier_names
import 'package:driverapp/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../screens/Available-Orders/DetailLocation.dart';

class CustomRowWidget2 extends StatelessWidget {
  final String heading;
  final VoidCallback? onTap;
  final String Textbottom;
  // final String BodyText;
  DateTime date;

  CustomRowWidget2(
      {super.key,
      required this.heading,
      required this.date,
      required this.Textbottom,
      this.onTap
      // required this.BodyText,
      });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return // Grey background color
        // Padding for the container
        ListTile(
      onTap: onTap,
      leading: Container(
          // width: 60,
          width: screenSize.width * 0.12,
          height: screenSize.width * 0.12,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: SvgPicture.asset(
            'assets/images/Icon (1).svg',
          )),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          Text(Textbottom),
        ],
      ),
      trailing: TimeAgoWidget(givenDate: date),
    );
  }
}

class TimeAgoWidget extends StatelessWidget {
  final DateTime givenDate;

  TimeAgoWidget({required this.givenDate});

  @override
  Widget build(BuildContext context) {
    Duration difference = DateTime.now().difference(givenDate);

    if (difference.inDays > 365) {
      return Text('${(difference.inDays / 365).floor()} years ago');
    } else if (difference.inDays > 30) {
      return Text('${(difference.inDays / 30).floor()} months ago');
    } else if (difference.inDays > 0) {
      return Text('${difference.inDays} days ago');
    } else if (difference.inHours > 0) {
      return Text('${difference.inHours} hours ago');
    } else if (difference.inMinutes > 0) {
      return Text('${difference.inMinutes} minutes ago');
    } else {
      return Text('Just now');
    }
  }
}
