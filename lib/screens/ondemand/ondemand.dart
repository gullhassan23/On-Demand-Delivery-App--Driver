import 'package:driverapp/constants/icons.dart';
import 'package:driverapp/controllers/dashboard_controller.dart';
import 'package:driverapp/controllers/jobscontroller.dart';
import 'package:driverapp/global/refs.dart';
import 'package:driverapp/models/drivers.dart';
import 'package:driverapp/services/user_services.dart';
import 'package:driverapp/widgets/bottom_sheet.dart';
import 'package:driverapp/widgets/buttons.dart';
import 'package:driverapp/widgets/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../models/jobs.dart';
import '../../widgets/colors.dart';

class OnDemandScreen extends StatefulWidget {
  JobModel offerdata;
  OnDemandScreen({required this.offerdata, super.key});

  @override
  State<OnDemandScreen> createState() => _OnDemandScreenState();
}

class _OnDemandScreenState extends State<OnDemandScreen> {
  UserServices controller = Get.find<UserServices>();
  DashboardContoller dcontroller = Get.find<DashboardContoller>();

  double kilometersInOneMile = 1.60934;
  double kilometers = 0;
  @override
  void initState() {
    // TODO: implement initState
    print(widget.offerdata.toMap());
    // kilometers = (double.tryParse(widget.offerdata.miles.toString())! *
    //     kilometersInOneMile);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Headline(
            widget.offerdata.type.toString() == "0" ? 'On Demand' : "Schedule"),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.settings,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            // width:  screenSize.width,
            // padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //  SizedBox(height: screenSize.height*0.002),
                BodyText("Are you committed to this job?"),

