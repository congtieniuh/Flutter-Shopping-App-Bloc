import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/feature/credit_card_details/models/credit_card_model.dart';
import 'package:shopping_app/resources/resources.dart';
import 'package:shopping_app/widget/credit_card_widget.dart';

class CreditCardDetailsScreen extends StatefulWidget {
  @override
  _CreditCardDetailsScreenState createState() =>
      _CreditCardDetailsScreenState();
}

class _CreditCardDetailsScreenState extends State<CreditCardDetailsScreen> {
  int _current = 0;

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
      body: ListView(
        children: [
          Padding(
              padding: const EdgeInsets.only(
                  top: 16, left: 28, right: 28, bottom: 16),
              child: Text(
                'Card details',
                style: headingText1,
              )),
          Container(
            color: Colors.grey[300],
            height: 1,
          ),
          Container(
            child: CarouselSlider(
              items: List.generate(creditCards.length, (index) {
                var creditCard = creditCards[index];
                return Container(
                    child: CreditCardWidget(creditCard: creditCard));
              }).toList(),
              options: CarouselOptions(
                  scrollDirection: Axis.horizontal,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
          ),
          _indicatorSlider(),
          SizedBox(
            height: 30,
          ),
          Container(
              child: rowInfo()),
          _nextButton()
        ],
      )

    );
  }

  Widget rowInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Card holder name',
            style: minorText,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '${creditCards[_current].cardHolderName}',
            style: boldTextMedium,
          ),
          Container(
            height: 1,
            color: Colors.grey[300],
            margin: EdgeInsets.symmetric(vertical: 28),
          ),

          Text(
            'Card no',
            style: minorText,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '${creditCards[_current].cardNumber}',
            style: boldTextMedium,
          ),
          Container(
            height: 1,
            color: Colors.grey[300],
            margin: EdgeInsets.symmetric(vertical: 28),
          ),

          Text(
            'Expiry',
            style: minorText,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '${creditCards[_current].expiryDate}',
            style: boldTextMedium,
          ),
          Container(
            height: 1,
            color: Colors.grey[300],
            margin: EdgeInsets.symmetric(vertical: 28),
          ),
        ],
      ),
    );
  }

  Widget _nextButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: RaisedButton(
          padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          onPressed: () {
            Navigator.pop(context, creditCards[_current]);
          },
          color: AppColors.indianRed,
          child: Text(
            'OK',
            style: whiteText,
          )),
    );
  }


  Widget _indicatorSlider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: creditCards.map((card) {
        int index = creditCards.indexOf(card);
        return Container(
          width: 12.0,
          height: 4.0,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: _current == index
                ? Color.fromRGBO(0, 0, 0, 0.9)
                : Color.fromRGBO(0, 0, 0, 0.4),
          ),
        );
      }).toList(),
    );
  }
}
