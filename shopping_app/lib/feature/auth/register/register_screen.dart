import 'package:flutter/material.dart';
import 'package:shopping_app/resources/R.dart';
import 'package:shopping_app/resources/resources.dart';

import 'register_bloc.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

RegisterBloc _registerBloc = RegisterBloc();

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
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
        title: Center(
          child: Text(
            R.strings.registerTitle,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: _FirstNameInput()),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(child: _LastNameNameInput()),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            _DobInput(),
            SizedBox(
              height: 10,
            ),
            _EmailInput(),
            SizedBox(
              height: 10,
            ),
            _PasswordInput(),
            SizedBox(
              height: 20,
            ),
            _SubmitRegister(),
          ],
        ),
      ),
    );
  }

  void createSnackBar(String message) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(message)));
  }
}

class _SubmitRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: _registerBloc.validateResult$,
      builder: (context, snapshot) => RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 0.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        onPressed: () async {
          if (snapshot.data != null && snapshot.data) {
            _registerBloc.register().then((success) => {
                  if (success) {Navigator.pop(context)}
                });
          } else {
            print('Register failed');
          }
        },
        color: AppColors.indianRed,
        child: Text(
          R.strings.registerTitle,
          style: whiteText,
        ),
      ),
    );
  }
}

class _FirstNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: _registerBloc.firstName$,
      builder: (context, snapshot) {
        return TextFormField(
          onChanged: _registerBloc.onFirstNameChanged,
          decoration: InputDecoration(
              labelText: 'FirstName',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              errorText: snapshot.data != null && !snapshot.data
                  ? 'Required field'
                  : null),
        );
      },
    );
  }
}

class _LastNameNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _registerBloc.lastName$,
      builder: (context, snapshot) {
        return TextFormField(
          onChanged: _registerBloc.onLastNameChanged,
          decoration: InputDecoration(
              labelText: 'LastName',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              errorText: snapshot.data != null && !snapshot.data
                  ? 'Required field'
                  : null),
        );
      },
    );
  }
}

class _DobInput extends StatefulWidget {
  @override
  __DobInputState createState() => __DobInputState();
}

class __DobInputState extends State<_DobInput> {
  var _dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: _registerBloc.dob$,
      builder: (context, snapshot) {
        return TextFormField(
          controller: _dobController,
          onChanged: _registerBloc.onDobChanged,
          readOnly: true,
          decoration: InputDecoration(
            labelText: R.strings.dob,
            border: OutlineInputBorder(),
            errorText: snapshot.data != null && !snapshot.data
                ? 'Required field'
                : null,
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          ),
          onTap: () => _selectDate(context),
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();

    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dobController.text = selectedDate.toString();
      });
    }
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _registerBloc.email$,
      builder: (context, snapshot) => TextFormField(
        onChanged: _registerBloc.onEmailChanged,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            errorText: snapshot.data != null && !snapshot.data
                ? 'Enter invalid email address'
                : null),
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _registerBloc.password$,
      builder: (context, snapshot) => TextFormField(
        onChanged: _registerBloc.onPasswordChanged,
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            errorText: snapshot.data != null && !snapshot.data
                ? 'Invalid password, please enter more than 4 characters'
                : null),
      ),
    );
  }
}
