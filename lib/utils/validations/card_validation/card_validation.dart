import 'package:flutter/material.dart';
import 'package:getxpractice/view/Screens/core_module/payment_screens/card_details.dart';

import '../../../Resuable_widgets/custom_snackbar.dart';

class Cardvalidation {
  static bool CardVaidation({
    required TextEditingController cardNumber,
    required TextEditingController expMonth,
    required TextEditingController expYear,
    required TextEditingController Cvv,
  }) {
    bool cardstatus = false;

    if (cardNumber.text.trim().isEmpty) {
      customSnackBar("card is Empty", 'Try Again');
    } else if (cardNumber.text.length < 14) {
      customSnackBar(
        "card  Length should be 14 ",
        'Try Again',
      );
    } else if (expMonth.text.trim().isEmpty) {
      customSnackBar(
        "expMonth is Empty",
        'Try Again',
      );
    } else if (expMonth.text.length < 2) {
      customSnackBar(
        "expMonth Length should be 2",
        'Try Again',
      );
    } else if (expYear.text.trim().isEmpty) {
      customSnackBar(
        "expYear is Empty",
        'Try Again',
      );
    } else if (expYear.text.length < 4) {
      customSnackBar(
        "expYear must be 4 Digit",
        'Try Again',
      );
    } else if (cvv.text.trim().isEmpty) {
      customSnackBar(
        "CVV is Empty",
        'Try Again',
      );
    } else if (cvv.text.length < 3) {
      customSnackBar(
        "CVV length should be atleast 3 but Not more than 4",
        'Try Again',
      );
    } else {
      cardstatus = true;
    }
    return cardstatus;
  }
}
