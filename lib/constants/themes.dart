import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static Color bluishClr = Color(0xFF4e5ae8);
  static Color yellowClr = Color(0xFFFFB746);
  static Color pinkClr = Color(0xFFff4667);
  static Color white = Colors.white;
  static Color primaryColor = bluishClr;
  static Color darkGreyClr = Color(0xFF121212);
  static Color darkHeaderClr = Color(0xFF424242);

  static final light = ThemeData(
      primaryColor: primaryColor,
      brightness: Brightness.light,
      backgroundColor: Colors.white);

  static final dark = ThemeData(
      primaryColor: darkGreyClr,
      brightness: Brightness.dark,
      backgroundColor: darkGreyClr);

  TextStyle get subHeadingStyle {
    return GoogleFonts.lato(
        textStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Get.isDarkMode ? Colors.grey[400] : Colors.grey));
  }

  TextStyle get headingStyle {
    return GoogleFonts.lato(
        textStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Get.isDarkMode ? Colors.white : Colors.black));
  }
  TextStyle get titleStyle {
    return GoogleFonts.lato(
        textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Get.isDarkMode ? Colors.white : Colors.black));
  }

  TextStyle get subTitleStyle {
    return GoogleFonts.lato(
        textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Get.isDarkMode ? Colors.grey[100] : Colors.grey[600]));
  }
}
