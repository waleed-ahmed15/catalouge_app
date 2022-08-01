import 'package:catalouge_app/core/store.dart';
import 'package:catalouge_app/models/calatoge.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  late CatalogModel _catalog;

  //stored ids of items in cart

  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;
  CatalogModel catalogObj = CatalogModel();

  set catalog(CatalogModel newCatalog) => _catalog = newCatalog;

  List<Item> get items => _itemIds.map((id) => catalogObj.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, element) => total + element.price);

  //adding  new item to list of carts
  void add(Item item) => _itemIds.add(item.id);

  //removing item from list of itemIds

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
    print("herer");
    store?.cart._itemIds.add(item.id);
  }
}
