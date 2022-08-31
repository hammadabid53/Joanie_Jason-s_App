import 'package:flutter/material.dart';

import '../../../Resuable_widgets/custom_snackbar.dart';

class Signupvalidation {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static Pattern passwordpattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

  static RegExp regExp = RegExp(pattern.toString());
  static RegExp passregExp = RegExp(passwordpattern.toString());

  static bool signupVaidation({
    required TextEditingController Signupnamefield,
    required TextEditingController SignupemailAdressfield,
    required TextEditingController Signuppasswordfield,
    required TextEditingController Signupconfirmpasswordfield,
    required TextEditingController SignupPhoneNumber,
  }) {
    bool status = false;
    if (Signupnamefield.text.trim().isEmpty) {
      customSnackBar(
        "Name is Empty",
        'Try Again',
      );
    } else if (Signupnamefield.text.length < 3 ||
        Signupnamefield.text.length > 20) {
      customSnackBar(
        "name must be atleast 3 characters",
        'Try Again',
      );
    } else if (SignupemailAdressfield.text.trim().isEmpty) {
      customSnackBar(
        "Email is Empty",
        'Try Again',
      );
    } else if (!regExp.hasMatch(SignupemailAdressfield.text.trim())) {
      customSnackBar(
        "Email is invlaid",
        'Try Again',
      );
    } else if (Signuppasswordfield.text.trim().isEmpty) {
      customSnackBar(
        "Password is Empty",
        'Try Again',
      );
    } else if (Signuppasswordfield.text.length < 5) {
      customSnackBar(
        "Password  must be 5 characters long",
        'Try Again',
      );
    } else if (!passregExp.hasMatch(Signuppasswordfield.text.trim())) {
      customSnackBar(
        "password contains at least 1 uppercase, 1 lower case,1 digit & 1 special character",
        'Try Again',
      );
    } else if (Signupconfirmpasswordfield.text.trim().isEmpty) {
      customSnackBar(
        "Confirm Password is Empty",
        'Try Again',
      );
    } else if (Signuppasswordfield.text != Signupconfirmpasswordfield.text) {
      customSnackBar(
        " Password is not matched",
        'Try Again',
      );
    } else if (SignupPhoneNumber.text.trim().isEmpty) {
      customSnackBar(
        " Phone Number must Empty",
        'Try Again',
      );
    } else if (SignupPhoneNumber.text.length == 11) {
      customSnackBar(
        " Phone Number must be 11 digit",
        'Try Again',
      );
    } else {
      status = true;
    }
    return status;
  }
}
