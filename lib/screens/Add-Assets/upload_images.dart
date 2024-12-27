// import 'dart:io';

// import 'package:driverapp/widgets/font.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:nb_utils/nb_utils.dart';

// import '../../controllers/assets_controller.dart';
// import '../../global/refs.dart';
// import '../../services/user_services.dart';
// import '../../widgets/buttons.dart';
// import '../../widgets/loading_widgets.dart';

// class UploadImages extends StatefulWidget {
//   const UploadImages({Key? key}) : super(key: key);

//   @override
//   _UploadImagesState createState() => _UploadImagesState();
// }

// class _UploadImagesState extends State<UploadImages> {
//   AssetsContoller _assetsContoller = Get.find<AssetsContoller>();

//   List<XFile?> _images = [null, null, null, null]; // List to store images
//   List<String> _imageTexts = [
//     'CNIC Front',
//     'CNIC Back',
//     'Driving License Front',
//     'Driving License Back'
//   ]; // List to store image texts
//   List<String> _imageurlname = [
//     'cnic_front',
//     'cnic_back',
//     'driving_license_back',
//     'driving_license_front'
//   ];
//   Future<void> _getImage(int index) async {
//     final picker = ImagePicker();
//     XFile? image = await picker.pickImage(source: ImageSource.camera);

//     setState(() {
//       _images[index] = image;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Upload Images'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: 4,
//               itemBuilder: (BuildContext context, int index) {
//                 return Column(
//                   children: [
//                     Headline("${_imageTexts[index]}"),
//                     GestureDetector(
//                       onTap: () => _getImage(index),
//                       child: Container(
//                         margin: EdgeInsets.symmetric(vertical: 10.0),
//                         width: 150,
//                         height: 150,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15.0),
//                           image: _images[index] != null
//                               ? DecorationImage(
//                                   image: FileImage(File(_images[index]!.path)),
//                                   fit: BoxFit.cover,
//                                 )
//                               : null,
//                           border: Border.all(
//                             color: Colors.grey,
//                             width: 2.0,
//                           ),
//                         ),
//                         child: _images[index] == null
//                             ? Center(
//                                 child: Icon(
//                                   Icons.camera_alt,
//                                   size: 50,
//                                   color: Colors.grey,
//                                 ),
//                               )
//                             : null,
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//           SizedBox(height: screenSize.height * 0.05),
//           CustomElevatedButton(
//             text: 'Add Assets',
//             onPressed: () async {
//               print("sdasd 1322${_assetsContoller.vehicleasset}");

//               if (_images[0].toString() == "null") {
//                 Fluttertoast.showToast(
//                   msg: 'Add ${_imageTexts[0].toString()}',
//                 );
//               } else if (_images[1].toString() == "null") {
//                 Fluttertoast.showToast(
//                   msg: 'Add ${_imageTexts[1].toString()}',
//                 );
//               } else if (_images[2].toString() == "null") {
//                 Fluttertoast.showToast(
//                   msg: 'Add ${_imageTexts[2].toString()}',
//                 );
//               } else if (_images[3].toString() == "null") {
//                 Fluttertoast.showToast(
//                   msg: 'Add ${_imageTexts[3].toString()}',
//                 );
//               } else {
//                 print("sdasd");

//                 loadingDialog();

//                 List<String> downloadURLs = [];
//                 await _assetsContoller.adddriverassets();

//                 for (var imageFile in _images) {
//                   _assetsContoller.uploadinstorage(imageFile);
//                 }
//                 print("downloadURLs ${downloadURLs}");
//                 print("downloadURLs ${downloadURLs.length}");
//                 UserServices userservice = Get.find<UserServices>();

//                 for (int i = 0; i < downloadURLs.length; i++) {
//                   print("downloadURLs i = ${i}");
//                   print("downloadURLs  = ${downloadURLs[i]}");

//                   try {
//                     await driverRef.doc(userservice.driver.id).update({
//                       "asset.${_imageurlname[i]}.url": "${downloadURLs[i]}"
//                     });
//                     print('data URL added to Firestore');
//                   } catch (e) {
//                     print('Error saving image URL to Firestore: $e');
//                   }
//                   // if (i == 3) {
//                     Get.offAllNamed("/homepage");
//                   // }
//                 }
//                 print(_assetsContoller.vehicleasset);
//                 // Get.back();
//               }
//               // Navigator.pop(context);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
