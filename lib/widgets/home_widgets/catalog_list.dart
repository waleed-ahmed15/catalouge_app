import 'package:catalouge_app/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/calatoge.dart';
import '../../pages/home_page_detail.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final itm = CatalogModel.items[index];
        return CatalogItem(catalog: itm).py16();
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePageDetail(catalog: catalog))),
            child: Hero(
                tag: catalog.id.toString(),
                child: Image.network(catalog.image)
                    .box
                    .rounded
                    .color(context.cardColor)
                    .p16
                    .make()
                    .p16()
                    .w40(context)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.bold.xl.color(context.accentColor).make(),
              catalog.desc.text
                  .textStyle(context.captionStyle)
                  .color(context.accentColor)
                  .make(),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price.toString()}".text.make(),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyThemes.darkCreamColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    onPressed: () {},
                    child: "add to cart".text.make(),
                  ).p8()
                ],
              )
            ],
          ).expand(),
        ],
      ),
      color: context.cardColor,
    ).cornerRadius(15);
  }
}
