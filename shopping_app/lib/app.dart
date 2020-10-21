import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shopping_app/feature/auth/login/bloc/login_bloc.dart';
import 'package:shopping_app/localization/app_localization.dart';
import 'package:shopping_app/route/router.dart';

import 'feature/cart/bloc/cart_bloc.dart';
import 'feature/discover/bloc/discover_bloc.dart';
import 'feature/home/home.dart';
import 'feature/product_details/bloc/product_details_bloc.dart';
import 'feature/profile/bloc/profile_bloc.dart';

class MyApp extends StatefulWidget {
  final String initialRoute;

  const MyApp({Key key, this.initialRoute}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final discoverBloc = DiscoverBloc();
  final cartBloc = CartBloc();
  final productDetailsBloc = ProductDetailsBloc();
  final profileBloc = ProfileBloc();
  final loginBloc = LoginBloc();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

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
              return profileBloc;
            },
          ),
          BlocProvider(
            create: (context) {
              return productDetailsBloc;
            },
          ),
          BlocProvider(
            create: (context) {
              return loginBloc;
            },
          ),
        ],
        child: MaterialApp(
            initialRoute: widget.initialRoute,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter.generateRoute,
            locale: Locale('en', ''),
            supportedLocales: [
              const Locale('en', ''), // English
              const Locale('vi', ''), // Vietnamese
            ],
            localizationsDelegates: [
              AppLocalization.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (locale, supportedLocales) {
              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale.languageCode &&
                    supportedLocale.countryCode == locale.countryCode) {
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },
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
    profileBloc.close();
    loginBloc.close();
    super.dispose();
  }
}
