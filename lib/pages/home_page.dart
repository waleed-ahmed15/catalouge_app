import 'package:catalouge_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class Home_page extends StatelessWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Catalouge App")),
      body: Container(
          child: Center(
        child: Text("welcome"),
      )),
      drawer: MyDrawer(),
    );
  }
}
