import 'dart:convert';

import 'package:shopping_app/resources/R.dart';

class ProductType {
  static const UPCOMMING = 'Upcoming';
  static const FEATURED = 'Featured';
  static const NEW = 'New';

  static List<String> values() => [UPCOMMING, FEATURED, NEW];
}

class Product {
  final String id;
  String title, briefDescription, description;
  List<String> images;
  int colors;
  double price;
  String category;
  bool isFavourite;
  List<double> remainingSizeUK;
  List<double> remainingSizeUS;
  String productType;

  Product(
      {this.id,
      this.images,
      this.colors,
      this.isFavourite = false,
      this.title,
      this.price,
      this.category,
      this.description,
      this.briefDescription,
      this.remainingSizeUK,
      this.remainingSizeUS,
      this.productType});

  Map<String, dynamic> toMap() {
    return {
      'images': images,
      'colors': colors,
      'isFavourite': isFavourite,
      'title': title,
      'price': price,
      'category': category,
      'description': description,
      'briefDescription': briefDescription,
      'remainingSizeUK': remainingSizeUK,
      'remainingSizeUS': remainingSizeUS,
      'productType': productType.toString().split('.').last,
    };
  }

  static Product fromMap(Map<String, dynamic> map) {
    return Product(
        id: map['product_id'],
        images: List<String>.from(json.decode(map['images'])),
        colors: map['colors'],
        title: map['title'],
        price: map['price'],
        isFavourite: map['isFavourite'] == 1 ? true : false,
        category: map['category'],
        description: map['description'],
        briefDescription: map['briefDescription'],
        remainingSizeUK: List<double>.from(json.decode(map['remainingSizeUK'])),
        remainingSizeUS: List<double>.from(json.decode(map['remainingSizeUS'])),
        productType: map['productType']);
  }

  Map<String, dynamic> toMapSql() {
    return {
      'product_id': id,
      'images': json.encode(images),
      'colors': colors,
      'isFavourite': isFavourite ? 1 : 0,
      'title': title,
      'price': price,
      'category': category,
      'description': description,
      'briefDescription': briefDescription,
      'remainingSizeUK': json.encode(remainingSizeUK),
      'remainingSizeUS': json.encode(remainingSizeUS),
      'productType': productType,
    };
  }

  @override
  String toString() {
    return 'Product{id: $id, title: $title, briefDescription: $briefDescription, description: $description, images: $images, colors: $colors, price: $price, isFavourite: $isFavourite, remainingSizeUK: $remainingSizeUK, remainingSizeUS: $remainingSizeUS, productType: $productType}';
  }
}

// List<Product> demoProducts = [
//   Product(
//       images: [R.icon.snkr02],
//       colors: 0xFF82B1FF,
//       title: 'Air-Max-273-Big-KIDS',
//       price: 130,
//       category: 'Nike',
//       description: 'description',
//       briefDescription: 'briefDescription',
//       remainingSizeUK: [7.5, 8, 9],
//       remainingSizeUS: [40, 41, 42],
//       productType: ProductType.UPCOMMING),
//   Product(
//       images: [R.icon.snkr01],
//       colors: 0xFF82B1FF,
//       title: 'Air-Max-274-Big-KIDS',
//       price: 130,
//       category: 'Adidas',
//       description: 'description',
//       briefDescription: 'briefDescription',
//       remainingSizeUK: [7.5, 8, 9],
//       remainingSizeUS: [40, 41, 42],
//       productType: ProductType.FEATURED),
//   Product(
//       images: [R.icon.snkr03],
//       colors: 0xFF82B1FF,
//       title: 'Air-Max-275-Big-KIDS',
//       price: 130,
//       category: 'Puma',
//       description: 'description',
//       briefDescription: 'briefDescription',
//       remainingSizeUK: [7.5, 8, 9],
//       remainingSizeUS: [40, 41, 42],
//       productType: ProductType.NEW),
//
//   Product(
//       images: ["assets/snkr_02.png"],
//       colors: 0xFF82B1FF,
//       title: 'Air-Max-276-Big-KIDS',
//       price: 130,
//       category: 'Nike',
//       description: 'description',
//       briefDescription: 'briefDescription',
//       remainingSizeUK: [7.5, 8, 9],
//       remainingSizeUS: [40, 41, 42],
//       productType: ProductType.UPCOMMING),
//   Product(
//       images: ["assets/snkr_01.png"],
//       colors: 0xFF82B1FF,
//       title: 'Air-Max-277-Big-KIDS',
//       price: 130,
//       category: 'Adidas',
//       description: 'description',
//       briefDescription: 'briefDescription',
//       remainingSizeUK: [7.5, 8, 9],
//       remainingSizeUS: [40, 41, 42],
//       productType: ProductType.FEATURED),
//   Product(
//       images: ["assets/snkr_03.png"],
//       colors: 0xFF82B1FF,
//       title: 'Air-Max-278-Big-KIDS',
//       price: 130,
//       category: 'Puma',
//       description: 'description',
//       briefDescription: 'briefDescription',
//       remainingSizeUK: [7.5, 8, 9],
//       remainingSizeUS: [40, 41, 42],
//       productType: ProductType.NEW),
// ];

List<String> categories = ['Nike', 'Adidas', 'Puma', 'Converse'];
