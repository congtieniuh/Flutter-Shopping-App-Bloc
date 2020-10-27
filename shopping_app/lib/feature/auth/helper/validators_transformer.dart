import 'dart:async';

mixin ValidatorsTransformer {

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  static bool isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    return password.length > 4;
  }

  final validateEmail =
      StreamTransformer<String, bool>.fromHandlers(handleData: (email, sink) {
    if (isValidEmail(email)) {
      sink.add(true);
    } else {
      sink.add(false);
     }
  });

  final validateRequireField =
  StreamTransformer<String, bool>.fromHandlers(handleData: (email, sink) {
    if (email.isNotEmpty) {
      sink.add(true);
    } else {
      sink.add(false);
    }
  });


  final validatePassword = StreamTransformer<String, bool>.fromHandlers(
      handleData: (password, sink) {
        if (isValidPassword(password)) {
          sink.add(true);
        } else {
          sink.add(false);
        }
      });
}
