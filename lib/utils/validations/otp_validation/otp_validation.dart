import '../../../Resuable_widgets/custom_snackbar.dart';
import '../../../view/Screens/registration_module/otp_module/otp_controller/otp_controller.dart';

class Otpvalidation {
  static bool OtpVaidation() {
    bool otpstatus = false;
    if (OtpController.o.currentText == null) {
      customSnackBar("otp code can't be Empty", "try again");
    } else if (OtpController.o.currentText != "123456") {
      customSnackBar("sorry Verification code did not matched", "try again");
    } else {
      otpstatus = true;
    }
    return otpstatus;
  }
}
