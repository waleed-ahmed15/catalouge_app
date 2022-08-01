import 'package:catalouge_app/core/store.dart';
import 'package:catalouge_app/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:vxstate/vxstate.dart';
import '../../models/calatoge.dart';
import '../../utils/themes.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    required this.catalog,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    CartModel cartObj = (VxState.store as MyStore).cart;
    CatalogModel catalogObj = (VxState.store as MyStore).catalog;

    cartObj.catalog = catalogObj;
    bool isInCart = false;
    isInCart = cartObj.items.contains(catalog);

    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyThemes.darkCreamColor),
          shape: MaterialStateProperty.all(StadiumBorder())),
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);
        }

        // setState(() {});
      },
      child: isInCart ? Icon(Icons.done) : "add to cart".text.make(),
    );
  }
}
