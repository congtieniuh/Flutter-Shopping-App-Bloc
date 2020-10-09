import 'package:flutter/material.dart';
import 'package:shopping_app/feature/discover/model/product.dart';

class CartItem {
  final int id;
  final int quantity;
  final Product product;

  CartItem({this.id, this.quantity, this.product});

  Map<String, dynamic> toMap() {
    return {'quantity': quantity, 'product_id': product.id};
  }


}
