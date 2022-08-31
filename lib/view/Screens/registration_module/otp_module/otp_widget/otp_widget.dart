import 'package:flutter/material.dart';
import 'package:getxpractice/view/Screens/registration_module/otp_module/otp_controller/otp_controller.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../utils/app_color.dart';

class OtpFieldWidget extends StatelessWidget {
  OtpFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      pastedTextStyle: const TextStyle(
        color: AppColor.WHITE_COLOR,
        fontWeight: FontWeight.bold,
      ),
      length: 6,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        fieldHeight: 50,
        fieldWidth: 50,
        activeFillColor: AppColor.WHITE_COLOR,
        inactiveFillColor: AppColor.WHITE_COLOR,
        selectedFillColor: AppColor.WHITE_COLOR,
        activeColor: AppColor.WHITE_COLOR,
        inactiveColor: AppColor.WHITE_COLOR,
        selectedColor: AppColor.WHITE_COLOR,
      ),
      enableActiveFill: true,
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      boxShadows: [
        BoxShadow(
            blurRadius: 5,
            spreadRadius: 3,
            offset: const Offset(0, 2),
            color: AppColor.GREY_COLOR.withOpacity(0.2))
      ],
      onChanged: (value) {
        debugPrint(value);

        OtpController.o.currentText = value;

        print("currentText Value : ${OtpController.o.currentText}");
      },
    );
  }
}
