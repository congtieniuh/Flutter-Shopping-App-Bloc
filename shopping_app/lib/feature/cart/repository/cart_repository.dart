

import 'package:shopping_app/feature/cart/models/cart_item.dart';

abstract class CartRepository {

  Future<List<CartItem>> getCartItems();
}
