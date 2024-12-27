import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/strings.dart';
import '../../main_screen.dart';
import '../../widgets/font.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF283593),
        child: Center(
          child: Headline(
            AppStrings.appname,
            style: GoogleFonts.bethEllen(
              color: Colors.white,
              fontSize: 30,
            ),
            align: TextAlign.center,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
