import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driverapp/controllers/assets_controller.dart';
import 'package:driverapp/global/refs.dart';
import 'package:driverapp/models/drivers.dart';
import 'package:driverapp/widgets/colors.dart';
import 'package:driverapp/widgets/font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/user_services.dart';
import 'image_upload.dart';

class Upload extends StatefulWidget {
  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  // bool adddocument;
  UserServices usercontroller = Get.find<UserServices>();
  @override
  void initState() {
    // Get.put<AssetsContoller>(AssetsContoller());

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {
        //     if (adddocument == true) {
        //       Navigator.pop(context);
        //       Navigator.pop(context);
        //     } else {
        //       Navigator.pop(context);
        //     }
        //   },
        //   icon: Icon(Icons.arrow_back, color: Colors.black),
        //   color: Colors.transparent,
        //   padding: EdgeInsets.all(0), // Optional: Remove padding if needed
        //   splashRadius:
        //       40, // Optional: Set the splash radius to match the borderRadius
        //   splashColor: Colors
        //       .transparent, // Optional: Set the splash color to transparent
        //   highlightColor: Colors
        //       .transparent, // Optional: Set the highlight color to transparent
        // ),
        title: Headline('Documents'),
      ),
      body: Column(
        children: [
          usercontroller.driver.approved.toString() == "true"
              ? SizedBox(
                  height: screenSize.height * 0.6,
                  child: Center(
                      child: Headline(
                    "Your Document Approved",
                    color: AppColors.greendark,
                  )))
              : Expanded(
                  child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: driverRef
                        .where("id", isEqualTo: usercontroller.driver.id)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      List<DriverModel> items = snapshot.data!.docs
                          .map((DocumentSnapshot<Map<String, dynamic>> doc) {
                        return DriverModel.fromMap(doc.data()!);
                      }).toList();
                      print(items[0].asset);
                      return Column(
                        children: [
                          ListTileWidget(
                              imageurl: items[0].asset.toString() != "null"
                                  ? items[0].asset!.cnic_front!.url.toString()
                                  : "",
                              title: 'Cnic Front',
                              trailingIcon: Icons.arrow_forward_ios_outlined),
                          Divider(),
                          ListTileWidget(
                              imageurl: items[0].asset.toString() != "null"
                                  ? items[0].asset!.cnic_back!.url.toString()
                                  : "",
                              title: 'Cnic Back',
                              trailingIcon: Icons.arrow_forward_ios_outlined),
                          Divider(),
                          ListTileWidget(
                              imageurl: items[0].asset.toString() != "null"
                                  ? items[0]
                                      .asset!
                                      .driving_license_front!
                                      .url
                                      .toString()
                                  : "",
                              title: 'Driving License Front',
                              trailingIcon: Icons.arrow_forward_ios_outlined),
                          Divider(),
                          ListTileWidget(
                              imageurl: items[0].asset.toString() != "null"
                                  ? items[0]
                                      .asset!
                                      .driving_license_back!
                                      .url
                                      .toString()
                                  : "",
                              title: 'Driving License Back',
                              trailingIcon: Icons.arrow_forward_ios_outlined),
                        ],
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  final String title;
  final IconData trailingIcon;
  String? imageurl;

  ListTileWidget(
      {required this.title, required this.trailingIcon, this.imageurl});

  @override
  Widget build(BuildContext context) {
    print(imageurl);
    return ListTile(
      title: SimpleText(title),
      leading: SizedBox(
        width: 50,
        child: CachedNetworkImage(
          imageUrl: imageurl.toString(),
          placeholder: (context, url) => Center(
              child: CircularProgressIndicator(
            backgroundColor: AppColors.greendark,
          )),
          errorWidget: (context, url, error) => Container(),
        ),
      ),
      trailing: Icon(
        trailingIcon,
        color: AppColors.greendark,
      ),
      onTap: () {
        Get.put<AssetsContoller>(AssetsContoller());
        Get.to(() => ImageUpload(
              title: title,
            ));
        // Add functionality when ListTile is tapped
        // For example, navigate to a new screen or perform an action
        // This function will be triggered when the ListTile is tapped
        print('$title tapped');
      },
    );
  }
}
