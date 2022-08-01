import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalouge App".text.bold.color(context.accentColor).xl5.center.make(),
        "Trending Products".text.xl2.color(context.accentColor).make(),
      ],
    );
  }
}
