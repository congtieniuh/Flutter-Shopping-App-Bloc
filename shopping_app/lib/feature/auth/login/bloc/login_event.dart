part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {

  @override
  List<Object> get props => [];
}

class EmailChanged extends LoginEvent {
  final String email;

  EmailChanged({@required this.email});

  @override
  String toString() => 'EmailChanged { email :$email }';
}


class PasswordChanged extends LoginEvent {
  final String password;

  PasswordChanged({@required this.password});

  @override
  String toString() => 'EmailChanged { email :$password }';
}


class Submitted extends LoginEvent {

  Submitted();

}
