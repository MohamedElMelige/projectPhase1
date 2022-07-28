import 'package:flutter/material.dart';

const Color bluClr = Color(0xFF4e5ae8);
const Color purpClr = Color(0xFF512DA8);
const Color pinkClr = Color(0xFFff4667);
const Color primaryClr = bluClr;
const Color darkClr = Color(0xFF121212);
const Color wihte = Colors.white;
Color darkHeaderClr = Color(0xFF424242);


class Themes {
  static final light= ThemeData(
  primaryColor: primaryClr,
  brightness: Brightness.light
  );
  static final dark= ThemeData(
  primaryColor:purpClr,
  brightness: Brightness.dark
  );
}
