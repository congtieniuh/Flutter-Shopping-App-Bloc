import 'package:flutter/material.dart';
import '../app_theme.dart';

class CommonAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const CommonAppBar({Key key,@required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.grey[100],
      title: Center(
          child: Text(
            title,
            style: headingText,
          )),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}
