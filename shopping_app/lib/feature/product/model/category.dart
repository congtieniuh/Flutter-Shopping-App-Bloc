

import 'package:shopping_app/feature/product/model/product.dart';

class Category {
  List<Product> products;
  String manufacturer;

  Category({this.products, this.manufacturer});
}

List<Category> categories = [
  Category(
    products: demoProducts,
    manufacturer: 'Nike'
  ),
  Category(
      products: demoProducts,
      manufacturer: 'Adidas'
  ),
  Category(
      products: demoProducts,
      manufacturer: 'Puma'
  ),
  Category(
      products: demoProducts,
      manufacturer: 'Vinagiay'
  ),
  Category(
      products: demoProducts,
      manufacturer: 'Converse'
  ),
    Category(
    products: demoProducts,
    manufacturer: 'Nike'
  ),
  Category(
      products: demoProducts,
      manufacturer: 'Adidas'
  ),
  Category(
      products: demoProducts,
      manufacturer: 'Puma'
  ),
  Category(
      products: demoProducts,
      manufacturer: 'Vinagiay'
  ),
  Category(
      products: demoProducts,
      manufacturer: 'Converse'
  ),
];