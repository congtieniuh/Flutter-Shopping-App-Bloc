import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/feature/auth/auth_bloc.dart';
import 'package:shopping_app/route/route_constants.dart';

import 'app.dart';
import 'bloc_observer.dart';
import 'db/db_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  await DBProvider.instance.init();

  AuthBloc _authBloc = AuthBloc();
  var initialRoute = await _authBloc.isSignedIn()
      ? RouteConstant.homeRoute
      : RouteConstant.loginRoute;

  runApp(MyApp(
    initialRoute: initialRoute,
  ));
}
