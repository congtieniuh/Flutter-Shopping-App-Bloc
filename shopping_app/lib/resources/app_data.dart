

import 'package:shopping_app/feature/shipping/model/ship_method.dart';

import 'strings.dart';

class AppData {
  static List<ShipMethod>  shipMethods = [
    ShipMethod(title: "Free ship", price: 0.0, description: Strings.dummyShipping1),
    ShipMethod(title: "Free ship", price: 0.0, description: Strings.dummyShipping1),
    ShipMethod(title: "Free ship", price: 0.0, description: Strings.dummyShipping1),
  ];
}