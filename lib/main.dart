import 'package:catalouge_app/pages/home_page.dart';
import 'package:catalouge_app/pages/login_page.dart';
import 'package:flutter/material.dart';

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
      theme: ThemeData(primarySwatch: Colors.red),
      darkTheme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.blue),
      initialRoute: "/",
      routes: {
        "/": ((context) => Home_page()),
        "/login": (context) => LoginPage()
      },
    );
  }
}
