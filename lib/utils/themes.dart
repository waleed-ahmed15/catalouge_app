import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyThemes {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
        iconTheme: IconThemeData(color: Colors.black),
        accentColor: darkCreamColor,
        buttonColor: darkCreamColor,
        canvasColor: creamColor,
        textTheme: TextTheme(),
        cardColor: Colors.white,
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black)),
        primarySwatch: Colors.red,  
        fontFamily: GoogleFonts.poppins().fontFamily);
  }

  static ThemeData DarkTheme(BuildContext context) {
    return ThemeData(
        iconTheme: IconThemeData(color: Colors.white),
        accentColor: creamColor,
        buttonColor: lightBluishColor,
        canvasColor: darkCreamColor,
        textTheme: TextTheme(),
        cardColor: Colors.black,
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black)),
        primarySwatch: Colors.red,
        fontFamily: GoogleFonts.poppins().fontFamily);
  }

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Color.fromARGB(255, 45, 58, 86);
  static Color lightBluishColor = Vx.indigo400;
}
