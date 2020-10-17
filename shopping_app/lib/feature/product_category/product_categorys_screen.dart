import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shopping_app/resources/R.dart';
import 'package:shopping_app/resources/resources.dart';
import 'package:shopping_app/route/route_constants.dart';
import '../discover/model/product.dart';
import 'package:intl/intl.dart';

class ProductCategoryScreen extends StatefulWidget {
  final List<Product> listProduct;
  final String categoryName;

  ProductCategoryScreen({@required this.listProduct, this.categoryName});

  @override
  _ProductCategoryScreenState createState() => _ProductCategoryScreenState();
}

class _ProductCategoryScreenState extends State<ProductCategoryScreen> {
  final formatCurrency = new NumberFormat.simpleCurrency();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white70,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
              padding: const EdgeInsets.only(
                  top: 16, left: 28, right: 28, bottom: 16),
              child: Text(
                '${widget.categoryName}',
                style: headingText1,
              )),
          Expanded(
            child: GridView.builder(
              itemCount: widget.listProduct.length ?? 0,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                var product = widget.listProduct[index];
                return _buildCardProduct(product);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCardProduct(Product product) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
          context, RouteConstant.productDetailsRoute,
          arguments: product.id),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        color: Colors.white,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                child: IconButton(
                    icon: Image.asset(
                      R.icon.heartOutline,
                      width: 20,
                      height: 20,
                    ),
                    onPressed: () {}),
                alignment: Alignment.topRight,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(pi),
                    child: Image.asset(
                      product.images[0],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Text(
                  product.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 12),
                child: Text(
                  "${formatCurrency.format(product.price)}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
