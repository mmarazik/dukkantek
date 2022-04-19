import 'package:flutter/material.dart';

const int kPasswordMinLength = 6;
void showAlertDialog(
    BuildContext context, String message, String? title, String? okButtonTitle,
    [bool popOnOK = false]) {
  // set up the button
  Widget okButton = TextButton(
    child: Text(okButtonTitle ?? "OK"),
    onPressed: () {
      Navigator.of(context).pop();
      if (popOnOK) {
        Navigator.of(context).pop();
      }
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title ?? "Error"),
    content: Text(message),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
