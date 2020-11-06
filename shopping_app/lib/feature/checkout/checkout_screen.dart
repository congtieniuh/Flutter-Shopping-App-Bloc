import 'package:flutter/material.dart';
import 'package:shopping_app/feature/credit_card_details/models/credit_card_model.dart';
import 'package:shopping_app/resources/R.dart';
import 'package:shopping_app/resources/resources.dart';
import 'package:shopping_app/route/route_constants.dart';
import 'package:shopping_app/widget/appbar.dart';
import 'package:intl/intl.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final formatCurrency = NumberFormat.simpleCurrency();

  CreditCard resultCreditCard = creditCards[0];

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Shipping address',
              style: headingText,
            ),
            Card(
              margin: EdgeInsets.only(top: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Jane Doe',
                        ),
                        FlatButton(
                            onPressed: () {},
                            child: Text(
                              'Change',
                              style: TextStyle(color: Colors.orange),
                            )),
                      ],
                    ),
                    Text(R.strings.dummyShipping1)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Payment',
                  style: headingText,
                ),
                FlatButton(
                    onPressed: () async => changePayment(),
                    child: Text(
                      'Change',
                      style: TextStyle(color: Colors.orange),
                    )),
              ],
            ),
            Row(
              children: [
                Card(
                    margin: EdgeInsets.only(right: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        resultCreditCard != null ? resultCreditCard.image :R.icon.masterCard,
                        width: 30,
                        height: 30,
                      ),
                    )),
                Text(resultCreditCard != null ? resultCreditCard.cardNumber : '')
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Delivery method',
              style: headingText,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                deliveryCard(R.icon.ex01),
                deliveryCard(R.icon.ex02),
                deliveryCard(R.icon.ex03),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            rowOrderInfo('Order:', 112),
            rowOrderInfo('Delivery:', 112),
            rowOrderInfo('Summary:', 112),
            SizedBox(
              height: 16,
            ),
            _buttonSubmitOrder()
          ],
        ),
      ),
    );
  }

  Widget rowOrderInfo(String type, double price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            type,
            style: minorText,
          ),
          Text(
            "${formatCurrency.format(price)}",
            style: textMedium,
          )
        ],
      ),
    );
  }

  Widget _buttonSubmitOrder() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: RaisedButton(
          padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
          color: AppColors.indianRed,
          child: Text(
            'SUBMIT ORDER',
            style: whiteText,
          )),
    );
  }

  Widget deliveryCard(String icon) {
    return Expanded(
      child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset(
                  icon,
                  width: 30,
                  height: 30,
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  '2-3 days',
                  style: smallText,
                ),
              ],
            ),
          )),
    );
  }

  void changePayment()  {
    Navigator.pushNamed(context, RouteConstant.creditCard).then((value) {
      setState(() {
        resultCreditCard = value as CreditCard;
      });
    });
  }
}
