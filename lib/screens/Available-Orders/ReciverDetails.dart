// ignore_for_file: file_names
import 'package:driverapp/screens/Available-Orders/DetailLocation.dart';


import 'package:driverapp/widgets/buttons.dart';
import 'package:driverapp/widgets/textformfield.dart';
import 'package:flutter/material.dart';

import '../../constants/icons.dart';
import '../../widgets/font.dart';



class ReciverDetails extends StatefulWidget {
   ReciverDetails({super.key});

  @override
  State<ReciverDetails> createState() => _ReciverDetailsState();
}

class _ReciverDetailsState extends State<ReciverDetails> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        leading: IconButton(
                icon:  Icon(Icons.arrow_back_outlined,color: Colors.black,),
                
                  onPressed: () {
                        Navigator.pop(context);
                      },
              ), 
              centerTitle: true,
              title:  Headline("Reciver Details"),
              elevation: 0,
      ),
      body: ListView(
        padding:  EdgeInsets.all(16),
        children: [
           SizedBox(
                height: screenSize.height*0.02,
              ),
               Row(
                children: [
                  Headline("Full name"),
                ],
              ),
               SizedBox(height: screenSize.height*0.02),
               CustomTextField(
                prefixIcon: AppIcons.customprofile,
                hintText: "Micheal Sam",
              ),
               SizedBox(height: screenSize.height*0.02),
               Row(
                children: [
                  Headline("Phone Number"),
                ],
              ),
               SizedBox(height: screenSize.height*0.02),
               CustomTextField(
                prefixIcon: AppIcons.customcall,
                hintText: "+01658415434567",
              ),
               SizedBox(height: screenSize.height*0.02),
           Row(
            children: [
                Headline("City/Province"),
              
            ],
          ),
           SizedBox(height: screenSize.height*0.02,),
           CustomTextField(prefixIcon: AppIcons.location, hintText: '1254 Kanata,Ottawa'),
           SizedBox(height: screenSize.height*0.02,),
           Row(
            children: [
              Headline("Detail Location"),

            ],
          ),
           SizedBox(height: screenSize.height*0.02,),
          Column(
            children: [
              TextFormField(
        // controller: _textEditingController,
        maxLines: 6,
        decoration:  InputDecoration(
          hintText: '121 pike St, Marietta,OH, green House with Big tree in the Hall',
          border: OutlineInputBorder(),
        ),
      ),
        ],
          ),
           SizedBox(height:80,),
          CustomElevatedButton(
                text: 'Directions',
                onPressed: () {
                  
                  Navigator.pop(context);
                  
                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  DetailLocation()),
                  );
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
