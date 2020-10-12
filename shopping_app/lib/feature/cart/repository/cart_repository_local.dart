import 'package:shopping_app/db/db_provider.dart';
import 'package:shopping_app/feature/cart/models/cart.dart';
import 'package:shopping_app/feature/cart/models/cart_item.dart';
import 'package:shopping_app/feature/discover/model/product.dart';
import 'package:sqflite_common/sqlite_api.dart';

import 'cart_repository.dart';

class CartRepositoryLocal extends CartRepository {
  Database _db;

  CartRepositoryLocal() {
    _db = DBProvider.instance.database;
  }

  @override
  Future<Cart> getCartItems() async {
    var res = await _db.rawQuery(""" 
      SELECT * FROM ${DBProvider.TABLE_CART_ITEMS} 
      JOIN ${DBProvider.TABLE_PRODUCT} 
      on ${DBProvider.TABLE_PRODUCT}.product_id 
      = ${DBProvider.TABLE_CART_ITEMS}.product_id
    """);
    var cartItems = List.generate(res.length, (index) {
      final data = res[index];
      return CartItem(
          quantity: data['quantity'], product: Product.fromMap(data));
    });
    return Cart(cartItems);
  }

  Future<void> updateQuantity(Product product, int value) async {
    _db.update(DBProvider.TABLE_CART_ITEMS, {"quantity": value},
        where: "product_id = ?", whereArgs: [product.id]);
  }
}
