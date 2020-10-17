import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/feature/discover/bloc/discover_bloc.dart';
import 'package:shopping_app/feature/discover/model/product.dart';
import 'package:shopping_app/resources/R.dart';
import 'package:shopping_app/resources/resources.dart';
import 'package:shopping_app/route/route_constants.dart';
import 'package:shopping_app/widget/appbar.dart';
import 'package:shopping_app/widget/card_product.dart';

import '../../../route/route_constants.dart';
import '../bloc/discover_bloc.dart';
import '../model/product.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  var _isSelectedCategory = false;
  var _currentIndexCategory = 0;

  var _isSelectedProductType = false;
  var _currentIndexProductType = 0;

  String _currentProductType = '';
  String _currentCategory = '';

  double width;
  double height;

  List<Product> listProduct;

  @override
  void initState() {
    super.initState();
    context.bloc<DiscoverBloc>().add(LoadingDiscoverEvent(
      category: categories[_currentIndexCategory],
      productType: ProductType.values()[_currentIndexProductType]
    ));
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: CommonAppBar(title: 'Discover'),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(height: 70, child: _buildListCategory()),
            Row(
              children: [
                Container(
                    width: width * 0.1,
                    height: height * 0.40,
                    child: _buildListType()),
                Container(
                    width: width * 0.9,
                    height: height * 0.40,
                    child: _buildListProduct()),
              ],
            ),
            Padding(
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
                        R.icon.rightArrow,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RouteConstant.productCategory, arguments: {
                          "listProduct": listProduct,
                          "categoryName": categories[_currentIndexCategory]
                        });
                      })
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Flexible(flex: 2, child: _buildCardBottomNew()),
                  Flexible(flex: 2, child: _buildCardBottomNew())
                ],
              ),
            )
          ],
        ));
  }

  Widget _buildCardBottomNew() {
    return Card(
      color: Colors.white,
      child: Container(
        width: width * 0.5,
        height: width * 0.4,
        child: Stack(
          children: [
            Align(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    width: constraints.maxWidth * 0.15,
                    height: constraints.maxHeight * 0.5,
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
                  );
                },
              ),
              alignment: Alignment.topLeft,
            ),
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
            Align(
              alignment: Alignment.bottomCenter,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/snkr_01.png',
                        width: constraints.maxWidth * 0.5,
                        height: constraints.maxHeight * 0.5,
                      ),
                      Column(
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
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListProduct() {
    return BlocBuilder<DiscoverBloc, DiscoverState>(
      builder: (context, state) {
        listProduct = [];

        if (state is DiscoverLoadFinished) {
          listProduct = state.products;
        }

        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listProduct.length,
            itemBuilder: (context, index) {
              var product = listProduct[index];
              print(product.images[0]);
              return CardProduct(
                product: product,
                onTapCard: () {
                  Navigator.pushNamed(
                      context, RouteConstant.productDetailsRoute,
                      arguments: product.id);
                },
              );
            });
      },
    );
  }

  Widget _buildListType() {
    return ListView.builder(
        itemCount: ProductType.values().length,
        itemBuilder: (context, index) {
          var type = ProductType.values()[index];
          _isSelectedProductType = _currentIndexProductType == index;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: RotatedBox(
              quarterTurns: -1,
              child: FlatButton(
                  onPressed: () => _onClickFilterProductType(index, type),
                  child: Text(
                    type,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _isSelectedProductType
                            ? Colors.black
                            : Colors.grey),
                  )),
            ),
          );
        });
  }

  Widget _buildListCategory() {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          var category = categories[index];
          _isSelectedCategory = _currentIndexCategory == index;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: FlatButton(
                onPressed: () => _onClickFilterCategory(index, category),
                child: Text(
                  category,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: _isSelectedCategory ? Colors.black : Colors.grey),
                )),
          );
        });
  }

  _onClickFilterProductType(int index, String type) {
    setState(() {
      _currentIndexProductType = index;
    });
    _currentProductType = type;

    BlocProvider.of<DiscoverBloc>(context).add(LoadingDiscoverEvent(
        category: _currentCategory, productType: _currentProductType));
  }

  _onClickFilterCategory(int index, String category) {
    setState(() {
      _currentIndexCategory = index;
    });

    _currentCategory = category;

    BlocProvider.of<DiscoverBloc>(context).add(LoadingDiscoverEvent(
        category: _currentCategory, productType: _currentProductType));
  }
}
