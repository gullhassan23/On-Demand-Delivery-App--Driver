import 'dart:io';

import 'package:driverapp/controllers/assets_controller.dart';
import 'package:driverapp/widgets/buttons.dart';
import 'package:driverapp/widgets/font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../global/refs.dart';
import '../../services/user_services.dart';
import '../../widgets/loading_widgets.dart';

class ImageUpload extends StatefulWidget {
  String title;
  ImageUpload({required this.title, Key? key}) : super(key: key);

  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  AssetsContoller _assetsContoller = Get.find<AssetsContoller>();
  XFile? _image; // Variable to store the selected image
  UserServices userservice = Get.find<UserServices>();

  String imagepath = "";
  Future<void> _getImage() async {
    final picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  Future<void> _uploadImage() async {
    loadingDialog();
    print(_image);

    if (_image != null) {
      // Check if no image is selected
      String url = await _assetsContoller.uploadinstorage(_image);
      if (widget.title.toLowerCase() == "cnic front") {
        imagepath = "asset.cnic_front.url";
      } else if (widget.title.toLowerCase() == "cnic back") {
        imagepath = "asset.cnic_back.url";
      } else if (widget.title.toLowerCase() == "driving license front") {
        imagepath = "asset.driving_license_front.url";
      } else if (widget.title.toLowerCase() == "driving license back") {
        imagepath = "asset.driving_license_back.url";
      }
      try {
        await driverRef
            .doc(userservice.driver.id)
            .update({"${imagepath}": "${url}"}).then((value) {
          Get.back();
          Get.back();
        });
        print('data URL added to Firestore');
      } catch (e) {
        print('Error saving image URL to Firestore: $e');
      }
      print('Select an image first');
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Headline('${widget.title}'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          GestureDetector(
            onTap: () => _getImage(),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
                child: _image != null
                    ? Image.file(
                        File(_image!.path),
                        fit: BoxFit.cover,
                      )
                    : Center(
                        child: Icon(
                          Icons.camera_alt,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
              ),
            ),
          ),
          SizedBox(height: 20),
          // Text( "asd ${_image != null}"),
          _image != null
              ? CustomElevatedButton(
                  onPressed: () {
                    _uploadImage();
                  },
                  text: 'Upload Image',
                )
              : Container(),
        ],
      ),
    );
  }
}
