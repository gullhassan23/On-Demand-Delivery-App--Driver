// ignore_for_file: unused_local_variable

import 'package:driverapp/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'colors.dart';

class CustomFloatingWidget extends StatelessWidget {
  const CustomFloatingWidget({super.key, required this.icon, this.onTap});
  final String icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SvgPicture.asset(icon),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.btnWidth,
    this.btnHeight,
    this.weight,
    this.borderColor,
    this.textColor,
    this.radius,
    this.fontsize,
    this.icon,
  }) : super(key: key);
  final String text;
  final VoidCallback onPressed;
  final double? btnWidth, btnHeight, radius, fontsize;
  final FontWeight? weight;
  final Color? textColor, borderColor;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: btnWidth ?? 300,
      height: btnHeight ?? 50,
      child: OutlinedButton(
        onPressed: onPressed,
        style: outlineButton(
          primary: borderColor ?? Colors.black,
          borderColor: borderColor ?? Colors.black,
          radius: radius ?? 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? Container(),
            Padding(
              padding: EdgeInsets.only(left: icon == null ? 0 : 10),
              child: Text(
                text.tr,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: weight ?? FontWeight.bold,
                  color: textColor ?? Colors.black,
                  fontSize: fontsize ?? 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.btnWidth,
    this.btnHeight,
    this.weight,
    this.radius,
    this.textColor,
    this.primary,
    this.elevation,
    this.icon,
    this.fontsize,
  }) : super(key: key);
  final String text;
  final VoidCallback onPressed;
  final double? btnWidth, btnHeight, radius, elevation, fontsize;
  final FontWeight? weight;
  final Color? textColor, primary;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: btnWidth ?? 300,
      height: btnHeight ?? 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: elevatedButton(
          radius: radius ?? 30,
          primary: primary ?? const Color(0xFF2E7D32),
          borderColor: primary ?? const Color(0xFF2E7D32),
          elevation: elevation ?? 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? Container(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: icon != null ? 10 : 0),
                child: Text(
                  text.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: textColor ?? Colors.white,
                    fontWeight: weight ?? FontWeight.w900,
                    fontSize: fontsize ?? 17,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomIconTextButton extends StatelessWidget {
  const CustomIconTextButton({
    Key? key,
    this.icon,
    required this.title,
    this.color,
    this.fontsize,
    this.weight,
    required this.onpressed,
  }) : super(key: key);
  final Widget? icon;
  final String title;
  final Color? color;
  final double? fontsize;
  final FontWeight? weight;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onpressed,
      icon: icon ?? Icon(Icons.add, color: color ?? AppColors.primary),
      label: Text(
        title.tr,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: fontsize ?? 15,
          fontWeight: weight ?? FontWeight.bold,
          color: color ?? AppColors.primary,
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.title,
    this.color,
    this.fontsize,
    this.weight,
    this.onpressed,
    this.decoration,
  }) : super(key: key);
  final String title;
  final Color? color;
  final double? fontsize;
  final FontWeight? weight;
  final VoidCallback? onpressed;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpressed ?? () {},
      child: Text(
        title.tr,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: fontsize ?? 15,
          fontWeight: weight ?? FontWeight.normal,
          color: color ?? AppColors.primary,
          decoration: decoration,
        ),
      ),
    );
  }
}


///theme


outlineButton({
  Color? primary = AppColors.primary,
  Color? surface = AppColors.primary,
  Color? borderColor = AppColors.primary,
  double? radius = 10.0,
  double? elevation,
  double width = 1.0,
}) {
  return OutlinedButton.styleFrom(
    foregroundColor: primary ?? AppColors.primary,
    elevation: elevation,
    disabledForegroundColor: surface!.withOpacity(0.38),
    shadowColor: Colors.transparent,
    side: BorderSide(color: borderColor!, width: width),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius!)),
  );
}

elevatedButton({
  required Color primary,
  Color? surface = Colors.white,
  required Color? borderColor,
  Color onPrimary = Colors.white,
  double? radius = 10.0,
  Color? shadowColor,
  double? elevation,
}) {
  return ElevatedButton.styleFrom(
    foregroundColor: onPrimary,
    backgroundColor: primary,
    disabledForegroundColor: surface!.withOpacity(0.38),
    disabledBackgroundColor: surface.withOpacity(0.12),
    elevation: elevation,
    shadowColor: shadowColor,
    side: BorderSide(color: borderColor!),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius!)),
  );
}


//sheetback

class SheetBack extends StatelessWidget {
  const SheetBack({super.key, this.ontap});
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: ontap ?? () => Get.back(),
        child: SvgPicture.asset(AppIcons.back),
      ),
    );
  }
}
