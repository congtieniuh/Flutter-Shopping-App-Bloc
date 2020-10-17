import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  final Color color;
  final Widget child;
  final void Function() onTap;
  final EdgeInsetsGeometry padding;

  const CardComponent({
    Key key,
    this.color,
    @required this.child,
    this.onTap,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      color: color ?? Theme.of(context).cardTheme.color,
      elevation: 30,
      shadowColor: Colors.black.withOpacity(0.3),
      margin: const EdgeInsets.only(bottom: 20, top: 10),
      child: InkWell(
        splashColor: Theme.of(context).primaryColor,
        onTap: onTap,
        child: Padding(
          padding: padding ?? const EdgeInsets.all(0),
          child: child,
        ),
      ),
    );
  }
}
