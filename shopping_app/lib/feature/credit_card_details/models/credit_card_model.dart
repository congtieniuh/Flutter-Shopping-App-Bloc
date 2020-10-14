import 'dart:math';

import 'package:flutter/material.dart';

class CreditCard {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  MaterialColor color;

  CreditCard(
      {this.cardNumber,
      this.expiryDate,
      this.cardHolderName,
      this.cvvCode,
      this.isCvvFocused,
      this.color});
}

List<CreditCard> creditCards = [
  CreditCard(
      cardNumber: "4348 7374 8374 9873",
      expiryDate: "07/24",
      cvvCode: "333",
      cardHolderName: "Huynh Cong Tien",
      color: Colors.primaries[Random().nextInt(Colors.primaries.length)]),
  CreditCard(
      cardNumber: "5500 0000 0000 0004",
      expiryDate: "09/22",
      cvvCode: "34",
      cardHolderName: "Malayalam Sangam MN",
      color: Colors.primaries[Random().nextInt(Colors.primaries.length)]),
  CreditCard(
      cardNumber: "3400 0000 0000 009",
      expiryDate: "05/15",
      cvvCode: "65",
      cardHolderName: "Gurmukhi MN",
      color: Colors.primaries[Random().nextInt(Colors.primaries.length)]),
];
