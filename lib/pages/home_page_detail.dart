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
      appBar: AppBar(),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: Vx.m0,
          child: Column(
            children: [
              Hero(
                  tag: catalog.id.toString(),
                  child: Image.network(catalog.image)
                      .h40(context)
                      .centered()
                      .p16()),
              Expanded(
                child: VxArc(
                  height: 10,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  child: Container(
                    width: context.screenWidth,
                    padding: Vx.m32,
                    color: MyThemes.creamColor,
                    child: Column(children: [
                      catalog.name.text.bold.xl5.make(),
                      SizedBox(
                        height: 20,
                      ),
                      catalog.desc.text.xl
                          .textStyle(context.captionStyle)
                          .make(),
                    ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.zero,
        children: [
          "\$${catalog.price.toString()}"
              .text
              .xl5
              .color(Colors.red[500])
              .make(),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.blueGrey[900]),
                shape: MaterialStateProperty.all(StadiumBorder())),
            onPressed: () {},
            child: "BUY".text.make(),
          ).p8().wh(100, 50)
        ],
      ).px16(),
    );
  }
}
  