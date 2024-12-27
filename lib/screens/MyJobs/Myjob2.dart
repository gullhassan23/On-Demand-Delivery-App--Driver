// // ignore_for_file: file_names

// import 'package:driverapp/constants/icons.dart';
// import 'package:driverapp/widgets/bottom_sheet.dart';
// import 'package:driverapp/widgets/colors.dart';
// import 'package:driverapp/widgets/containers.dart';
// import 'package:driverapp/widgets/font.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';




// class MyJobs2 extends StatefulWidget {
//   MyJobs2({Key? key, this.type = 1}) : super(key: key);

//   final int type;

//   @override
//   State<MyJobs2> createState() => _MyJobs2State();
// }



// class _MyJobs2State extends State<MyJobs2> {
// String selectedTab = "All";
//  bool isPickupActive = true;
  
//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;

//     return 
//     DefaultTabController(
//       length: 4,
//       child: Scaffold(
//       backgroundColor: Colors.black,
//       body: // Add padding from all sides
//           ListView(
//         children: [
//           Container(
//             padding: EdgeInsets.all(16.0), // Add padding from all sides
//             child: Column(children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   SizedBox(
//                     height: screenSize.height*0.03,
//                   ),
//                   Text(
//                     " My Jobs",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.w900,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 150,
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: screenSize.height*0.04,
//               ),
//               Container(
//                 height: screenSize.height*0.04, // Adjust the height as per your requirements
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(
//                       10.0), // Adjust the radius for rounded corners
//                   color: Colors.green, // Background color
//                   border: Border.all(color: Colors.green), // Border color
//                 ),
//                 child: TextFormField(
//                   style: TextStyle(color: Colors.white), // Text color
//                   decoration: InputDecoration(
//                     prefixIcon: Icon(
//                       Icons.search,
//                       color: Colors.white, // Icon color
//                     ),
//                     hintText: 'Enter track number',
//                     hintStyle: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold), // Hint text color
//                     border: InputBorder.none, // Remove default border
//                   ),
//                 ),
//               )
//             ]),
//           ),
//           SizedBox(
//             height: screenSize.height*0.05,
//           ),
//           Container(
//               color: Colors.white,
//               child: Padding(
//                 padding: EdgeInsets.all(10.0),
//                 // You can adjust the padding value as needed
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: screenSize.height*0.01,
//                     ),
//                     Divider(),
// Container(
//   decoration: BoxDecoration(color: Colors.grey,
  
//   ),
//   child: TabBar(tabs: [
//     Tab(text: "pickup",),
//     Tab(text: "Schedule",)
//     ]),
// ),
// TabBarView(children: [

  

// ]),
                

                    
//     //                 ClipRRect(
//     //   borderRadius: BorderRadius.circular(40.0),
      

//     //   child: Container(
//     //     color: Color(0xFFD6D6D6),
//     //     height: screenSize.height*0.05,
//     //     width: double.infinity,
//     //     child: Row(
//     //       children: [
//     //         Expanded(
//     //           child: GestureDetector(
//     //             onTap: () {
//     //               setState(() {
//     //                 isPickupActive = true;
//     //               });
//     //               Navigator.push(
//     //                 context,
//     //                 MaterialPageRoute(
//     //                   builder: (context) => MyJobs(),
//     //                 ),
//     //               );
//     //             },
//     //             child: Container(
//     //               decoration: isPickupActive
//     //                   ? BoxDecoration(
//     //                       color: Colors.white,
//     //                       borderRadius: BorderRadius.circular(20),
//     //                     )
//     //                   : null,
//     //               child: Center(
//     //                 child: Text("Pickup33"),
//     //               ),
//     //             ),
//     //           ),
//     //         ),
//     //         Expanded(
//     //           child: GestureDetector(
//     //             onTap: () {
//     //               setState(() {
//     //                 isPickupActive = false;
//     //               });
//     //               Navigator.push(
//     //                 context,
//     //                 MaterialPageRoute(
//     //                   builder: (context) => MyJobs(),
//     //                 ),
//     //               );
//     //             },
//     //             child: Container(
//     //               decoration: !isPickupActive
//     //                   ? BoxDecoration(
//     //                       color: Colors.white,
//     //                       borderRadius: BorderRadius.circular(20),
//     //                     )
//     //                   : null,
//     //               child: Center(
//     //                 child: Text("Schedule"),
//     //               ),
//     //             ),
//     //           ),
//     //         ),
//     //       ],
//     //     ),
//     //   ),
//     // ),
                    
//                     Divider(),
//                     SizedBox(
//                       height: screenSize.height*0.02,
//                     ),
//                     SingleChildScrollView(
//                       child: Column(
//                         children: [
//                           Divider(),
//                           Padding(
//                             padding: EdgeInsets.all(
//                                 4.0), // Adjust the padding values as needed
//                             child:Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//    CustomContainer2(
//                   text: "All",
//                   onTapCallback: () {
//                     setState(() {
//                       selectedTab = "All";
//                     });
//                   },
//                   isSelected: selectedTab == "All",
//                 ),
//      CustomContainer2(
//                   text: "Pending",
//                   onTapCallback: () {
//                     setState(() {
//                       selectedTab = "Pending";
//                     });
//                   },
//                   isSelected: selectedTab == "Pending",
//                 ),
//      CustomContainer2(
//                   text: "On process",
//                   onTapCallback: () {
//                     setState(() {
//                       selectedTab = "On process";
//                     });
//                   },
//                   isSelected: selectedTab == "On process",
//                 ),
//     CustomContainer2(
//                   text: "Completed",
//                   onTapCallback: () {
//                     setState(() {
//                       selectedTab = "Completed";
//                     });
//                   },
//                   isSelected: selectedTab == "Completed",
//                 ),
//   ],
// ),

//                           ),
//                           SizedBox(
//                             height: screenSize.height*0.02,
//                           ),
//                           Divider(),
//                           Row(
//                             children: [
//                               Headline(" Result"),
//                             ],
//                           ),
//                           Divider(),
//                           if(selectedTab == 'All')
//                           SizedBox(width: context.width,
//                           height: context.height,
//                             child: Column(
//                               children: [
//                                  InkWell(
//                                   onTap: (){
//                                     showModalBottomSheet(
//                                                   context: context, 
//                                                       isScrollControlled: true,
//                                     builder: (BuildContext context) {
//                                       return  bottom_sheet();
//                                                 });
//                                   },
//                                    child: Row(
//                                        mainAxisAlignment: MainAxisAlignment.center,
//                                        children: [
//                                          Container(
//                                            width: 60,
//                                            height: screenSize.height*0.06,
//                                            decoration: BoxDecoration(
//                                              borderRadius: BorderRadius.circular(20.0),
//                                            ),
//                                            child: IconButton(
//                                              onPressed: () {
//                                     //             showModalBottomSheet(
//                                     //               context: context, 
//                                     //                   isScrollControlled: true,
//                                     // builder: (BuildContext context) {
//                                     //   return bottom_sheet();
//                                     //             });
                                              
//                                              },
//                                              icon: SvgPicture.asset(AppIcons.Box),
//                                              color: AppColors.greendark,
//                                            ),
//                                          ),
//                                          SizedBox(width: 8.0),
//                                          Column(
//                                            crossAxisAlignment: CrossAxisAlignment.start,
//                                            children: [
//                                              Headline('MM09123478'),
//                                              BodyText('On transmit area'),
//                                            ],
//                                          ),
//                                          Spacer(),
//                                          SimpleText('On process')
//                                        ],
//                                      ),
//                                  ),
//                               Divider(),
//                                 InkWell(
//                                   onTap: (){
//                                      showModalBottomSheet(
//                                                   context: context, 
//                                                       isScrollControlled: true,
//                                     builder: (BuildContext context) {
//                                       return  JobDetails_sheet();
//                                                 });
//                                   },
//                                   child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Container(
//                                       width: 60,
//                                       height: screenSize.height*0.06,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(20.0),
//                                       ),
//                                       child: IconButton(
//                                         onPressed: () {
                                       
                                         
//                                         },
//                                         icon: SvgPicture.asset(AppIcons.Box),
//                                         color: AppColors.greendark,
//                                       ),
//                                     ),
//                                     SizedBox(width: 8.0),
//                                     Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Headline('MM09123478'),
//                                         BodyText('On transmit area'),
//                                       ],
//                                     ),
//                                     Spacer(),
//                                     SimpleText('Pending')
//                                   ],
//                                     ),
//                                 ),
//                               Divider(),
//                                 Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     width: 60,
//                                     height: screenSize.height*0.06,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(20.0),
//                                     ),
//                                     child: IconButton(
//                                       onPressed: () {
//                                       showModalBottomSheet(
//                                                 context: context, 
//                                                     isScrollControlled: true,
//                                   builder: (BuildContext context) {
//                                     return  JobDetails_sheet();
//                                               });
                                       
//                                       },
//                                       icon: SvgPicture.asset(AppIcons.Box),
//                                       color: AppColors.greendark,
//                                     ),
//                                   ),
//                                   SizedBox(width: 8.0),
//                                   Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Headline('MM09123478'),
//                                       BodyText('On transmit area'),
//                                     ],
//                                   ),
//                                   Spacer(),
//                                   SimpleText('Pending')
//                                 ],
//                               ),
                            
//                               ],
//                             ),
//                           ),
                          
//                          if (selectedTab == "Pending")
//       Column(
//         children: [
//         SizedBox(
//           width: context.width,
//           height: context.height*0.5,
//           child: SizedBox(
//             width: context.width*0.9,
//             height: screenSize.height*0.06,
//             child: Column(
//               children: [
//                 InkWell(
//                 onTap: (){
//                    showModalBottomSheet(
//                                                         context: context, 
//                                                             isScrollControlled: true,
//                                           builder: (BuildContext context) {
//                                             return  JobDetails_sheet();
//                                                       });
//                 },
//                 child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: 60,
//                     height: screenSize.height*0.06,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                     child: IconButton(
//                       onPressed: () {
                     
                       
//                       },
//                       icon: SvgPicture.asset(AppIcons.Box),
//                       color: AppColors.greendark,
//                     ),
//                   ),
//                   SizedBox(width: 8.0),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Headline('MM09123478'),
//                       BodyText('On transmit area'),
//                     ],
//                   ),
//                   Spacer(),
//                   SimpleText('Pending')
//                 ],
//                   ),
//                     ),
//               ],
//             ),
//           ),
//         ),
//         ],
//       ),
//       if (selectedTab == "On process")
//       Column(
//         children: [
//  SizedBox(
//           width: context.width,
//           height: context.height*0.5,
//           child: SizedBox(
//             width: context.width*0.9,
//             height: screenSize.height*0.06,
//             child: Column(
//               children: [
//                 InkWell(
//                 onTap: (){
//                     showModalBottomSheet(
//                                                 context: context, 
//                                                     isScrollControlled: true,
//                                   builder: (BuildContext context) {
//                                     return  bottom_sheet();
//                                               });
//                 },
//                 child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: 60,
//                     height: screenSize.height*0.06,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                     child: IconButton(
//                       onPressed: () {
                     
                       
//                       },
//                       icon: SvgPicture.asset(AppIcons.Box),
//                       color: AppColors.greendark,
//                     ),
//                   ),
//                   SizedBox(width: 8.0),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Headline('MM09123478'),
//                       BodyText('On transmit area'),
//                     ],
//                   ),
//                   Spacer(),
//                   SimpleText('On process')
//                 ],
//                   ),
//                     ),
//               ],
//             ),
//           ),
//         ),
//     Divider(),
//         ],
//       ),
//        if (selectedTab == "Completed")
//       Column(
//         children: [
//            SizedBox(
//           width: context.width,
//           height: context.height*0.5,
//           child: SizedBox(
//             width: context.width*0.9,
//             height: screenSize.height*0.06,
//             child: Column(
//               children: [
//                 InkWell(
//                 onTap: (){
//                    showModalBottomSheet(
//                                                         context: context, 
//                                                             isScrollControlled: true,
//                                           builder: (BuildContext context) {
//                                             return  JobDetails_sheet();
//                                                       });
//                 },
//                 child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: 60,
//                     height: screenSize.height*0.06,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                     child: IconButton(
//                       onPressed: () {
                     
                       
//                       },
//                       icon: SvgPicture.asset(AppIcons.Box),
//                       color: AppColors.greendark,
//                     ),
//                   ),
//                   SizedBox(width: 8.0),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Headline('MM09123478'),
//                       BodyText('On transmit area'),
//                     ],
//                   ),
//                   Spacer(),
//                   SimpleText('Completed')
//                 ],
//                   ),
//                     ),
//               ],
//             ),
//           ),
//         ),
//         ],
//       ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               ),
//         ],
//       ),
//       ),
//     );
//   }
// }
