class UserData {

  String uid;
  String username;
  String email;
  String password;
  String dob;
  String lastname;
  String firstname;

  UserData( {this.uid, this.username, this.email,this.password, this.dob, this.lastname, this.firstname});

  @override
  String toString() {
    return 'UserData{uid: $uid, username: $username, email: $email, dob: $dob, lastname: $lastname, firstname: $firstname}';
  }
}