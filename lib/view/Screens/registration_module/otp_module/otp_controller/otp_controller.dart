import 'dart:async';

import 'package:get/get.dart';
import 'package:getxpractice/Resuable_widgets/custom_snackbar.dart';
import 'package:getxpractice/view/Screens/registration_module/otp_module/otp_widget/otp_widget.dart';

class OtpController extends GetxController {
  static OtpController get o => Get.find();

 var currentText;

  late Timer _timer;
  int start = 30;
  startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (start == 0) {
        print(start);
        timer.cancel();
      } else {
        start--;
        print(start);
        update();
      }
    });
  }

}
