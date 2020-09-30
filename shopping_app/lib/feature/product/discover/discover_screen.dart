import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopping_app/common/widget/appbar.dart';
import 'package:shopping_app/feature/product/model/category.dart';
import 'package:shopping_app/feature/product/model/product.dart';

class DiscoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Discover'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(height: 70, child: _buildListCategory()),
          Flexible(
              flex: 3,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Container(width: 70, child: _buildListType()),
                    Expanded(child: _buidListProduct()),
                  ],
                ),
              )),
          Flexible(flex: 2, child: Container())
        ],
      ),
    );
  }

  Widget _buidListProduct() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: demoProducts.length,
        itemBuilder: (context, index) {
          var product = demoProducts[index];
          print(product.title);
          return Stack(
            children: [
              Container(
                margin: EdgeInsets.all(15),
                width: 200,
                height: 500,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Text(''),
              ),
              Positioned(
                right: -8,
                bottom: 100,
                child:
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                      width: 200,
                      height: 200,
                      child: Image.asset('assets/snkr_01.png')),
                ),
              )
            ],
          );
        });
  }

  Widget _buildListType() {
    var types = ["Upcomming", "Featured", "New"];
    return ListView.builder(
        itemCount: types.length,
        itemBuilder: (context, index) {
          var type = types[index];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: RotatedBox(
              quarterTurns: -1,
              child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    type,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  )),
            ),
          );
        });
  }

  Widget _buildListCategory() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          var category = categories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: FlatButton(
                onPressed: () {},
                child: Text(
                  category.manufacturer,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                )),
          );
        });
  }
}
