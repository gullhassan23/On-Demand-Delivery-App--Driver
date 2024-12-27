// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


// class CustomContainer extends StatelessWidget {
//   final String iconData;
//   final String text;
//   final VoidCallback? onPressed; // Callback function for onPressed action

//   CustomContainer({super.key, 
//     required this.iconData,
//     required this.text,
//     required this.onPressed, // Add an optional onPressed parameter
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: screenSize.height*0.08,
//       width: 100,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20.0),
//         color: Colors.white,
//         border: Border.all(
//           color: Colors.grey, // Set the border color to grey
//           width: 1.0, // Set the border width
//         ),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           IconButton(
//             onPressed: onPressed, // Use the provided onPressed callback
//             icon: SvgPicture.asset(iconData),
//           ),
//            // Adjust the space between the icon and the border
//           Text(
//             text,
//             style: TextStyle(
//               fontWeight: FontWeight.w900,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// //jobdeatilscontainer
// class CustomContainer2 extends StatefulWidget {
//   final String text;
//   final VoidCallback? onPressed; 
//   CustomContainer2({super.key, 
//     required this.text,
//     required this.onPressed, 
//   });

//   @override
//   _CustomContainer2State createState() => _CustomContainer2State();
// }

// class _CustomContainer2State extends State<CustomContainer2> {
//   bool isPressed = false;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTapDown: (_) {
//         setState(() {
//           isPressed = true;
//         });
//       },
//       onTapUp: (_) {
//         setState(() {
//           isPressed = false;
//         });
//       },
//       onTapCancel: () {
//         setState(() {
//           isPressed = false;
//         });
//       },
//       child: Container(
//         height: screenSize.height*0.04,
//         width: 80,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20.0),
//           color: isPressed ? Colors.black : Colors.white,
//           border: Border.all(
//             color: isPressed ? Colors.white70 : Colors.grey,
//           ),
//         ),
//         child: Center( // Center the text vertically and horizontally
//           child: Text(
//             widget.text,
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               color: isPressed ? Colors.white : Colors.black,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class CustomContainer extends StatelessWidget {
  final String iconData;
  final String text;
  final VoidCallback? onPressed; // Callback function for onPressed action

  CustomContainer({
    super.key,
    required this.iconData,
    required this.text,
    required this.onPressed, // Add an optional onPressed parameter
  });

  @override
  Widget build(BuildContext context) {
    
    var screenSize = MediaQuery.of(context).size;

    return InkWell(
      onTap: onPressed,
      child: Container(
        height: screenSize.height*0.08,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          border: Border.all(
            color: Colors.grey, // Set the border color to grey
            width: 1.0, // Set the border width
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: onPressed, // Use the provided onPressed callback
              icon: SvgPicture.asset(iconData),
            ),
            // Adjust the space between the icon and the border
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//jobdeatilscontainer



class CustomContainer2 extends StatefulWidget {
  final String text;
  final Color textcolor,backgroundcolor;
  final Function onTapCallback;

  CustomContainer2({super.key, 
  required this.textcolor,
  required this.backgroundcolor,
    required this.text,
    required this.onTapCallback, required bool isSelected,
  });

  @override
  _CustomContainer2State createState() => _CustomContainer2State();
}

class _CustomContainer2State extends State<CustomContainer2> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected; // Toggle the selected state
        });
        widget.onTapCallback();
      },
      child: Container(
        margin: EdgeInsets.all(2),
        height: screenSize.height*0.04,
        width: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: widget.backgroundcolor,
          // isSelected ? Colors.white : Colors.white, // Change color when selected
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               // Show a checkmark when selected
              SizedBox(width: isSelected ? 5 : 0), // Add some spacing if selected
              Text(
                widget.text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                  color: widget.textcolor,
                  // isSelected ? Colors.black : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
