import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shopping_app/feature/product/model/category.dart';
import 'package:shopping_app/feature/product/model/product.dart';
import 'package:shopping_app/resources/resources.dart';
import 'package:shopping_app/widget/app_nav_bar.dart';
import 'package:shopping_app/widget/appbar.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {

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
            Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'More',
                        style: headingText,
                      ),
                      IconButton(
                          icon: Image.asset(
                            'assets/icon/right-arrow.png',
                          ),
                          onPressed: () {})
                    ],
                  ),
                )),
            Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Flexible(flex: 2, child: _buildCardBottomNew()),
                      Flexible(flex: 2, child: _buildCardBottomNew())
                    ],
                  ),
                ))
          ],
        ),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
            ]),
            child: AppNavBar()
        )
    );
  }

  Widget _buildCardBottomNew() {
    return Card(
      color: Colors.white,
      child: Stack(
        children: [
          Align(
            child: Container(
              width: 30,
              height: 100,
              color: AppColors.indianRed,
              child: Center(
                child: RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    'New',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            alignment: Alignment.topLeft,
          ),
          Align(
            child: IconButton(
                icon: Image.asset(
                  'assets/icon/heart_outline.png',
                  width: 20,
                  height: 20,
                ),
                onPressed: () {}),
            alignment: Alignment.topRight,
          ),
          Align(
            child: Image.asset(
              'assets/snkr_01.png',
              height: 150,
              width: 150,
            ),
            alignment: Alignment.center,
          ),
          Align(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Nike Air Max',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$130.00',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            alignment: Alignment.bottomCenter,
          )
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
          print(product.images[0]);
          return Stack(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                width: 200,
                height: 400,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nike',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Epic React',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 22),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('130', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 50,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                      width: 200,
                      height: 200,
                      child: Image.asset(
                        '${product.images[0]}',
                        fit: BoxFit.contain,
                      )),
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 30,
                  child: IconButton(
                      icon: Image.asset(
                        'assets/icon/right-arrow.png',
                        color: Colors.white,
                      ),
                      onPressed: () {}))
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
