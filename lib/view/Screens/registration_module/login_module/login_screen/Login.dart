import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getxpractice/utils/app_assets_path.dart';
import 'package:getxpractice/utils/app_color.dart';
import 'package:getxpractice/utils/app_route_name.dart';
import 'package:getxpractice/utils/constant.dart';
import 'package:getxpractice/utils/validations/login_validation/login_validation.dart';

import '../../../../../Modular/auth/Controllers.dart/AuthController/AuthController.dart';
import '../../../../../Resuable_widgets/custom_app_button.dart';
import '../../../../../Resuable_widgets/custom_app_logo.dart';
import '../../../../../Resuable_widgets/custom_background_image.dart';
import '../../../../../Resuable_widgets/custom_bottom_container.dart';
import '../../../../../Resuable_widgets/custom_text_widget.dart';
import '../../../../../Resuable_widgets/custom_textfield_container.dart';
import '../../../../../utils/app_assets_path.dart';
import '../../../../../utils/app_strings.dart';
import '../login_controller/login_screen_controller.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailIn = TextEditingController();

  final passIn = TextEditingController();

  final FocusNode fEmail = FocusNode();

  final FocusNode fPass = FocusNode();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool onPressedValue = true;
  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
        child: SafeArea(
            child: GetBuilder<AuthController>(
      builder: (controller) => Padding(
        padding: EdgeInsets.all(
          kDefaultPadding,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  // color: Colors.blue,
                  height: 0.80.sh,
                  child: Column(children: [
                    Expanded(
                      flex: 1,
                      child: _customapplogo(),
                    ),
                    Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            _screenname(),
                            _emailfield(),
                            _passwordfield(),
                            _loginbtn(),
                            _forgetpassword(),
                            SizedBox(
                              height: 10.h,
                            ),
                            _donthaveanaccount(),
                          ],
                        )),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    )));
  }

  Widget _loginbtn() {
    return GetBuilder<AuthController>(
        builder: (controller) => CustomAppBtn(
            onclickPressed: onPressedValue == true
                ? () async {
                    setState(() {
                      onPressedValue = false;
                    });
                    Timer(Duration(seconds: 3), () {
                      setState(() {
                        onPressedValue = true;
                      });
                    });

                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    bool val = Loginvalidation.LoginVaidation(
                      emailAdress: emailIn,
                      password: passIn,
                    );

                    if (val) {
                      await AuthController().login(
                        emailIn.text,
                        passIn.text,
                      );
                    }
                  }
                : null,
            title: AppStrings.LOGIN_TEXT));
  }

  Widget _passwordfield() {
    return GetBuilder<loginscreencontroller>(
        builder: (controller) => TextFieldContainer(
            isPrefixImageEnable: true,
            preiconscalesize: 3.sp,
            isprefiximage: AssetPaths.PASSWORD,
            prefixIconColor: AppColor.SECONDARY_COLOR,
            hinttext: AppStrings.PASSWORD_HINT_TEXT,
            obsecureText: controller.ishidee,
            controller: passIn,
            focusNode: fPass,
            issufixImageEnable: true,
            suffixiconscalesize: 3.sp,
            suffixiconWidget: IconButton(
              icon: Icon(
                // Based on passwordVisible state choose the icon
                controller.ishidee ? Icons.visibility_off : Icons.visibility,
                color: AppColor.DARK_BROWN_COLOR,
              ),
              onPressed: () {
                // Update the state i.e. toogle the state of passwordVisible variable
                controller.isSelected();
              },
            ),
            SuffixPathStatus: false));
  }

  Widget _emailfield() {
    return TextFieldContainer(
      preiconscalesize: 3.sp,
      isPrefixImageEnable: true,
      isprefiximage: AssetPaths.EMAIL,
      prefixIconColor: AppColor.SECONDARY_COLOR,
      hinttext: AppStrings.EMAIL_ADDRESS_HINT_TEXT,
      obsecureText: false,
      controller: emailIn,
      focusNode: fEmail,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }

  Widget _screenname() {
    return  CustomTextWidget(
      fontWeight: FontWeight.bold,
      text: AppStrings.LOGIN_TEXT,
      textColor: AppColor.BLACK_COLOR,
    );
  }

  Widget _customapplogo() {
    return CustomAppLogo(
      height: 0.15.sh,
      width: 0.50.sw,
    );
  }

  Widget _donthaveanaccount() {
    return Container(
        // padding: EdgeInsets.only(top: 0..sh),
        child: CustomBottom(
      title1: AppStrings.DONT_HAVE_AN_ACCOUNT,
      title2: AppStrings.SIGNUP_TEXT,
      onclickTap: (() {
        Get.toNamed(AppRouteName.SIGNUP_SCREEN_ROUTE);
      }),
    ));
  }

  Widget _forgetpassword() {
    return Padding(
      padding: EdgeInsets.only(top: 10.0.h, bottom: 50.0.h),
      child: Align(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            Get.toNamed(AppRouteName.FORGOT_PASSWORD_SCREEN_ROUTE);
          },
          child: CustomTextWidget(
            textColor: AppColor.SECONDARY_COLOR,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w500,
            text: AppStrings.FORGOT_PASSWORD,
            textDecoration: TextDecoration.underline,
            fontSize: 1.5.sp,
          ),
        ),
      ),
    );
  }
}
