import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoaderPage extends StatefulWidget {
  final double hightDiv;

  const LoaderPage({Key key, this.hightDiv}) : super(key: key);

  @override
  _LoaderPageState createState() => _LoaderPageState();
}

class _LoaderPageState extends State<LoaderPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Container(
              child: SpinKitCubeGrid(color: Colors.redAccent)),
      ),
    );
  }
}
