import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
        appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black)),
        primarySwatch: Colors.red,
        fontFamily: GoogleFonts.lato().fontFamily);
  }

  static ThemeData DarkTheme() {
    return ThemeData(brightness: Brightness.dark, primaryColor: Colors.blue);
  }

  static Color creamColor = Color(0xfff5f5f5);
}
