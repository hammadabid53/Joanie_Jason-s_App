import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snackbar_controller.dart';

import '../../../Resuable_widgets/custom_snackbar.dart';

class Loginvalidation {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static Pattern passwordpattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  static RegExp regExp = RegExp(pattern.toString());
  static RegExp passregExp = RegExp(passwordpattern.toString());
  static bool LoginVaidation({
    required TextEditingController emailAdress,
    required TextEditingController password,
  }) {
    bool loginstatus = false;
    bool isbuttonactive = false;
    if (emailAdress.text.trim().isEmpty) {
      customSnackBar("Email is Empty", 'Try Again');
    } else if (!regExp.hasMatch(emailAdress.text.trim())) {
      customSnackBar(
        "Email is invlaid",
        'Try Again',
      );
    } else if (password.text.trim().isEmpty) {
      customSnackBar(
        "Password is Empty",
        'Try Again',
      );
    } else if (!passregExp.hasMatch(password.text.trim())) {
      customSnackBar(
        "password must be 8 characters long and contains at least 1 uppercase, 1 lower case,1 digit & 1 special character",
        'Try Again',
      );
    } else if (password.text.length < 3) {
      customSnackBar(
        "Password must be 3 characters",
        'Try Again',
      );
    } else {
      loginstatus = true;
    }
    return loginstatus;
  }
}
