import 'package:get/get.dart';

import '../../../../../Resuable_widgets/custom_snackbar.dart';

class AgreementController extends GetxController {
  bool _isSelected = false;

  bool _isSelected2 = false;

  bool get isSelected => _isSelected;
  bool get isSelected2 => _isSelected2;

  void isflushbarshow(context) {
    if (isSelected == false) {
     customSnackBar(
       "Please Check Terms And Condtions",
        'Try Again',
      );
      return;
    } else if (isSelected2 == false) {
    customSnackBar(
        "Please Check Privacy",
         'Try Again',
      );
      return;
    }
    if (isSelected == true && isSelected2 == true) {}
  }

  void setisSelected(bool val) {
    _isSelected = val;
    update();
  }

  void setisSelected2(bool val) {
    _isSelected2 = val;
    update();
  }
}
