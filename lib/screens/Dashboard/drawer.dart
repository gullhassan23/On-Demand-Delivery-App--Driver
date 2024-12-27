// import 'package:flutter/material.dart';

// import '../DriverAppIcons/icons.dart';
// import '../widgets/font.dart';
// import 'package:driverapp/Add-Assets/AddAssets.dart';
// import 'package:driverapp/AddRadius/AddRadius.dart';
// import 'package:driverapp/Available-Orders/Scheduled-Jobs.dart';
// import 'package:driverapp/MyProfile/Profile.dart';
// import 'package:driverapp/Registration/signin.dart';
// import 'package:driverapp/Wallet/Wallet.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import 'dashboard.dart';



// class MyDrawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         children: [
//           DrawerHeader(
//             decoration: BoxDecoration(
//               color: Colors.blue,
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 CircleAvatar(
//                   radius: 50,
//                   backgroundImage: AssetImage('assets/avatar.png'), // You can replace 'avatar.png' with your image asset path
//                 ),
//                 SizedBox(height: screenSize.height*0.01),
//                 Text(
//                   'Your Name',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//          Padding(
//             padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
//             child: ListTile(
              
//               title: Headline('Home'),
//               onTap: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => HomeScreen(),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Divider(),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
//             child: ListTile(
              
//               title: Headline('Account'),
//               onTap: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => Profile(),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Divider(),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
//             child: ListTile(
              
//               title: Headline('Scheduled Jobs'),
//               onTap: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => ScheduledJobs(),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Divider(),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
//             child: ListTile(
              
//               title: Headline('Add Assets'),
//               onTap: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => AddAsset(),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Divider(),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
//             child: ListTile(
              
//               title: Headline('Add Radius'),
//               onTap: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => AddRadius(),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Divider(),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
//             child: ListTile(
              
//               title: Headline('Wallet & History'),
//               onTap: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => Wallet(),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Divider(),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
//             child: ListTile(
              
//               title: Headline('Visit Foundation.com'),
//               onTap: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => HomeScreen(),
//                   ),
//                 );
//               },
//             ),
//           ),
//          SizedBox(height: screenSize.height*0.05,),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
//             child: ListTile(
//             title: Headline('Logout'), // Use Text instead of Headline
//             trailing: IconButton(
//               icon: SvgPicture.asset(AppIcons.logout), // You can choose an appropriate icon
//               onPressed: () {
//                  Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => Signin(),
//                   ),
//                 );
//               },
//             ),
//             onTap: () {
              
//             },
//           ),
//           )        ],
//       ),
//     );
//   }
// }
