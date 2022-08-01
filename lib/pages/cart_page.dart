import 'package:catalouge_app/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: "C A R T".text.makeCentered()),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          CartTotal(),
        ],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  const CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceBetween,
      children: [
        "\$999".text.base.xl4.color(Colors.red).make(),
        ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(MyThemes.darkCreamColor)),
                onPressed: () {},
                child: "B U Y".text.bold.color(MyThemes.creamColor).make())
            .w40(context)
      ],
    );
  }
}

class _CartList extends StatefulWidget {
  _CartList({Key? key}) : super(key: key);

  @override
  State<_CartList> createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) => ListTile(
              leading: Icon(
                Icons.done,
                color: Colors.green,
              ),
              title:
                  "Iphone 12 pro max".text.color(context.accentColor).xl.make(),
              trailing: IconButton(
                icon: Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ),
                onPressed: () {},
              ),
            ));
  }
}
