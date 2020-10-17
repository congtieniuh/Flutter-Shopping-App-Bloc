import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_app/feature/profile/repository/profile_repository.dart';

class ProfileRepositoryFirebase extends ProfileRepository {
  FirebaseAuth _auth;

  ProfileRepositoryFirebase() {
    _auth = FirebaseAuth.instance;
  }

  @override
  Future<void> logout() {
    return _auth.signOut();
  }
 }
