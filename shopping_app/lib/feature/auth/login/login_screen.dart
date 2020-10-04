import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/feature/auth/register/register_screen.dart';
import 'package:shopping_app/resources/resources.dart';
import 'package:shopping_app/route/route_constants.dart';
import 'package:shopping_app/widget/appbar.dart';
import '../auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthBloc _authService;

  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _authService = AuthBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: CommonAppBar(title: Strings.loginTitle),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 30.0,
            ),
            TextFormField(
              controller: _emailController,
              validator: (value) {
                return value.isEmpty ? Strings.error_msg_email : null;
              },
              decoration: InputDecoration(
                labelText: Strings.emailLabel,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              validator: (value) {
                return value.isEmpty ? Strings.error_msg_pwd : null;
              },
              decoration: InputDecoration(labelText: Strings.passwordLabel),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.topRight,
                child: Text(Strings.forgotPassword)),
            SizedBox(
              height: 70,
            ),
            RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 0.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              onPressed: () async {
                var result = await _authService.signIn(
                    _emailController.text, _passwordController.text);
                if (result) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, homeRoute, (r) => false);
                } else {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Login failed"),
                  ));
                }
              },
              color: AppColors.indianRed,
              child: Text(
                Strings.loginTitle,
                style: whiteText,
              ),
            ),
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
                                Navigator.pushNamed(context, registerRoute);
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
    );
  }


  Widget _loginWithSocicalNetwork() {
    return Row(
      children: [
        Expanded(
          child: RaisedButton(
            padding:
            EdgeInsets.symmetric(vertical: 14.0, horizontal: 0.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            onPressed: () {},
            color: AppColors.cornflowerBlue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.face,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  Strings.facebook,
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
            padding:
            EdgeInsets.symmetric(vertical: 14.0, horizontal: 0.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            onPressed: () {},
            color: AppColors.indianRed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.face,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  Strings.google,
                  style: whiteText,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
