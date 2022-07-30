import 'dart:convert';

import 'package:catalouge_app/models/calatoge.dart';
import 'package:catalouge_app/widgets/drawer.dart';
import 'package:catalouge_app/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      appBar: AppBar(title: Center(child: Text("Catalouge App"))),
      body: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
          ? ListView.builder(
              itemCount: CatalogModel.items.length,
              itemBuilder: ((context, index) {
                return ItemWidget(item: CatalogModel.items[index]);
              }),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
      drawer: MyDrawer(),
    );
  }
}
