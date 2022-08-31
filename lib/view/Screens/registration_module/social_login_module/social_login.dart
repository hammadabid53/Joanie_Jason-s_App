import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:getxpractice/utils/app_route_name.dart';
import 'package:getxpractice/view/Screens/registration_module/agreement_module/agreement.dart';
import 'package:getxpractice/view/Screens/registration_module/social_login_module/social_login_controller/social_login_controller.dart';

import '../../../../Resuable_widgets/custom_app_logo.dart';
import '../../../../Resuable_widgets/custom_background_image.dart';
import '../../../../Resuable_widgets/custom_bottom_container.dart';
import '../../../../Resuable_widgets/custom_social_container.dart';
import '../../../../utils/app_assets_path.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_strings.dart';

class SocialLogin extends StatefulWidget {
  const SocialLogin({Key? key}) : super(key: key);

  @override
  State<SocialLogin> createState() => _SocialLoginState();
}

class _SocialLoginState extends State<SocialLogin> {
  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _customapplogo(),
        _signinwithemail(context),
        _signinwithfacebook(),
        _signinwithgoogle(),
        if (Platform.isIOS) _signinwithapple(),
        _SocialLoginText(),
      ],
    ));
  }

  Widget _signinwithemail(context) {
    return SocialContainer(
      onclicktap: (() {
        showMyDialog(context);

        // showDialog(
        //     context: context,
        //     builder: (context) {
        //       return
        //     });
      }),
      iconimage: AssetPaths.IC_EMAIL,
      textname: AppStrings.SIGN_IN_WITH_EMAIL,
      color: AppColor.SECONDARY_COLOR,
      textcolor: AppColor.WHITE_COLOR,
      iconcolor: AppColor.WHITE_COLOR,
    );
  }

  Widget _customapplogo() {
    return CustomAppLogo(
      height: 0.15.sh,
      width: 0.50.sw,
    );
  }

  Widget _signinwithapple() {
    return SocialContainer(
      onclicktap: (() {}),
      iconimage: AssetPaths.IC_APPLE,
      textname: AppStrings.LOGIN_APPLE_TEXT,
      color: AppColor.WHITE_COLOR,
      textcolor: AppColor.BLACK_COLOR,
      iconcolor: AppColor.BLACK_COLOR,
    );
  }

  Widget _signinwithgoogle() {
    return GetBuilder<SocialLoginController>(
        builder: (controller) => SocialContainer(
              onclicktap: () {
                SocialLoginController.s.googleSignUp();

                print("signinwithgoogle function called");
              },
              iconimage: AssetPaths.IC_GOOGLE,
              textname: AppStrings.LOGIN_GOOGLE_TEXT,
              color: AppColor.GOOGLE_BUTTON_COLOR,
              textcolor: AppColor.WHITE_COLOR,
              iconcolor: AppColor.WHITE_COLOR,
            ));
  }

  Widget _signinwithfacebook() {
    return SocialContainer(
      onclicktap: (() {}),
      iconimage: AssetPaths.IC_FACEBOOK,
      textname: AppStrings.LOGIN_FACEBOOK_TEXT,
      color: AppColor.FACEBOOK_COLOR,
      textcolor: AppColor.WHITE_COLOR,
      iconcolor: AppColor.WHITE_COLOR,
    );
  }

  Widget _SocialLoginText() {
    return Container(
        // color: Colors.red,
        padding: EdgeInsets.only(top: 0.05.sh),
        // margin: EdgeInsets.only(top: 10.0.h),
        child: CustomBottom(
          title2: AppStrings.SIGNUP_TEXT,
          title1: AppStrings.DONT_HAVE_AN_ACCOUNT,
          onclickTap: (() {
            Get.offAndToNamed(AppRouteName.SIGNUP_SCREEN_ROUTE);
          }),
        ));
  }
}
