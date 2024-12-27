// // ignore_for_file: camel_case_types

// import 'package:driverapp/widgets/font.dart';
// import 'package:flutter/material.dart';
// import '../../widgets/notificationRow.dart';

// class customernotification extends StatefulWidget {
//   customernotification({super.key});

//   @override
//   State<customernotification> createState() => _customernotificationState();
// }

// class _customernotificationState extends State<customernotification> {
//   @override
//   Widget build(BuildContext context) {
//     // Calculate dynamic padding based on screen size
//     double screenWidth = MediaQuery.of(context).size.width;
//     double paddingValue = screenWidth * 0.03; // 5% of screen width
//     var screenSize = MediaQuery.of(context).size;
    

//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           color: Colors.transparent,
//           padding:
//               EdgeInsets.all(0), // Optional: Remove padding if needed
//           splashRadius:
//               40, // Optional: Set the splash radius to match the borderRadius
//           splashColor: Colors
//               .transparent, // Optional: Set the splash color to transparent
//           highlightColor: Colors
//               .transparent, // Optional: Set the highlight color to transparent
//         ),
//         title: Headline("Notification"),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(paddingValue),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(height: screenSize.height*0.02),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Headline("Recent"),
//                     SizedBox(width: 100),
//                     TextButton(
//                       onPressed: () {},
//                       child: Text(
//                         'Clear All',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.green,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Divider(),
//               SizedBox(height: screenSize.height*0.02),
//               CustomRowWidget2(
//                 heading: 'Kathryn Sent You a ',
//                 Textbottom: 'Message',
//                 BodyText: 'Tap to see the message',
//                 Duaration: '2 m ago',
//               ),
//               Divider(),
//               SizedBox(height: screenSize.height*0.02),
//               CustomRowWidget2(
//                 heading: 'Your Shipping Already  ',
//                 Textbottom: 'Delivered',
//                 BodyText: 'Tap to see the Detail shipping',
//                 Duaration: '2 m ago',
//               ),
//               Divider(),
//               SizedBox(height: screenSize.height*0.02),
//               CustomRowWidget2(
//                 heading: 'Try the latest Services From ',
//                 Textbottom: 'Tracky!',
//                 BodyText: 'Let\'s try the feature we provided ',
//                 Duaration: '2 m ago',
//               ),
//               Divider(),
//               SizedBox(height: screenSize.height*0.02),
//               CustomRowWidget2(
//                 heading: 'Get 20% Discount for First ',
//                 Textbottom: 'Transaction',
//                 BodyText: 'For all transactions without requirements',
//                 Duaration: '10 m ago',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
