import 'package:shopping_app/db/db_provider.dart';
import 'package:shopping_app/feature/cart/models/cart_item.dart';
import 'package:shopping_app/feature/discover/model/product.dart';
import 'package:sqflite_common/sqlite_api.dart';

class ProductDetailsDao {
  Database db;

  ProductDetailsDao() {
    db = DBProvider.instance.database;
  }

  Future<int> insertProductToCart(Product product) {
    db.insert(
      DBProvider.TABLE_PRODUCT,
      product.toMapSql(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    var cartItem = CartItem(product: product, quantity: 1).toMap();
    print('--------------> $cartItem');
    return db.insert(
      DBProvider.TABLE_CART_ITEMS,
      cartItem,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

  }

  Future<void> query() async{
    var result = await db.query(DBProvider.TABLE_PRODUCT);
    print('------------ $result');
    var result1 = await db.query(DBProvider.TABLE_CART_ITEMS);
    print('------------ $result1');
  }
}
