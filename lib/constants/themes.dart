import 'package:flutter/material.dart';

class Themes {
  static Color bluishClr = Color(0xFF4e5ae8);
  static Color yellowClr = Color(0xFFFFB746);
  static Color pinkClr = Color(0xFFff4667);
  static Color white = Colors.white;
  static Color primaryColor = bluishClr;
  static Color darkGreyClr = Color(0xFF121212);
  static Color darkHeaderClr = Color(0xFF424242);

  static final light =
      ThemeData(primaryColor: primaryColor, brightness: Brightness.light);

  static final dark =
      ThemeData(primaryColor: darkGreyClr, brightness: Brightness.dark);
}
