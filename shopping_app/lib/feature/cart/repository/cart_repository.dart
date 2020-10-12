

import 'package:shopping_app/feature/cart/models/cart.dart';
import 'package:shopping_app/feature/discover/model/product.dart';

abstract class CartRepository {

  Future<Cart> getCartItems();
  Future<void> updateQuantity(Product product, int value);
}
