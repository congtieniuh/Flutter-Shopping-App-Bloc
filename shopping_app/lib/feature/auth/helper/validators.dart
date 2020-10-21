import 'dart:async';

class Validators {
  Validators._();

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  static isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static isValidPassword(String password) {
    return password.length > 4;
  }

  static final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (isValidEmail(email)) {
      sink.add(email);
    } else {
      sink.addError('Enter a valid email');
     }
  });

  static final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
        if (isValidPassword(password)) {
          sink.add(password);
        } else {
          sink.addError('Invalid password, please enter more than 4 characters');
        }
      });
}
