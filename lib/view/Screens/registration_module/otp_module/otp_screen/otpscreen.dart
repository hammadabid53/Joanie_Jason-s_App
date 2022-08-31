import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getxpractice/utils/constant.dart';
import 'package:getxpractice/utils/validations/otp_validation/otp_validation.dart';

import '../../../../../Modular/auth/Controllers.dart/AuthController/AuthController.dart';
import '../../../../../Resuable_widgets/custom_app_button.dart';
import '../../../../../Resuable_widgets/custom_app_logo.dart';
import '../../../../../Resuable_widgets/custom_background_image.dart';
import '../../../../../Resuable_widgets/custom_bottom_container.dart';
import '../../../../../Resuable_widgets/custom_text_widget.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/app_strings.dart';
import '../otp_controller/otp_controller.dart';
import '../otp_widget/otp_widget.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  void initState() {
    OtpController.o.startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
        child: SafeArea(
            child: GetBuilder<OtpController>(
                builder: (controller) => Padding(
                    padding: EdgeInsets.only(
                        left: kDefaultPadding, right: kDefaultPadding),
                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _customapplogo(),
                            _screenname(),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: OtpFieldWidget(),
                            ),
                            _OtpVerificationBtn(),
                            SizedBox(
                              height: 20.h,
                            ),
                            _Didnotrecievecode(),
                          ]),
                    )))));
  }

  Widget _Didnotrecievecode() {
    return Column(children: [
      CustomTextWidget(
        fontSize: 2.5.sp,
        text: "00:${OtpController.o.start}",
        textColor: AppColor.DARK_BROWN_COLOR,
      ),
      SizedBox(
        height: 20.h,
      ),
      CustomBottom(
          title1: AppStrings.DIDNT_RECIEVE_CODE,
          title2: AppStrings.RESEND_TEXT,
          onclickTap: (() {
            if (OtpController.o.start == 0) {
              OtpController.o.start = 30;
              OtpController.o.startTimer();
              AuthController.i.resendotp();
            }
          })),
    ]);
  }

  Widget _customapplogo() {
    return CustomAppLogo(
      height: 0.20.sh,
      width: 0.35.sw,
    );
  }

  Widget _screenname() {
    return  CustomTextWidget(
      fontWeight: FontWeight.bold,
      text: AppStrings.OTP_TEXT,
      textColor: AppColor.BLACK_COLOR,
    );
  }

  Widget _OtpVerificationBtn() {
    return GetBuilder<OtpController>(
        builder: (controller) => CustomAppBtn(
            onclickPressed: () {
              // FocusScopeNode currentFocus = FocusScope.of(context);

              // if (!currentFocus.hasPrimaryFocus) {
              //   currentFocus.unfocus();
              // }
              bool val = Otpvalidation.OtpVaidation();

              print("ye otp current text h${OtpController.o.currentText}");
              if (val) {
                AuthController.i.verifyotp(OtpController.o.currentText);
              }
            },
            title: AppStrings.CONTINUE_TEXT));
  }
}
