import 'package:catalouge_app/models/calatoge.dart';
import 'package:catalouge_app/widgets/drawer.dart';
import 'package:catalouge_app/widgets/item_widget.dart';
import 'package:flutter/material.dart';

class Home_page extends StatelessWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Catalouge App"))),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: ((context, index) {
          return ItemWidget(item: CatalogModel.items[0]);
        }),
      ),
      drawer: MyDrawer(),
    );
  }
}
