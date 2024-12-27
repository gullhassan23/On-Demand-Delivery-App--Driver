// ignore_for_file: file_names, library_private_types_in_public_api
import 'package:driverapp/screens/Available-Orders/OrderDetails.dart';
import 'package:driverapp/constants/icons.dart';
import 'package:driverapp/widgets/Row.dart';
import 'package:driverapp/widgets/buttons.dart';
import 'package:driverapp/widgets/colors.dart';
import 'package:driverapp/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widgets/font.dart'; 

class OrderDeatils2 extends StatefulWidget {
  OrderDeatils2({super.key});

  @override
  _OrderDeatils2State createState() => _OrderDeatils2State();
}

class _OrderDeatils2State extends State<OrderDeatils2> {
  bool isFacebookChecked = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
                icon: Icon(Icons.arrow_back_outlined,color: Colors.black,),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title:  Headline("Order Details"),
              centerTitle: true,
              backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
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
        style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w900),
         // Set the font size
        decoration: InputDecoration(
          hintText: '4', // Hint text
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
             
             Headline("lb"),
            ],
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), // Padding for the text field
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
        style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w900),
         // Set the font size
        decoration: InputDecoration(
          hintText: '4', // Hint text
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
             
             Headline("in"),
            ],
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), // Padding for the text field
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
        style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w900),
         // Set the font size
        decoration: InputDecoration(
          hintText: '8', // Hint text
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
             
             Headline("in"),
            ],
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), // Padding for the text field
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
        style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w900),
         // Set the font size
        decoration: InputDecoration(
          hintText: '4', // Hint text
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
             
             Headline("in"),
            ],
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), // Padding for the text field
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
      icon: Icon(Icons.arrow_drop_down_outlined,size: 30,),
      onPressed: () {
        _showBottomSheet(context); // Call the _showBottomSheet function
      },
    ),
    labelStyle: TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(20.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
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
      icon: Icon(Icons.arrow_drop_down_outlined,size: 30,),
      onPressed: () {
        _showBottomSheet(context); // Call the _showBottomSheet function
      },
    ),
    labelStyle: TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(20.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
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
          
          
          SizedBox(height: screenSize.height*0.020,),
          CustomElevatedButton(text: "Sender Details", 
            onPressed: () => _showPopup2(context),
          ),
        ],
      ),
    );
  }

 
// facebook bottom sheet



// Define the _showBottomSheet function outside the onPressed handler
void _showPopup2(BuildContext context) {
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
             Container(
              height: screenSize.height*0.08,
              width: 150,
              color: AppColors.lightgrey,
              child: SvgPicture.asset(AppIcons.NewLocation),
             ),
              SizedBox(height: screenSize.height*0.01),
              Headline("New Montgomery "),
              SizedBox(height: screenSize.height*0.02),
              BodyText("Are you committed to this job?"),
              SizedBox(height: screenSize.height*0.01),
              BodyText("Penalities including removing access to the applications may occur ."),
              SizedBox(height: screenSize.height*0.03),
              Row(
                children: [
                  
                  SvgPicture.asset(AppIcons.timer),
                  SizedBox(width: 10,),
                  Headline('9:00 AM- 5:00 PM',),
                  SizedBox(width: 10,),
                  SvgPicture.asset(AppIcons.NewMontgomery),
                  SizedBox(width: 10,),
                  Headline('4.5 KM from you')
                ],
              ),
              SizedBox(height: screenSize.height*0.04),
              CustomElevatedButton(
                text: 'Accept',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  JobDetails4()),
                  );
                },
              ),
              SizedBox(height: screenSize.height*0.02,),
              CustomOutlinedButton(text: 'Decline', onPressed: (){}),
            ],
          ),
        ),
      );
    },
  );
}
}


///truck bottom sheet

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

      return Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
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
