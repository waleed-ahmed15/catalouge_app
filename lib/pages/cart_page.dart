import 'package:catalouge_app/models/cart.dart';
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
    CartModel cart = CartModel();
    return ButtonBar(
      alignment: MainAxisAlignment.spaceBetween,
      children: [
        "\$${cart.totalPrice}".text.base.xl4.color(Colors.red).make(),
        ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(context.theme.buttonColor)),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                    "Buying not supported yet!",
                    style: TextStyle(fontSize: 20),
                  )));
                },
                child: "B U Y".text.bold.color(MyThemes.creamColor).make())
            .w40(context)
      ],
    );
  }
}

class _CartList extends StatelessWidget {
  CartModel cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return cart.items.isEmpty
        ? "no items added".text.xl4.make().centered()
        : ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) => ListTile(
                  leading: Icon(
                    Icons.done,
                    color: Colors.green,
                  ),
                  title: "${cart.items[index].name}"
                      .text
                      .color(context.accentColor)
                      .xl
                      .make(),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      cart.remove(cart.items[index]);
                      // setState(() {});
                    },
                  ),
                ));
  }
}
