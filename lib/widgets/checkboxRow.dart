// ignore_for_file: file_names, library_private_types_in_public_api
import 'package:driverapp/widgets/buttons.dart';
import 'package:flutter/material.dart';


class CustomCheckRow extends StatefulWidget {
  final String text;

  CustomCheckRow({super.key, required this.text});

  @override
  _CustomCheckRowState createState() => _CustomCheckRowState();
}

class _CustomCheckRowState extends State<CustomCheckRow> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        Text(widget.text),
      ],
    );
  }
}

  //facbook bottom Shet
  


class FacebookcheckRow extends StatefulWidget {
  final String text;

  FacebookcheckRow({super.key, 
    required this.text,
  });

  @override
  _FacebookcheckRowState createState() => _FacebookcheckRowState();
}

class _FacebookcheckRowState extends State<FacebookcheckRow> {
  bool isFacebookChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isFacebookChecked,
          onChanged: (newValue) {
            setState(() {
              isFacebookChecked = newValue ?? false;
              if (isFacebookChecked) {
                _showPopup4(context); // Call _showPopup3 when Facebook is checked.
              }
            });
          },
        ),
        Text(widget.text),
      ],
    );
  }
}

void _showPopup4(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Container(
          padding:  EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/facebookmarket.png', // Replace with your image path
               height: screenSize.height*0.2,
                width: 150,
              ),
              SizedBox(height: screenSize.height*0.01),
              Text("Facebook Market Place", style: TextStyle(fontSize: 20)),
              SizedBox(height: screenSize.height*0.01),
              Text("All items and delivery charges must be paid before proceeding"),
              SizedBox(height: screenSize.height*0.02),
              CustomElevatedButton(text: "Confirm", onPressed: (){}),
              // No need to include FacebookcheckRow widget here.
            ],
          ),
        ),
      );
    },
  );
}
