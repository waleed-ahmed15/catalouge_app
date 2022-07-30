import 'package:catalouge_app/pages/home_page.dart';
import 'package:catalouge_app/pages/login_page.dart';
import 'package:catalouge_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Home_page(),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.red, fontFamily: GoogleFonts.lato().fontFamily),
      darkTheme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.blue),
      initialRoute: "/login",
      routes: {
        MyRoutes.homeRoute: ((context) => Home_page()),
        MyRoutes.loginRoute: (context) => LoginPage()
      },
    );
  }
}
