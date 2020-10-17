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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _authService = AuthBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white70,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Center(child: Text(Strings.registerTitle, style: TextStyle(color: Colors.black),),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: _buildTextFormField(Strings.firstName,
                            _firstNameController, TextInputType.text)),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: _buildTextFormField(Strings.lastName,
                            _lastNameController, TextInputType.text)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              _buildTextFormField(
                  Strings.username, _usernameController, TextInputType.text),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                readOnly: true,
                controller: _dobController,
                decoration: InputDecoration(
                  labelText: Strings.dob,
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                ),
                onTap: () => _selectDate(context),
              ),
              SizedBox(
                height: 10,
              ),
              _buildTextFormField(Strings.emailLabel, _emailController,
                  TextInputType.emailAddress),
              SizedBox(
                height: 10,
              ),
              _buildPasswordField(Strings.passwordLabel, _passwordController),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 0.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    _formKey.currentState.save();

                    UserData userData = UserData()
                      ..firstname = _firstNameController.text
                      ..lastname = _lastNameController.text
                      ..dob = _dobController.text
                      ..username = _usernameController.text
                      ..email = _emailController.text
                      ..password = _passwordController.text;

                    await _authService.register(userData);
                  } else {
                    createSnackBar('Something went wrong');
                  }
                },
                color: AppColors.indianRed,
                child: Text(
                  Strings.registerTitle,
                  style: whiteText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void createSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(
        new SnackBar(
            content: new Text(message)
        )
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();

    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _dobController.text = selectedDate.toString();
      });
  }

  Widget _buildTextFormField(
      String title, TextEditingController controller, TextInputType inputType) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
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

  Widget _buildPasswordField(String title, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
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
