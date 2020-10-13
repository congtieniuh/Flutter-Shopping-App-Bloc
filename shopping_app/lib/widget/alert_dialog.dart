import 'package:flutter/material.dart';

showAlertDialog(
    BuildContext context, String title, String msg, Function onYesAction) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: (){
      onYesAction();
      Navigator.pop(context);
    },
  );
  // set up the button
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed: () => Navigator.pop(context),
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(msg),
    actions: [okButton, cancelButton],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
