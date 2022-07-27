import 'package:flutter/material.dart';

class Home_page extends StatelessWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("my app")),
      body: Container(
          child: Center(
        child: Text("welcome"),
      )),
      drawer: Drawer(
          child: Column(
        children:const  [Icon(Icons.home)],
      )),
    );
  }
}
