import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shopping_app/feature/auth/helper/validators.dart';
import 'package:shopping_app/feature/auth/login/repository/repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository _loginRepository;
  LoginBloc() :
        _loginRepository = FirebaseLoginRepository(),
        super(LoginEmptyState());

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get emailStream =>
      _emailController.stream.transform(Validators.validateEmail);

  Stream<String> get passwordStream =>
      _passwordController.stream.transform(Validators.validatePassword);

  Stream<bool> get submitValidStream =>
      Rx.combineLatest2(emailStream, passwordStream, (String a,String b) => true);

  // change data
  Function(String) get changeEmail => _emailController.sink.add;

  Function(String) get changePassword => _passwordController.sink.add;

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    } else if(event is Submitted){
      yield* _mapSubmittedLoginToState(email: event.email,password: event.password);
    }
  }

  Stream<LoginState> _mapEmailChangedToState(String email) async* {
    yield state.update(isEmailValid: Validators.isValidEmail(email));
  }

  Stream<LoginState> _mapPasswordChangedToState(String password)  async*{
    yield state.update(isPasswordValid: Validators.isValidPassword(password));
  }
  Stream<LoginState> _mapSubmittedLoginToState({
    String email,
    String password,
  }) async* {
    yield LoginLoadingState();
    try {
      await _loginRepository.signIn(email, password);
      yield LoginFinishedState(isSuccess: true);
    } on Exception catch(e){
      print(e);
      yield LoginFinishedState(isSuccess: false);
    }
  }

  @override
  Future<void> close() {
    _passwordController.close();
    _emailController.close();

    return super.close();
  }
}
