import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxpractice/Modular/auth/Controllers.dart/AuthController/AuthController.dart';

import '../../../Resuable_widgets/custom_snackbar.dart';

class ChangePasswordValidation extends GetxController {
  final authController = Get.find<AuthController>();
  static Pattern passwordpattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp passregExp = RegExp(passwordpattern.toString());

  void ChangePasswordVaidation(
      {required TextEditingController newpassword,
      required TextEditingController confirmpassword,
      required BuildContext context}) {
    if (newpassword.text.trim().isEmpty) {
      customSnackBar(
        "New Password is Empty",
        'Try Again',
      );
      return;
    } else if (!passregExp.hasMatch(newpassword.text.trim())) {
      customSnackBar(
        "New password must be 8 characters long and contains at least 1 uppercase, 1 lower case,1 digit & 1 special character",
        'Try Again',
      );
      return;
    } else if (confirmpassword.text.trim().isEmpty) {
      customSnackBar(
        "Confirm Password is Empty",
        'Try Again',
      );
      return;
    } else if (newpassword.text != confirmpassword.text) {
      customSnackBar(
        "password  not matched",
        'Try Again',
      );
      return;
    } else {
      authController.changePassword(newpassword.text);
    }
  }
}
