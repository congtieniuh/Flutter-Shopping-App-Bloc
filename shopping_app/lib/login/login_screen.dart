import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/common/app_theme.dart';
import 'package:shopping_app/common/colors.dart';
import 'package:shopping_app/common/strings.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[100],
        title: Center(
            child: Text(
          Strings.loginTitle,
          style: headingText,
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 30.0,),
            TextFormField(
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
              onPressed: () {},
              color: AppColors.indianRed,
              child: Text(
                Strings.loginTitle,
                style: whiteText,
              ),
            ),
            SizedBox(height: 18.0,),
            Center(
              child: RichText(
                  text: TextSpan(text: 'Don have account? ',
                      style: minorText
                      , children: [
                TextSpan(
                    text: 'Register',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline))
              ])),
            ),
            SizedBox(height: 50.0,),
            Center(child: Text('Or Login with')),
            SizedBox(height: 30.0,),
            Row(
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
                        Icon(Icons.face, color: Colors.white,),
                        SizedBox(width: 10,),
                        Text(
                          Strings.facebook,
                          style: whiteText,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16.0,),
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
                        Icon(Icons.face, color: Colors.white,),
                        SizedBox(width: 10,),
                        Text(
                          Strings.google,
                          style: whiteText,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
