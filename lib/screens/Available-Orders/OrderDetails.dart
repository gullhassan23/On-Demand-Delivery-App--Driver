// ignore_for_file: unused_local_variable, library_private_types_in_public_api, unused_element, file_names

import 'package:driverapp/screens/Available-Orders/ReciverDetails.dart';

import 'package:driverapp/widgets/Row.dart';
import 'package:driverapp/widgets/buttons.dart';
import 'package:driverapp/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widgets/font.dart';
import '../../constants/icons.dart'; 

class JobDetails4 extends StatefulWidget {
   JobDetails4({super.key});

  @override
  _JobDetails4State createState() => _JobDetails4State();
}

class _JobDetails4State extends State<JobDetails4> {
  bool isFacebookChecked = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
                icon:  Icon(Icons.arrow_back_outlined,color: Colors.black,),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title:   Headline("Order Details"),
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0,
      ),
      body: ListView(
        padding:  EdgeInsets.all(16.0),
        children: [
           SizedBox(height: screenSize.height*0.03,),
           Row(
            children: [
              Headline("Item Name"),
              SizedBox(width: 200,),
              Headline("Weight"),
            ],
          ),
           SizedBox(height: screenSize.height*0.01),
          Row(
            children: [
               Expanded(child: CustomTextField(prefixIcon: AppIcons.Box, hintText: "Electronics"),),
               SizedBox(width: 20,),
              SizedBox(
  height: screenSize.height*0.05,
  width: 105,
 child: TextFormField(
        style:  TextStyle(fontSize: 16.0,fontWeight: FontWeight.w900),
         // Set the font size
        decoration: InputDecoration(
          hintText: '4', // Hint text
          suffixIcon:  Row(
            mainAxisSize: MainAxisSize.min,
            children: [
             
             Headline("lb"),
            ],
          ),
          contentPadding:  EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), // Padding for the text field
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0), // Rounded border
          ),
        ),
      ),
),
               
            ],
          ),
           
    
           SizedBox(height: screenSize.height*0.02,),
           Headline("Dimension"),
           SizedBox(height: screenSize.height*0.01,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              SizedBox(
  height: screenSize.height*0.05,
  width: 105,
 child: TextFormField(
        style:  TextStyle(fontSize: 16.0,fontWeight: FontWeight.w900),
         // Set the font size
        decoration: InputDecoration(
          hintText: '4', // Hint text
          suffixIcon:  Row(
            mainAxisSize: MainAxisSize.min,
            children: [
             
             Headline("in"),
            ],
          ),
          contentPadding:  EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), // Padding for the text field
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0), // Rounded border
          ),
        ),
      ),
),

              
               SizedBox(
  height: screenSize.height*0.05,
  width: 105,
 child: TextFormField(
        style:  TextStyle(fontSize: 16.0,fontWeight: FontWeight.w900),
         // Set the font size
        decoration: InputDecoration(
          hintText: '8', // Hint text
          suffixIcon:  Row(
            mainAxisSize: MainAxisSize.min,
            children: [
             
             Headline("in"),
            ],
          ),
          contentPadding:  EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), // Padding for the text field
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0), // Rounded border
          ),
        ),
      ),
),

 SizedBox(
  height: screenSize.height*0.05,
  width: 105,
 child: TextFormField(
        style:  TextStyle(fontSize: 16.0,fontWeight: FontWeight.w900),
         // Set the font size
        decoration: InputDecoration(
          hintText: '4', // Hint text
          suffixIcon:  Row(
            mainAxisSize: MainAxisSize.min,
            children: [
             
             Headline("in"),
            ],
          ),
          contentPadding:  EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), // Padding for the text field
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0), // Rounded border
          ),
        ),
      ),
),

            ],
          ),
           SizedBox(height: screenSize.height*0.02,),
           Headline("Services"),
           SizedBox(height: screenSize.height*0.02,),
          Row(
  children: [
    Expanded(
      child: TextFormField(
  decoration: InputDecoration(
    prefixIcon: Transform.scale(
      scale: 0.6, // Adjust the scale factor as needed to make it smaller
      child: SvgPicture.asset(AppIcons.type),
    ),
    labelText: "Truck",
    suffixIcon: IconButton(
      icon:  Icon(Icons.arrow_drop_down_outlined,size: 30,),
      onPressed: () {
        _showBottomSheet(context); // Call the _showBottomSheet function
      },
    ),
    labelStyle:  TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    contentPadding:  EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    enabledBorder: OutlineInputBorder(
      borderSide:  BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(20.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide:  BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(30.0),
    ),
    filled: true,
    fillColor: Colors.white,
  ),
)

    ),
   
  ],
),
 SizedBox(height: screenSize.height*0.02,),
           Headline("Payment"),
           SizedBox(height: screenSize.height*0.02,),
          Row(
  children: [
    Expanded(
      child: TextFormField(
  decoration: InputDecoration(
    prefixIcon: Transform.scale(
      scale: 0.6, // Adjust the scale factor as needed to make it smaller
      child: SvgPicture.asset(AppIcons.type),
    ),
    labelText: "10 \$",
    suffixIcon: IconButton(
      icon:  Icon(Icons.arrow_drop_down_outlined,size: 30,),
      onPressed: () {
        _showBottomSheet(context); // Call the _showBottomSheet function
      },
    ),
    labelStyle:  TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    contentPadding:  EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    enabledBorder: OutlineInputBorder(
      borderSide:  BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(20.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide:  BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(30.0),
    ),
    filled: true,
    fillColor: Colors.white,
  ),
)

    ),
   
  ],
),
          
          
          SizedBox(height: screenSize.height*0.2),
          CustomElevatedButton(text: "Reciver Details", onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>  ReciverDetails(),
            ));
          }),
        ],
      ),
    );
  }

 
// facebook bottom sheet
void _showPopup3(BuildContext context) {
  bool isFacebookChecked = false; // Define the initial state for Facebook checkbox

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

      return SingleChildScrollView(
        child: Container(
          padding:  EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/confirmorder.png', // Replace with your image path
                height: screenSize.height*0.010,
                width: 100,
              ),
               SizedBox(height: screenSize.height*0.01),
               Headline("Order Successfully"),
               SizedBox(height: screenSize.height*0.01),
               BodyText("Congratulations! Your package will be picked up by the courier, please wait a moment."),
               SizedBox(height: screenSize.height*0.02),
               SizedBox(height: screenSize.height*0.02),
              CustomElevatedButton(
                text: 'Go to Homepage',
                onPressed: () {
                  // Close the modal bottom sheet
                  Navigator.pop(context);
                  
                  // Perform navigation to MyApp1 or any other desired screen
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) =>  MyApp1()),
                  // );
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
}


 


// Define the _showBottomSheet function outside the onPressed handler
void _showBottomSheet(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding:  EdgeInsets.all(16.0),
        child:  Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Headline("Vehicles"),
            SizedBox(height: screenSize.height*0.02),
            JobDetailsRow(heading: "Standard truck/SUV", bodyText: "2-3 Days", IconData: AppIcons.Box, price: "15"),
            SizedBox(height: screenSize.height*0.01),
            JobDetailsRow(heading: "Standard trailer", bodyText: "3-6 Days", IconData: AppIcons.Truck, price: "31"),
            SizedBox(height: screenSize.height*0.01),
            JobDetailsRow(heading: "Boat trailer", bodyText: "1-2 Days", IconData: AppIcons.Truckfast, price: "42"),
          ],
        ),
      );
    },
  );
}
