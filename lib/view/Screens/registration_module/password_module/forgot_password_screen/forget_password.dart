import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getxpractice/utils/app_assets_path.dart';
import 'package:getxpractice/utils/validations/forgot_validation.dart/forgot_validation.dart';

import '../../../../../Modular/auth/Controllers.dart/AuthController/AuthController.dart';
import '../../../../../Resuable_widgets/custom_app_button.dart';
import '../../../../../Resuable_widgets/custom_app_logo.dart';
import '../../../../../Resuable_widgets/custom_background_image.dart';
import '../../../../../Resuable_widgets/custom_text_widget.dart';
import '../../../../../Resuable_widgets/custom_textfield_container.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/app_strings.dart';
import '../password_controller/forgot_password_controller.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool _onPressed = true;

  @override
  Widget build(BuildContext context) {
    final emailIn = TextEditingController();

    Widget _ForgotPasswordBtn() {
      return GetBuilder<AuthController>(
          builder: (controller) => CustomAppBtn(
              onclickPressed: _onPressed == true
                  ? () async {
                      setState(() {
                        _onPressed = false;
                      });
                      Timer(Duration(seconds: 3), () {
                        setState(() {
                          _onPressed = true;
                        });
                      });
                      FocusScopeNode currentFocus = FocusScope.of(context);

                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                      bool val = Forgotvalidation.ForgotVaidation(
                          emailAdress: emailIn, context: context);
                      if (val) {
                        await AuthController().forgetpassword(
                          emailIn.text,
                        );
                      }
                    }
                  : null,
              title: AppStrings.GETCODE));
    }

    Widget _emailfield() {
      return TextFieldContainer(
        isPrefixImageEnable: true,
        hinttext: AppStrings.ENTER_TEXT + AppStrings.EMAIL_ADDRESS_HINT_TEXT,
        obsecureText: false,
        controller: emailIn,
        isprefiximage: AssetPaths.EMAIL,
        preiconscalesize: 3.sp,
      );
    }

    return BackgroundImage(
      child: SafeArea(
          child: GetBuilder<AuthController>(
              builder: (controller) => Padding(
                  padding: EdgeInsets.only(
                      top: 40.0.h, bottom: 20.h, left: 20.w, right: 30.w),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: _customapplogo(),
                        ),
                        Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                _screenname(),
                                _emailfield(),
                                _ForgotPasswordBtn(),
                              ],
                            ))
                      ])))),
    );
  }

  Widget _screenname() {
    return  CustomTextWidget(
      fontWeight: FontWeight.bold,
      text: AppStrings.FORGOT_PASSWORD,
      textColor: AppColor.BLACK_COLOR,
    );
  }

  Widget _customapplogo() {
    return CustomAppLogo(
      height: 0.40.sw,
      width: 0.40.sw,
    );
  }
}
