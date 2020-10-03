import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/feature/auth/auth_service.dart';
import 'package:shopping_app/feature/auth/login/login_screen.dart';
import 'package:shopping_app/route/route_constants.dart';
import 'package:shopping_app/route/router.dart';
import 'file:///D:/flutter/flutter_project/important/shopping_app/lib/feature/home/home.dart';
import 'feature/discover/ui/discover_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp(defaultRoute: await getDefaultRoute()));
}

Future<String> getDefaultRoute() async {
  AuthService _authService = AuthService();
  var isSignedIn = await _authService.isSignedIn();
  return isSignedIn ? homeRoute : loginRoute;
}

class MyApp extends StatelessWidget {
  final String defaultRoute;

  const MyApp({Key key, this.defaultRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: defaultRoute,
      onGenerateRoute: AppRouter.generateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
