import 'dart:convert';
import 'package:catalouge_app/models/calatoge.dart';
import 'package:catalouge_app/utils/routes.dart';
import 'package:catalouge_app/widgets/drawer.dart';
import 'package:catalouge_app/widgets/item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';

class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  var list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 5));
    final catalogData =
        await rootBundle.loadString('assets/files/catalog.json');
    print(catalogData);
    final decodedData = jsonDecode(catalogData);
    final productsData = decodedData['products'];
    CatalogModel.items =
        List.of(productsData).map<Item>((e) => Item.formMap(e)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
          backgroundColor: context.theme.buttonColor,
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.cartRoute);
          },
          child: Icon(CupertinoIcons.cart_fill_badge_plus)),
      body: SafeArea(
          child: Container(
        padding: Vx.m32,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CatalogHeader(),
            if (CatalogModel.items.isNotEmpty && CatalogModel.items != null)
              CatalogList().py(15).expand()
            else
              Container(
                child: Center(child: CircularProgressIndicator()).expand(),
              )
          ],
        ),
      )),
    );
  }
}
