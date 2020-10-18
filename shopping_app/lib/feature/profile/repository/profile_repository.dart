
import 'package:shopping_app/feature/auth/model/user_app.dart';

abstract class ProfileRepository {
  Future<void> logout();

  Future<UserData> getUserInfo();
}