part of 'login_bloc.dart';

class LoginState extends Equatable {
  final bool isEmailInvalid;
  final bool isPasswordInvalid;
  final String email;
  final String password;

  bool get isFormValid => isEmailInvalid && isPasswordInvalid;

  LoginState({
     this.isEmailInvalid,
     this.isPasswordInvalid,
     this.email,
     this.password,
  });


  LoginState copyWith(
      {bool isEmailInvalid,
      bool isPasswordInvalid,
      String email,
      String password}) {
    return LoginState(
      isEmailInvalid: isEmailInvalid ?? this.isEmailInvalid,
      isPasswordInvalid: isPasswordInvalid ?? this.isPasswordInvalid,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [isEmailInvalid, isPasswordInvalid, email, password];
}


class LoginLoadingState extends LoginState {}

class LoginFinishedState extends LoginState {
  final bool isSuccess;

  LoginFinishedState({this.isSuccess});

  @override
  List<Object> get props => [isSuccess];
}
