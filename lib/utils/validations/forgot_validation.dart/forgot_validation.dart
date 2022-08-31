import 'package:flutter/material.dart';

import '../../../Resuable_widgets/custom_snackbar.dart';

class Forgotvalidation {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static RegExp regExp = RegExp(pattern.toString());

  static bool ForgotVaidation(
      {required TextEditingController emailAdress,
      required BuildContext context}) {
    bool forgotstatus = false;
    if (emailAdress.text.trim().isEmpty) {
      customSnackBar(
        "Email is Empty",
        'Try Again',
      );
    } else if (!regExp.hasMatch(emailAdress.text.trim())) {
      customSnackBar(
        "Email is invlaid",
        'Try Again',
      );
    } else {
      forgotstatus = true;
    }
    return forgotstatus;
  }
}
