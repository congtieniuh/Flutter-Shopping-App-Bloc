class UserData {
  String uid;
  String username;
  String email;
  String password;
  String dob;
  String lastname;
  String firstname;

  UserData(
      {this.uid,
      this.username,
      this.email,
      this.password,
      this.dob,
      this.lastname,
      this.firstname});

  @override
  String toString() {
    return 'UserData{uid: $uid, username: $username, email: $email, dob: $dob, lastname: $lastname, firstname: $firstname}';
  }

  String get fullName {
    return "$firstname $lastname";
  }
}
class Credential {
  final String email;
  final String password;

  const Credential({this.email, this.password});

  @override
  String toString() => 'Credential{email: $email, password: $password}';
}