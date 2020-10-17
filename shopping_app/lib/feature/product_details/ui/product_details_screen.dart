import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:shopping_app/feature/discover/model/product.dart';
import 'package:shopping_app/feature/product_details/bloc/product_details_bloc.dart';
import 'package:shopping_app/resources/app_theme.dart';
import 'package:shopping_app/resources/colors.dart';
import 'package:shopping_app/route/route_constants.dart';
import 'package:shopping_app/widget/bottom_dialog.dart';
import 'package:shopping_app/widget/loader_wiget.dart';

import 'popup_desc_details.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String productId;

  const ProductDetailsScreen({Key key, this.productId}) : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final formatCurrency = new NumberFormat.simpleCurrency();
  var _isSelectedSize = false;
  var _currentIndexSize = 0;

  Product product;

  var _isAddedToBag = false;

  @override
  void initState() {
    super.initState();
    context
        .bloc<ProductDetailsBloc>()
        .add(LoadProductDetails(widget.productId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
      builder: (context, state) {
        if (state is LoadProductDetailsFinished) {
          product = state.product;
        }

        return Scaffold(
          appBar: product == null
              ? AppBar(
                  backgroundColor: Colors.white38,
                )
              : _toolbar(),
          body: product == null
              ? LoaderPage()
              : Stack(
                  children: [_contentBody(), _buttonAddToBag()],
                ),
        );
      },
    );
  }

  Widget _contentBody() {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: [
        Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                            MediaQuery.of(context).size.width / 2))),
                child: Center(
                    child: Container(
                  margin: EdgeInsets.only(right: 40),
                  child: Image.asset(
                    product.images[0],
                    width: 300,
                    fit: BoxFit.fill,
                  ),
                ))),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        SizedBox(height: 100, child: listImageDetails(product.images)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Container(
            height: 2,
            color: Colors.grey[300],
          ),
        ),
        bodyContentDetails()
      ],
    );
  }

  Widget _toolbar() {
    return AppBar(
      backgroundColor: Colors.redAccent,
      elevation: 0,
      title: Text(
        product.category ?? "",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            onPressed: () => addToWishlistClick(),
            color: Colors.redAccent,
            shape: CircleBorder(),
            elevation: 6,
            child: Icon(
              product.isFavourite
                  ? Ionicons.ios_heart
                  : Ionicons.ios_heart_empty,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget bodyContentDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                formatCurrency.format(product.price),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            product.description,
            style: TextStyle(color: Colors.black54),
            maxLines: 5,
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () async {
              await showModalBottomSheet(
                context: context,
                elevation: 30,
                backgroundColor: Colors.transparent,
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(20),
                  child: BottomDialog(
                    title: product.title,
                    child: Text('${product.description}'),
                  ),
                ),
              );
            },
            child: Text(
              'MORE DETAILS',
              style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 26,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Size',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Row(
                children: [
                  Text(
                    'UK',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'USA',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          SizedBox(height: 60, child: listSize(product.remainingSizeUS)),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  Widget listImageDetails(List<String> images) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: images.length,
      itemBuilder: (context, index) {
        String image = images[index];
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 6.0),
          width: 100,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Image.asset(
              image,
            ),
          ),
        );
      },
    );
  }

  Widget listSize(List<double> sizes) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: sizes.length,
      itemBuilder: (context, index) {
        double size = sizes[index];
        _isSelectedSize = _currentIndexSize == index;
        return GestureDetector(
          onTap: () => onSelectedSize(index, size),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 6.0),
            width: 100,
            height: 50,
            decoration: BoxDecoration(
                color: _isSelectedSize ? Colors.black : Colors.white,
                border: Border.all(color: Colors.grey[300]),
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Center(
                  child: Text(
                    "$size",
                    style: TextStyle(
                        color: _isSelectedSize ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                )),
          ),
        );
      },
    );
  }

  Widget _buttonAddToBag() {
    return BlocListener(
      bloc: context.bloc<ProductDetailsBloc>(),
      listener: (context, state) {
        if (state is AddProductToBagFinished) {
          if (_isAddedToBag) {
            Navigator.pushNamed(context, RouteConstant.cart);
          }
          setState(() {
            _isAddedToBag = true;
          });
        }
      },
      child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            width: double.infinity,
            child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                onPressed: () => addProductToCart(),
                color: _isAddedToBag
                    ? AppColors.paleVioletRed
                    : AppColors.indianRed,
                child: Text(
                  _isAddedToBag ? 'GO TO BAG' : 'ADD TO BAG',
                  style: whiteText,
                )),
          )),
    );
  }

  onSelectedSize(int index, double size) {
    setState(() {
      _currentIndexSize = index;
    });
  }

  addProductToCart() {
    BlocProvider.of<ProductDetailsBloc>(context).add(AddProductToCart(product));
  }

  addToWishlistClick() {
    context.bloc<ProductDetailsBloc>().add(AddToWishlistEvent(product));
  }
}
