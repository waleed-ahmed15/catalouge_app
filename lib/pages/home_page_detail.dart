import 'package:catalouge_app/models/calatoge.dart';
import 'package:catalouge_app/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePageDetail extends StatelessWidget {
  final Item catalog;
  const HomePageDetail({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemes.creamColor,
      body: SafeArea(
          child: Padding(
        padding: Vx.m0,
        child: Column(
          children: [
            Image.network(catalog.image).h32(context).centered().p16(),
            Expanded(
                child: Container(
              color: Colors.red,
            ))
          ],
        ),
      )),
    );
  }
}
