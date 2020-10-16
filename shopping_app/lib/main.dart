import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/feature/cart/bloc/cart_bloc.dart';
import 'package:shopping_app/feature/discover/bloc/discover_bloc.dart';
import 'package:shopping_app/feature/product_details/bloc/product_details_bloc.dart';
import 'package:shopping_app/route/router.dart';
import 'bloc_observer.dart';
import 'db/db_provider.dart';
import 'feature/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  await DBProvider.instance.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final discoverBloc = DiscoverBloc();
  final cartBloc = CartBloc();
  final productDetailsBloc = ProductDetailsBloc();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              return discoverBloc;
            },
          ),
          BlocProvider(
            create: (context) {
              return cartBloc..add(CartLoadingEvent());
            },
          ),
          BlocProvider(
            create: (context) {
              return productDetailsBloc;
            },
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter.generateRoute,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: HomeScreen()));
  }

  @override
  void dispose() {
    discoverBloc.close();
    cartBloc.close();
    productDetailsBloc.close();
    super.dispose();
  }
}
