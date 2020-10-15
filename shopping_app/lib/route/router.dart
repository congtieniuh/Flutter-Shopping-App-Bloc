import 'package:flutter/material.dart';
import 'package:shopping_app/feature/auth/login/login_screen.dart';
import 'package:shopping_app/feature/auth/register/register_screen.dart';
import 'package:shopping_app/feature/cart/ui/cart_screen.dart';
import 'package:shopping_app/feature/credit_card_details/card_details_screen.dart';
import 'package:shopping_app/feature/discover/model/product.dart';
import 'package:shopping_app/feature/home/home.dart';
import 'package:shopping_app/feature/product_category/product_categorys_screen.dart';
import 'package:shopping_app/feature/product_details/ui/product_details_screen.dart';
import 'package:shopping_app/feature/shipping/shipping_method_screen.dart';
import 'package:shopping_app/route/slide_route_builder.dart';

import '../feature/discover/model/product.dart';
import 'route_constants.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.homeRoute:
        return SlideRouteBuilder(page: HomeScreen());
      case RouteConstant.productDetailsRoute:
        String productId = settings.arguments;
        return SlideRouteBuilder(
            page: ProductDetailsScreen(
              productId: productId,
        ));
      case RouteConstant.loginRoute:
        return SlideRouteBuilder(page: LoginScreen());
      case RouteConstant.registerRoute:
        return SlideRouteBuilder(page: RegisterScreen());
      case RouteConstant.cart:
        return SlideRouteBuilder(page: CartScreen());
      case RouteConstant.shippingMethod:
        return SlideRouteBuilder(page: ShippingMethodScreen());
      case RouteConstant.creditCard:
        return SlideRouteBuilder(page: CreditCardDetailsScreen());
      case RouteConstant.productCategory:
        final Map arguments = settings.arguments as Map;

        List<Product> listProduct = arguments['listProduct'];
        String categoryName = arguments['categoryName'];

        return SlideRouteBuilder(page: ProductCategoryScreen(listProduct: listProduct, categoryName: categoryName,));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
