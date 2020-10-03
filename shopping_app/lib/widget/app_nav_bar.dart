import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class AppNavBar extends StatefulWidget {

  @override
  _AppNavBarState createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: GNav(
          gap: 0,
          activeColor: Colors.white,
          iconSize: 24,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          duration: Duration(milliseconds: 800),
          tabBackgroundColor: Colors.pinkAccent,
          tabs: [
            GButton(
              icon: Ionicons.ios_home,
              text: 'Home',
            ),
            GButton(
              icon: Ionicons.ios_heart,
              text: 'Favorite',
            ),
            GButton(
              icon: Ionicons.ios_locate,
              text: 'Search',
            ),
            GButton(
              icon: Ionicons.ios_cart,
              text: 'Cart',
            ),
            GButton(
              icon: Ionicons.ios_person,
              text: 'Profile',
            ),
          ],
          selectedIndex: _currentIndex,
          onTabChange: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
}
