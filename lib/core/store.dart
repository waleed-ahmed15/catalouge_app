import 'package:catalouge_app/models/calatoge.dart';
import 'package:catalouge_app/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  CatalogModel catalog = CatalogModel();
  CartModel cart = CartModel();

  MyStore() {
    catalog = CatalogModel();
    cart.catalog = catalog;
  }
}
