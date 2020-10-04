import 'package:flutter/material.dart';
import 'package:shopping_app/feature/auth/model/user_app.dart';
import 'package:shopping_app/resources/resources.dart';
import 'package:shopping_app/widget/appbar.dart';

import '../auth_bloc.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  AuthBloc _authService;
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _authService = AuthBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: Strings.registerTitle),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: _buildTextFormField(
                          Strings.firstName, _firstNameController)),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: _buildTextFormField(
                          Strings.lastName, _lastNameController)),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            _buildTextFormField(Strings.username, _usernameController),
            SizedBox(
              height: 10,
            ),
            _buildTextFormField(Strings.dob, _dobController),
            SizedBox(
              height: 10,
            ),
            _buildTextFormField(Strings.emailLabel, _emailController),
            SizedBox(
              height: 10,
            ),
            _buildTextFormField(Strings.passwordLabel, _passwordController),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 0.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              onPressed: () async {
                UserData userData = UserData()
                  ..firstname = _firstNameController.text
                  ..lastname = _lastNameController.text
                  ..dob = _dobController.text
                  ..username = _usernameController.text
                  ..email = _emailController.text
                  ..password = _passwordController.text;

                await _authService.register(userData);
              },
              color: AppColors.indianRed,
              child: Text(
                Strings.loginTitle,
                style: whiteText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField(String title, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        return value.isEmpty ? Strings.error_msg_cmn : null;
      },
      decoration: InputDecoration(
        labelText: title,
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      ),
    );
  }
}
