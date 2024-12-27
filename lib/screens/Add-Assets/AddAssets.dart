// ignore_for_file: file_names

import 'package:driverapp/controllers/assets_controller.dart';
import 'package:driverapp/widgets/buttons.dart';
import 'package:driverapp/widgets/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../binding/assets_binding.dart';
import '../../constants/icons.dart';
import '../../models/vehicle.dart';
import '../../widgets/colors.dart';
import 'documents.dart';
import 'upload_images.dart';
import 'vegicleslist.dart';

class AddAsset extends StatefulWidget {
  AddAsset({super.key});

  @override
  State<AddAsset> createState() => _AddAssetState();
}

class _AddAssetState extends State<AddAsset> {
  AssetsContoller _assetsContoller = Get.find<AssetsContoller>();
  VehicleModel vehicle = VehicleModel(id: '');

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Headline("Add Assets"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          SizedBox(
            height: screenSize.height * 0.02,
          ),
          Row(
            children: [
              Headline("Selected Vehicle"),
            ],
          ),
          SizedBox(
            height: screenSize.height * 0.02,
          ),
          TextFormField(
            readOnly: true,
            key: Key(vehicle.id.toString()),
            initialValue: vehicle.id == '' ? null : vehicle.name,
            onTap: () {
              Get.focusScope!.unfocus();
              vehicleListSheet(
                context,
                (value) {
                  WidgetsBinding.instance.addPostFrameCallback(
                    (timeStamp) {
                      setState(() {
                        vehicle = value;
                      });
                    },
                  );
                },
              );
            },
            decoration: InputDecoration(
              prefixIcon: Transform.scale(
                scale: 0.6,
                child: SvgPicture.asset(AppIcons.Truck),
              ),
              labelText: "Selected Vehicle",
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.arrow_drop_down_circle,
                  color: AppColors.greendark,
                ),
                onPressed: () {
                  Get.focusScope!.unfocus();
                  vehicleListSheet(
                    context,
                    (value) {
                      WidgetsBinding.instance.addPostFrameCallback(
                        (timeStamp) {
                          setState(() {
                            vehicle = value;
                          });
                        },
                      );
                    },
                  );
                },
              ),
              labelStyle: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          // const SizedBox(height: 20),

          SizedBox(
            height: screenSize.height * 0.02,
          ),
          Row(
            children: [
              Headline("Asset Name"),
            ],
          ),
          SizedBox(height: screenSize.height * 0.02),
          addassetfields(
            controller: _assetsContoller.assetsname,
            hintText: "Asset Name ",
          ),
          SizedBox(height: screenSize.height * 0.02),
          Row(
            children: [
              Headline("Make"),
            ],
          ),
          SizedBox(height: screenSize.height * 0.02),
          addassetfields(
            controller: _assetsContoller.assetsmake,
            hintText: "Enter Make",
          ),
          SizedBox(height: screenSize.height * 0.02),
          Row(
            children: [
              Headline("Model"),
            ],
          ),
          SizedBox(
            height: screenSize.height * 0.02,
          ),
          addassetfields(
              controller: _assetsContoller.assetsmodel,
              hintText: 'Enter Model'),
          SizedBox(
            height: screenSize.height * 0.02,
          ),
          SizedBox(
            height: screenSize.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Headline("Trailer Type"),
              Headline("Size"),
            ],
          ),
          SizedBox(height: screenSize.height * 0.01),
          Row(
            children: [
              Expanded(
                child: addassetfields(
                    controller: _assetsContoller.assetstrailertype,
                    hintText: "Add Trailer Type"),
              ),
              SizedBox(
                width: 20,
              ),
              SizedBox(
                height: screenSize.height * 0.05,
                width: 105,
                child: TextFormField(
                  controller: _assetsContoller.assetssize,

                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w900),
                  // Set the font size
                  decoration: InputDecoration(
                    hintText: '', // Hint text
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Headline("ft"),
                      ],
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 10.0), // Padding for the text field
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(8.0), // Rounded border
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: screenSize.height * 0.05),

          CustomElevatedButton(
            text: 'Next',
            onPressed: () async {
              _assetsContoller.vehicleasset.vehiclecategory = vehicle;
              print(_assetsContoller.vehicleasset.toMap());
              if (vehicle.id == "") {
                Fluttertoast.showToast(
                  msg: 'Please Select Vehicle Category',
                );
              } else if (_assetsContoller.assetsname.text.toString() == "") {
                Fluttertoast.showToast(
                  msg: 'Please enter Asset Name',
                );
              } else if (_assetsContoller.assetsmake.text.toString() == "") {
                Fluttertoast.showToast(
                  msg: 'Please enter Asset Make',
                );
              } else if (_assetsContoller.assetsmodel.text.toString() == "") {
                Fluttertoast.showToast(
                  msg: 'Please enter Asset Model',
                );
              } else if (_assetsContoller.assetstrailertype.text.toString() ==
                  "") {
                Fluttertoast.showToast(
                  msg: 'Please add Trailer Type',
                );
              } else if (_assetsContoller.assetssize.text.toString() == "") {
                Fluttertoast.showToast(
                  msg: 'Please enter Size in feet',
                );
              } else {
                print(_assetsContoller.assetsname.text);
                _assetsContoller.vehicleasset.name =
                    _assetsContoller.assetsname.text.toString();
                _assetsContoller.vehicleasset.make =
                    _assetsContoller.assetsmake.text.toString();
                _assetsContoller.vehicleasset.model =
                    _assetsContoller.assetsmodel.text.toString();
                _assetsContoller.vehicleasset.trailerType =
                    _assetsContoller.assetstrailertype.text.toString();
                _assetsContoller.vehicleasset.size =
                    _assetsContoller.assetssize.text.toString();
                await _assetsContoller.adddriverassets().then((value) {
                  Get.back();
                 Fluttertoast.showToast(
                  msg: 'Assets Added Successfully',
                );
                  // Future.delayed(Duration(seconds: 1), () {
                    Get.to(() => Upload(), binding: AssetsBinding());
                    // Replace '/next' with your desired route name
                  // });
                });
                // Get.back();
                // Get.put<AssetsContoller>(AssetsContoller());

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Upload()),
                // );
              }
              // Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

// void _showPopup(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     builder: (BuildContext context) {
//       return SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.all(24),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//              Container(
//               height: screenSize.height*0.08,
//               width: 150,
//               color: AppColors.lightgrey,
//               child: SvgPicture.asset(AppIcons.NewLocation),
//              ),
//               SizedBox(height: screenSize.height*0.01),
//               Headline("New Montgomery "),
//               SizedBox(height: screenSize.height*0.02),
//               BodyText("Are you committed to this job?"),
//               SizedBox(height: screenSize.height*0.01),
//               BodyText("Penalities including removing access to the applications may occur ."),
//               SizedBox(height: screenSize.height*0.03),
//               Row(
//                 children: [

//                   SvgPicture.asset(AppIcons.timer),
//                   SizedBox(width: 10,),
//                   Headline('9:00 AM- 5:00 PM',),
//                   SizedBox(width: 10,),
//                   SvgPicture.asset(AppIcons.NewMontgomery),
//                   SizedBox(width: 10,),
//                   Headline('4.5 KM from you')
//                 ],
//               ),
//               SizedBox(height: screenSize.height*0.04),
//               CustomElevatedButton(
//                 text: 'Accept',
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) =>  ReciverDetails()),
//                   );
//                 },
//               ),
//               SizedBox(height: screenSize.height*0.02,),
//               CustomOutlinedButton(text: 'Decline', onPressed: (){}),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
class addassetfields extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool obsecure;

  addassetfields({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
    this.inputAction = TextInputAction.done,
    this.inputType = TextInputType.text,
    this.obsecure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecure,
      controller: controller,
      keyboardType: inputType,
      textInputAction: inputAction,
      validator: validator ??
          (value) {
            if (value!.isEmpty) return '*Required';
            return null;
          },
      decoration: InputDecoration(
        labelText: hintText,
        labelStyle: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(20.0),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
