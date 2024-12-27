
// ignore_for_file: file_names

import 'package:flutter/material.dart';



class AddRadius extends StatelessWidget {
  const AddRadius({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      body:  Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/images/map.jpeg', // Replace with your image path
            fit: BoxFit.fitHeight,
          ),
          Positioned(
            top: 300,
            right: 10,
            left: 10,
            child:Image.asset('assets/images/Ellipse 156.png') ),
          ],
      ),
      );
    
  }
}
