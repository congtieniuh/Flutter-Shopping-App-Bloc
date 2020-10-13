import 'package:flutter/material.dart';
import 'package:shopping_app/resources/resources.dart';
import 'package:shopping_app/widget/appbar.dart';
import 'package:intl/intl.dart';

class ShippingMethodScreen extends StatefulWidget {
  @override
  _ShippingMethodScreenState createState() => _ShippingMethodScreenState();
}

class _ShippingMethodScreenState extends State<ShippingMethodScreen> {
  final formatCurrency = new NumberFormat.simpleCurrency();
  var _isSelectedShipMethod = false;
  var _currentIndexShipMethod  = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white70,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
                padding: const EdgeInsets.only(
                    top: 16, left: 28, right: 28, bottom: 16),
                child: Text(
                  'Shipping method',
                  style: headingText1,
                )),
            Container(
              color: Colors.grey[300],
              height: 1,
            ),
            Padding(
                padding: const EdgeInsets.only(
                    top: 16, left: 28, right: 28, bottom: 16),
                child: Text(
                  'Choose your shipping method',
                  style: textMedium,
                )),
            Expanded(
              child: ListView(
                children: [
                  cartShipping('Free Shipping', 0.0, Strings.dummyShipping1),
                  cartShipping('Free Shipping', 0.0, Strings.dummyShipping1),
                  cartShipping('Free Shipping', 0.0, Strings.dummyShipping1),
                  _nextButton()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _nextButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: RaisedButton(
          padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)),
          onPressed: () {
          },
          color: AppColors.indianRed,
          child: Text(
            'Next',
            style: whiteText,
          )),
    );
  }

  Widget cartShipping(String title, double price, String description) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.cyan[50], borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 26, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: textMedium,
                ),
                Text(
                  formatCurrency.format(price),
                  style: textMedium,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              description,
              style: minorText,
            ),
          )
        ],
      ),
    );
  }
}
