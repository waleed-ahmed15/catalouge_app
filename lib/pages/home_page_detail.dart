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
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        iconTheme: context.theme.iconTheme,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: Vx.m0,
          child: Column(
            children: [
              Hero(
                  tag: catalog.id.toString(),
                  child: Image.network(catalog.image)
                      .box
                      .rounded
                      .color(context.canvasColor)
                      .make()
                      .h20(context)
                      .centered()
                      .p20()),
              Expanded(
                child: VxArc(
                  height: 10,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  child: Container(
                    width: context.screenWidth,
                    padding: Vx.m32,
                    color: context.cardColor,
                    child: Column(children: [
                      catalog.name.text.bold.xl5
                          .color(context.accentColor)
                          .make(),
                      SizedBox(
                        height: 20,
                      ),
                      catalog.desc.text.xl
                          .textStyle(context.captionStyle)
                          .color(context.accentColor)
                          .make(),
                      10.heightBox,
                      "Voluptua labore et ut diam et dolores lorem eirmod sanctus, voluptua sed tempor lorem at dolor ut sit eos, eos et magna eos duo, ipsum duo diam accusam aliquyam lorem amet gubergren at takimata, sea et voluptua sit duo eos dolor amet consetetur, sea sit labore dolor ipsum sed. Sit."
                          .text
                          .align(TextAlign.justify)
                          .textStyle(context.captionStyle)
                          .color(context.accentColor)
                          .make()
                          .p16()
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
                    MaterialStateProperty.all(MyThemes.darkCreamColor),
                shape: MaterialStateProperty.all(StadiumBorder())),
            onPressed: () {},
            child: "add to cart".text.make(),
          ).p4().wh(120, 50),
        ],
      ).px16().backgroundColor(context.cardColor),
    );
  }
}
