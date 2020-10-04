import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

enum ProductType { UPCOMMING, FEATURED, NEW }

class Product {
  final int id;
  final String title, briefDescription, description;
  final List<String> images;
  final int colors;
  final double price;
  final bool isFavourite;
  final List<double> remainingSizeUK;
  final List<double> remainingSizeUS;
  final ProductType productType;

  Product(
      {this.id,
      this.images,
      this.colors,
      this.isFavourite = false,
      this.title,
      this.price,
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
      'description': description,
      'briefDescription': briefDescription,
      'remainingSizeUK': remainingSizeUK,
      'remainingSizeUS': remainingSizeUS,
      'productType': productType.toString(),
    };
  }

  @override
  String toString() {
    return 'Product{id: $id, title: $title, briefDescription: $briefDescription, description: $description, images: $images, colors: $colors, price: $price, isFavourite: $isFavourite, remainingSizeUK: $remainingSizeUK, remainingSizeUS: $remainingSizeUS, productType: $productType}';
  }
}

List<Product> demoProducts = [
  Product(
      images: ["assets/snkr_02.png"],
      colors: 0xFF82B1FF,
      title: 'Air-Max-270-Big-KIDS',
      price: 130,
      description: 'description',
      briefDescription: 'briefDescription',
      remainingSizeUK: [7.5, 8, 9],
      remainingSizeUS: [40, 41, 42],
      productType: ProductType.UPCOMMING),
  Product(
      images: ["assets/snkr_01.png"],
      colors: 0xFF82B1FF,
      title: 'Air-Max-271-Big-KIDS',
      price: 130,
      description: 'description',
      briefDescription: 'briefDescription',
      remainingSizeUK: [7.5, 8, 9],
      remainingSizeUS: [40, 41, 42],
      productType: ProductType.FEATURED),
  Product(
      images: ["assets/snkr_03.png"],
      colors: 0xFF82B1FF,
      title: 'Air-Max-272-Big-KIDS',
      price: 130,
      description: 'description',
      briefDescription: 'briefDescription',
      remainingSizeUK: [7.5, 8, 9],
      remainingSizeUS: [40, 41, 42],
      productType: ProductType.NEW),
];
