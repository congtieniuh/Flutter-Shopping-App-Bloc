import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shopping_app/feature/auth/login/bloc/login_bloc.dart';
import 'package:shopping_app/resources/R.dart';
import 'package:shopping_app/resources/resources.dart';
import 'package:shopping_app/route/route_constants.dart';
import 'package:shopping_app/widget/appbar.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc _loginBloc;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _loginBloc = context.bloc<LoginBloc>();
  }

  Widget emailField() {
    return StreamBuilder(
      stream: _loginBloc.emailStream,
      builder: (context, snapshot) => TextFormField(
        onChanged: _loginBloc.changeEmail,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          errorText: snapshot.error,
          labelText: R.strings.emailLabel,
        ),
      ),
    );
  }

  Widget passwordField() {
    return StreamBuilder(
      stream: _loginBloc.passwordStream,
      builder: (context, snapshot) => TextFormField(
        onChanged: _loginBloc.changePassword,
        obscureText: true,
        decoration: InputDecoration(
            errorText: snapshot.error, labelText: R.strings.passwordLabel),
      ),
    );
  }

  Widget submitLogin() {
    return StreamBuilder(
      stream: _loginBloc.submitValidStream,
      builder: (context, snapshot) => RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 0.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        onPressed: (){
          if(snapshot.hasData){
            Navigator.pushNamedAndRemoveUntil(
                context, RouteConstant.homeRoute, (r) => false);
          } else {
            createSnackBar("Currently logged");
          }
        },
        color: AppColors.indianRed,
        child: Text(
          R.strings.loginTitle,
          style: whiteText,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      appBar: CommonAppBar(title: R.strings.loginTitle),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 30.0,
              ),
              emailField(),
              SizedBox(
                height: 15.0,
              ),
              passwordField(),
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Text(R.strings.forgotPassword)),
              SizedBox(
                height: 70,
              ),
              submitLogin(),
              SizedBox(
                height: 18.0,
              ),
              Center(
                child: RichText(
                    text: TextSpan(
                        text: 'Don have account? ',
                        style: minorText,
                        children: [
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                  context, RouteConstant.registerRoute);
                            },
                          text: 'Register',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline))
                    ])),
              ),
              SizedBox(
                height: 50.0,
              ),
              Center(child: Text('Or Login with')),
              SizedBox(
                height: 30.0,
              ),
              _loginWithSocicalNetwork(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginWithSocicalNetwork() {
    return Row(
      children: [
        Expanded(
          child: RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 0.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            onPressed: () {},
            color: AppColors.cornflowerBlue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Ionicons.logo_facebook,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  R.strings.facebook,
                  style: whiteText,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        Expanded(
          child: RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 0.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            onPressed: () {},
            color: AppColors.indianRed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Ionicons.logo_google,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  R.strings.google,
                  style: whiteText,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void login() async {}

  void createSnackBar(String message) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(message)));
  }
}
