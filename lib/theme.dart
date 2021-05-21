import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Muli",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: Colors.black54),
    bodyText2: TextStyle(color: Colors.black54),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    elevation: 0,
    color: Colors.grey[200],
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline6: GoogleFonts.teko(
          fontSize: 26, fontWeight: FontWeight.w600, color: Colors.black54),
    ),
  );
}