                SizedBox(height: screenSize.height * 0.004),

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
                    SimpleText(widget.offerdata.pickup!.name.toString()),
                  ],
                ),
                SizedBox(height: screenSize.height * 0.004),
                //  Column(
                //    children: [
                //      Row(
                //       children: [
                //         SizedBox(
                //           width:screenSize.width*0.008,
                //         ),
                //         Headline(' phone Number:'),
                //          SizedBox(
                //           width:screenSize.width*0.008,
                //         ),
                //         SimpleText('${widget.offerdata.pickup!.phone.toString()}'),
                //       ],
                // ),
                //  SizedBox(height: screenSize.height*0.004),

                //    ],
                //  ),

                Row(
                  children: [
                    SvgPicture.asset(AppIcons.timer),
                    SizedBox(
                      width: screenSize.width * 0.008,
                    ),
                    Headline(
                      '9:00 AM- 5:00 PM',
                    ),
                    // SizedBox(
                    //   width: screenSize.width * 0.008,
                    // ),
                    // SvgPicture.asset(AppIcons.NewMontgomery),
                    // SizedBox(
                    //   width: screenSize.width * 0.008,
                    // ),
                    // Headline('${kilometers.toStringAsFixed(2)} KM from you')
                  ],
                ),
                Row(
                  children: [
                    // SvgPicture.asset(AppIcons.NewMontgomery),
                    // SizedBox(
                    //   width: screenSize.width * 0.008,
                    // ),
                    // // Headline('${kilometers.toStringAsFixed(2)} KM from you')
                    // Headline('${kilometers.toStringAsFixed(2)} KM from you')

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
                    SimpleText(widget.offerdata.item!.name.toString()),
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
                    SimpleText(
                        '${widget.offerdata.item!.weight.toString()} lb'),
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
                        width: screenSize.width * 0.65,
                        child: SimpleText(
                            'Lenght: ${widget.offerdata.item!.length.toString()}in ,Widht: ${widget.offerdata.item!.width.toString()}in ,height: ${widget.offerdata.item!.height.toString()}in')),
                    //  SizedBox(
                    //   width:screenSize.width*0.008,
                    // ),
                    // SimpleText('Widht: 50in'),
                    //  SizedBox(
                    //   width:screenSize.width*0.008,
                    // ),
                    // SimpleText('height: screenSize.height*0.05in'),
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
                    SimpleText('${widget.offerdata.amount!.toString()}\$'),
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
                    SimpleText('${widget.offerdata.pickup!.city.toString()}'),
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
                            '${widget.offerdata.pickup!.address!.toString()}')),
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
                            '${widget.offerdata.pickup!.location!.toString()}')),
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
                    SimpleText('${widget.offerdata.dropoff!.name!.toString()}'),
                  ],
                ),
                SizedBox(height: screenSize.height * 0.004),
                //       Column(
                //         children: [
                //           Row(
                //           children: [
                //               SizedBox(
                //               width:screenSize.width*0.008,
                //             ),
                //             Headline(' phone Number:'),
                //               SizedBox(
                //               width:screenSize.width*0.008,
                //             ),
                //             SimpleText('${widget.offerdata.dropoff!.phone!.toString()}'),
                //           ],
                //     ),
                //  SizedBox(height: screenSize.height*0.004),

                //         ],
                //       ),

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
                    SimpleText('${widget.offerdata.dropoff!.city.toString()}'),
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
                            '${widget.offerdata.dropoff!.address!.toString()}')),
                  ],
                ),

                SizedBox(height: screenSize.height * 0.004),
                widget.offerdata.status.toString() == "4" &&
                        widget.offerdata.image != ""
                    ? Center(
                        child: Container(
                          width: 200, // Adjust width as needed
                          height: 200, // Adjust height as needed
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              color: Colors.grey,
                              width: 2.0,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: CachedNetworkImage(
                              imageUrl: "${widget.offerdata.image}",
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.greendark,
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                        ),
                      )
                    : Container(),
                Divider(),
                SizedBox(height: screenSize.height * 0.016),
                widget.offerdata.status.toString() == "0"
                    ? CustomElevatedButton(
                        text: 'Accept',
                        onPressed: () {
                          // DriverModel driverdata = DriverModel(
                          //   id: controller.driver.id,
                          //   email: controller.driver.email,
                          //   name: controller.driver.name,
                          //   phone: controller.driver.phone,
                          //   profile: controller.driver.profile,
                          //   approved: controller.driver.approved,
                          //   status: controller.driver.status,
                          //   radius: controller.driver.radius,
                          // );
                          jobsRef.doc(widget.offerdata.id).update({
                            "status": 1,
                            // "driverdetail": driverdata.toMap(),
                            "driver": controller.driver.id
                          }).then((value){
                              dcontroller.sendNotification(
                          type:  "Order Status",
                         data:   "Your Order ${widget.offerdata.id} is on process",
                           context: context,
                           id: widget.offerdata.from.toString(),
                              jobdata: widget.offerdata,
                          clickaction: 'job'
                           );
                           
                          });
                          // showModalBottomSheet(
                          //     context: context,
                          //     isScrollControlled: true,
                          //     builder: (BuildContext context) {
                          //       return bottom_sheet();
                          //     });
                          Get.offAllNamed("/mainpage");
                        },
                      )
                    : Container(),
                SizedBox(height: screenSize.height * 0.004),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _OndemandBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      var screenSize = MediaQuery.of(context).size;

      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenSize.height * 0.02),
              BodyText("Are you committed to this job?"),
              SizedBox(height: screenSize.height * 0.01),
              BodyText(
                  "Penalities including removing access to the applications may occur ."),
              SizedBox(height: screenSize.height * 0.03),
              Row(
                children: [Headline('Pickup Details')],
              ),
              SizedBox(height: screenSize.height * 0.01),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Headline('Full Name:'),
                  SizedBox(
                    width: 10,
                  ),
                  SimpleText('John Smith'),
                ],
              ),
              SizedBox(height: screenSize.height * 0.01),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Headline(' phone Number:'),
                  SizedBox(
                    width: 10,
                  ),
                  SimpleText('0326789452'),
                ],
              ),
              SizedBox(
                height: screenSize.height * 0.01,
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
                  Headline('4.5 KM from you')
                ],
              ),
              SizedBox(height: screenSize.height * 0.01),
              Row(
                children: [
                  SvgPicture.asset(AppIcons.Box),
                  SizedBox(
                    width: 10,
                  ),
                  Headline('Item Name:'),
                  SizedBox(
                    width: 10,
                  ),
                  SimpleText('Machine'),
                ],
              ),
              SizedBox(height: screenSize.height * 0.01),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Headline('Weight:'),
                  SizedBox(
                    width: 10,
                  ),
                  SimpleText('40 lb'),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  Headline('Dimention:'),
                  SizedBox(
                    width: 10,
                  ),
                  SimpleText('Lenght: 50in'),
                  SizedBox(
                    width: 10,
                  ),
                  SimpleText('Widht: 50in'),
                  SizedBox(
                    width: 10,
                  ),
                  SimpleText('height: screenSize.height*0.05in'),
                ],
              ),
              SizedBox(height: screenSize.height * 0.01),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Headline('Fare:'),
                  SizedBox(
                    width: 10,
                  ),
                  SimpleText('70\$'),
                ],
              ),
              SizedBox(height: screenSize.height * 0.01),
              Row(
                children: [
                  SvgPicture.asset(AppIcons.location),
                  SizedBox(
                    width: 10,
                  ),
                  Headline(' Pickup City:'),
                  SizedBox(
                    width: 10,
                  ),
                  SimpleText('Lahore'),
                ],
              ),
              Divider(),
              SizedBox(height: screenSize.height * 0.01),
              Row(
                children: [Headline('Dropoff Details')],
              ),
              SizedBox(height: screenSize.height * 0.01),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Headline('Full Name:'),
                  SizedBox(
                    width: 10,
                  ),
                  SimpleText('Micheal Sam'),
                ],
              ),
              SizedBox(height: screenSize.height * 0.01),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Headline(' phone Number:'),
                  SizedBox(
                    width: 10,
                  ),
                  SimpleText('03209876452'),
                ],
              ),
              SizedBox(height: screenSize.height * 0.01),
              Row(
                children: [
                  SvgPicture.asset(AppIcons.location),
                  SizedBox(
                    width: 10,
                  ),
                  Headline(' Destination City:'),
                  SizedBox(
                    width: 10,
                  ),
                  SimpleText('Karachi'),
                ],
              ),
              SizedBox(height: screenSize.height * 0.01),
              Divider(),
              SizedBox(height: screenSize.height * 0.04),
              CustomElevatedButton(
                text: 'Accept',
                onPressed: () {
                  // showModalBottomSheet(
                  //     context: context,
                  //     isScrollControlled: true,
                  //     builder: (BuildContext context) {
                  //       return bottom_sheet();
                  //     });
                },
              ),
              SizedBox(
                height: screenSize.height * 0.02,
              ),
            ],
          ),
        ),
      );
    },
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
                      onPressed: () => Dropoffcamera(context),
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
              SizedBox(
                height: screenSize.height * 0.03,
              ),
              CustomElevatedButton(
                text: 'Start Shipment',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title:
                            Text("Are you sure you want to start this ride?"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              // Perform the action when the user selects "Yes".
                              // You can add your logic here.
                              Navigator.of(context).pop();
                            },
                            child: Text("Yes",
                                style: TextStyle(color: Colors.green)),
                          ),
                          TextButton(
                            onPressed: () {
                              // Perform the action when the user selects "No".
                              // You can add your logic here.
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "No",
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

// Dropoff

void Dropoffcamera(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      double screenHeight = MediaQuery.of(context).size.height;
      double screenWidth = MediaQuery.of(context).size.width;
      var screenSize = MediaQuery.of(context).size;

      return SingleChildScrollView(
        child: Container(
          height: screenHeight * 0.8,
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
                      SizedBox(height: screenSize.height * 0.01),
                      Center(
                        child: SizedBox(
                          height: screenSize.height * 0.05,
                          width: context.width * 2,
                          child: CustomElevatedButton(
                            text: 'Take Picture of Delivery',
                            onPressed: () {
                              JobContoller controller =
                                  Get.find<JobContoller>();
                              controller.captureImage().then((value) {
                                Get.back();
                              });
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) =>  DetailLocation()),
                              // );
                            },
                          ),
                        ),
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
// Future<void> _captureImage() async {

//    final picker = ImagePicker();
//     final XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);

//     if (pickedFile != null) {
//       // Do something with the captured image (e.g., display it)
//       // pickedFile.path contains the path of the captured image file

//       print('Image saved to ${pickedFile.path}');
//     } else {
//       // User canceled the image picker
//       print('No image selected.');
//     }
//   }


