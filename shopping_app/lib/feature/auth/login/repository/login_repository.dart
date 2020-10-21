

import 'package:shopping_app/feature/auth/model/user_app.dart';

abstract class LoginRepository {
  Future<bool> signIn(String email, String password);
  Future<bool> isSignedIn();
  Future<void> updateUserData(UserData userData);
  Future<bool> register(UserData userData);
}