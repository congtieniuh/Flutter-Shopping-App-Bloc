import 'package:flutter/material.dart';
import 'package:shopping_app/resources/app_theme.dart';

class CommonAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Color color;
  final Color textColor;
  const CommonAppBar({Key key,@required this.title, this.color, this.textColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: color ?? Colors.grey[100],
      title: Text(
        title,
        style: TextStyle(
          color: textColor ?? Colors.black,
          fontSize: 24,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}
