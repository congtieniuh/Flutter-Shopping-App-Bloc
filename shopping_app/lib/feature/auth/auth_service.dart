import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'model/user_app.dart';

class AuthService {
  FirebaseAuth _auth;
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("user");

  AuthService() {
    _auth = FirebaseAuth.instance;
  }

  Future<bool> register(UserData userData) async {
    var result = await _auth.createUserWithEmailAndPassword(
        email: userData.email, password: userData.password);
    userData.uid = result.user.uid;
    await updateUserData(userData);
    return result.user != null;
  }

  Future<bool> signIn(String email, String password) async {
    try {
      var result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user != null;
    } catch (e) {
      return null;
    }
  }

  Future<bool> isSignedIn() async{
    return  _auth.currentUser != null;
  }

  Future<void> updateUserData(UserData userData) async {
    return await userCollection.doc(userData.uid).set({
      'username': userData.username,
      'email': userData.email,
      'dob': userData.dob,
      'firstname': userData.firstname,
      'lastname': userData.lastname,
    });
  }
}
