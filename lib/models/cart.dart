import 'package:catalouge_app/models/calatoge.dart';

class CartModel {
  late CatalogModel _catalog;

  //stored ids of items in cart

  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) => _catalog = newCatalog;

  List<Item> get items =>
      _itemIds.map((id) => CatalogModel.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, element) => total + element.price);

  //adding  new item to list of carts
  void add(Item item) => _itemIds.add(item.id);

  //removing item from list of itemIds

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
