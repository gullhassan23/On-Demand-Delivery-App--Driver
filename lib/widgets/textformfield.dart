import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatelessWidget {
  final String prefixIcon;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool obsecure;

  const CustomTextField({
    super.key,
    required this.prefixIcon,
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
        prefixIcon: Transform.scale(
          scale: 0.6,
          child: SvgPicture.asset(prefixIcon),
        ),
        labelText: hintText,
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
//edit profile textformfield which has prefix and sufix icon

class CustomTextField2 extends StatelessWidget {
  final String prefixIcon;
  final String suffixIcon;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final String? Function(String?)? validator;
  final bool obsecure;

  const CustomTextField2({
    super.key,
    required this.prefixIcon,
    required this.suffixIcon,
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
        prefixIcon: Transform.scale(
          scale: 0.5,
          child: SvgPicture.asset(prefixIcon),
        ),
        labelText: hintText,
        labelStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(30.0),
        ),
        filled: true,
        fillColor: Colors.white,
        suffixIcon: Transform.scale(
          scale: 0.5,
          child: SvgPicture.asset(suffixIcon),
        ),
      ),
    );
  }
}

///jobdetails container

class CustomTextField3 extends StatelessWidget {
  final String prefixIcon;
  final String hintText;

  const CustomTextField3({
    super.key,
    required this.prefixIcon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Transform.scale(
          scale: 0.5, // Adjust the scale factor to make the icon smaller
          child: SvgPicture.asset(prefixIcon),
        ),
        labelText: hintText,
        labelStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 14, // Adjust the font size as needed
        ),
        contentPadding: const EdgeInsets.symmetric(
            vertical: 10, horizontal: 15), // Adjust padding as needed
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}


class CustomTextField4 extends StatelessWidget {
 
  final String hintText;

  const CustomTextField4({
    super.key,
    
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
       
        labelText: hintText,
        labelStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 14, // Adjust the font size as needed
        ),
        contentPadding: const EdgeInsets.symmetric(
            vertical: 10, horizontal: 15), // Adjust padding as needed
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
