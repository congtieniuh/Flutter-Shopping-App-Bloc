
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_app/feature/auth/login/repository/login_repository.dart';
import 'package:shopping_app/feature/auth/model/user_app.dart';

class FirebaseLoginRepository extends LoginRepository{
  FirebaseAuth _auth;
  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection("user");


  FirebaseLoginRepository(){
    _auth = FirebaseAuth.instance;
  }

  @override
  Future<bool> isSignedIn() async{
    return  _auth.currentUser != null;
  }

  @override
  Future<bool> signIn(String email, String password) async {
    try {
      print('$email - $password');
      var result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user != null;
    } on Exception catch(e) {
      print(e);
      return false;
    }
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

  Future<bool> register(UserData userData) async {

    var result = await _auth.createUserWithEmailAndPassword(
        email: userData.email, password: userData.password);
    userData.uid = result.user.uid;
    await updateUserData(userData);
    return result.user != null;
  }

}