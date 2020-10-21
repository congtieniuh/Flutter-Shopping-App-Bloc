import 'package:rxdart/rxdart.dart';
import 'package:shopping_app/feature/auth/helper/validators.dart';
import 'package:shopping_app/feature/auth/login/repository/repository.dart';
import 'model/user_app.dart';

class AuthBloc {
  LoginRepository loginRepository;

  AuthBloc() {
    loginRepository = FirebaseLoginRepository();
  }

  Future<bool> register(UserData userData) async {
    return loginRepository.register(userData);
  }

  Future<bool> isSignedIn() async {
    return loginRepository.isSignedIn();
  }

  Future<void> updateUserData(UserData userData) async {
    return loginRepository.updateUserData(userData);
  }

}
