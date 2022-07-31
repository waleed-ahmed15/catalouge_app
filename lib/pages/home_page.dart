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
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
              itemBuilder: (context, index) {
                final itm = CatalogModel.items[index];
                return Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: GridTile(
                    header: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(color: Colors.deepPurple),
                        child: Text(
                          itm.name,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )),
                    child: Image.network(itm.image),
                    footer: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(color: Colors.deepPurple),
                        child: Text(itm.price.toString(),
                            style:
                                TextStyle(color: Colors.white, fontSize: 15))),
                  ),
                );
              },
              itemCount: CatalogModel.items.length,
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
      drawer: MyDrawer(),
    );
  }
}
