import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shopping_app/feature/cart/bloc/cart_bloc.dart';
import 'package:shopping_app/feature/cart/models/cart_item.dart';
import 'package:shopping_app/resources/app_theme.dart';
import 'package:shopping_app/widget/appbar.dart';
import 'package:intl/intl.dart';

class CartScreen extends StatelessWidget {
  final formatCurrency = new NumberFormat.simpleCurrency();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              var cartItems = <CartItem>[];
              if (state is CartLoadFinished) {
                cartItems = state.cartItems;
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 16, left: 28, right: 28, bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'My Bag',
                            style: headingText,
                          ),
                          Text('Total ${cartItems.length} items')
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 1,
                      color: Colors.grey[300],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final cartItem = cartItems[index];
                        return Container(child: _cartItem(cartItem));
                      },
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }

  Widget _cartItem(CartItem cartItem) {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.all(24),
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(26)),
            ),
            Positioned(
                right: 0,
                bottom: 40,
                child: Center(
                    child: Image.asset(
                  cartItem.product.images[0],
                  width: 140,
                )))
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cartItem.product.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                formatCurrency.format(cartItem.product.price),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 40,
                    height: 30,
                    child: OutlineButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      child: Icon(Icons.remove),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13)),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        '2',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    width: 40,
                    height: 32,
                    child: OutlineButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      child: Icon(Icons.add),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13)),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
