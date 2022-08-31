import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../Resuable_widgets/custom_snackbar.dart';

class UpdatePasswordValidation {
  static Pattern passwordpattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  static RegExp passregExp = RegExp(passwordpattern.toString());

  static bool updatePasswordVaidation(
      {required TextEditingController oldpassword,
      required TextEditingController newpassword,
      required TextEditingController confirmpassword,
      BuildContext? context}) {
    bool updatestatus = false;
    if (oldpassword.text.trim().isEmpty) {
      customSnackBar(
        "Old Password is Empty",
        'Try Again',
      );
    } else if (!passregExp.hasMatch(oldpassword.text.trim())) {
      customSnackBar(
        "Old password must be 8 characters long and contains at least 1 uppercase, 1 lower case,1 digit & 1 special character",
        'Try Again',
      );
    } else if (newpassword.text.trim().isEmpty) {
      customSnackBar(
        "New Password is Empty",
        'Try Again',
      );
    } else if (!passregExp.hasMatch(newpassword.text.trim())) {
      customSnackBar(
        "New password must be 8 characters long and contains at least 1 uppercase, 1 lower case,1 digit & 1 special character",
        'Try Again',
      );
    } else if (confirmpassword.text.trim().isEmpty) {
      customSnackBar(
        "Confirm Password is Empty",
        'Try Again',
      );
    } else if (newpassword.text != confirmpassword.text) {
      customSnackBar(
        "password  not matched",
        'Try Again',
      );
    } else {
      updatestatus = true;
    }
    return updatestatus;
  }
}
