import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getxpractice/utils/app_assets_path.dart';
import 'package:getxpractice/utils/app_color.dart';
import 'package:getxpractice/utils/constant.dart';

import '../../../../../Modular/auth/Controllers.dart/AuthController/AuthController.dart';
import '../../../../../Resuable_widgets/custom_app_button.dart';
import '../../../../../Resuable_widgets/custom_app_logo.dart';
import '../../../../../Resuable_widgets/custom_background_image.dart';
import '../../../../../Resuable_widgets/custom_bottom_container.dart';
import '../../../../../Resuable_widgets/custom_text_widget.dart';
import '../../../../../Resuable_widgets/custom_textfield_container.dart';
import '../../../../../utils/app_assets_path.dart';
import '../../../../../utils/app_route_name.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../../utils/validations/signup_validation/signup_validation.dart';
import '../../password_module/password_controller/change_password_controller.dart';

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final nameIn = TextEditingController();

  final emailIn = TextEditingController();

  final passIn = TextEditingController();

  final cpassIn = TextEditingController();

  final phoneIn = TextEditingController();

  final FocusNode fEmail = FocusNode();

  final FocusNode fPass = FocusNode();

  final FocusNode fname = FocusNode();

  final FocusNode fcPass = FocusNode();
  bool _onbuttondelay = true;
  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
        child: GetBuilder<AuthController>(
      builder: (controller) => Padding(
        padding: EdgeInsets.only(
            left: kDefaultPadding,
            right: kDefaultPadding,
            top: kDefaultPadding),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 0.75.sh,
                //color: AppColor.DARK_GREY,
                child: Column(
                  children: [
                    _customapplogo(),
                    _screenname(),
                    _fullname(),
                    _emailfield(),
                    _passwordfield(),
                    _confirmpassword(),
                    _phonenumber(),
                    _signupbtn(context),
                  ],
                ),
              ),
              Container(

                  //   color: AppColor.BGAPPCOLOR,

                  child: _alreadyhaveanaccount()),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _fullname() {
    return TextFieldContainer(
        hinttext: AppStrings.FULLNAME_HINT_TEXT,
        obsecureText: false,
        controller: nameIn,
        focusNode: fname,
        isPrefixImageEnable: true,
        preiconscalesize: 3.sp,
        PrefixPathStatus: false,
        prefixiconWidget: Icon(
          Icons.person,
          color: AppColor.DARK_BROWN_COLOR,
        ),
        contentPadding: EdgeInsets.only(left: 20.w, top: 10.h));
  }

  Widget _emailfield() {
    return TextFieldContainer(
      isprefiximage: AssetPaths.EMAIL,
      prefixIconColor: AppColor.SECONDARY_COLOR,
      hinttext: AppStrings.EMAIL_HINT_TEXT,
      obsecureText: false,
      controller: emailIn,
      focusNode: fEmail,
      isPrefixImageEnable: true,
      PrefixPathStatus: true,
      SuffixPathStatus: false,
      preiconscalesize: 3.sp,
      contentPadding: EdgeInsets.only(left: 20.w, top: 10.h),
    );
  }

  Widget _passwordfield() {
    return GetBuilder<changepasswordcontroller>(
        builder: (controller) => TextFieldContainer(
            hinttext: AppStrings.PASSWORD_HINT_TEXT,
            obsecureText: controller.ishidden,
            controller: passIn,
            focusNode: fPass,
            isPrefixImageEnable: true,
            PrefixPathStatus: true,
            preiconscalesize: 3.sp,
            isprefiximage: AssetPaths.PASSWORD,
            contentPadding: EdgeInsets.only(left: 20.w, top: 10.h),
            issufixImageEnable: true,
            suffixiconscalesize: 3.sp,
            suffixiconWidget: IconButton(
              icon: Icon(
                // Based on passwordVisible state choose the icon
                controller.ishidden ? Icons.visibility_off : Icons.visibility,
                color: AppColor.DARK_BROWN_COLOR,
              ),
              onPressed: () {
                // Update the state i.e. toogle the state of passwordVisible variable
                controller.setisSelected();
              },
            ),
            SuffixPathStatus: false));
  }

  Widget _confirmpassword() {
    return GetBuilder<changepasswordcontroller>(
      builder: (controller) => TextFieldContainer(
          isprefiximage: AssetPaths.PASSWORD,
          hinttext: AppStrings.CONFIRM_PASSWORD_HINT_TEXT,
          obsecureText: controller.ishidden2,
          controller: cpassIn,
          focusNode: fcPass,
          isPrefixImageEnable: true,
          PrefixPathStatus: true,
          preiconscalesize: 3.sp,
          contentPadding: EdgeInsets.only(left: 20.w, top: 10.h),
          SuffixPathStatus: false,
          issufixImageEnable: true,
          suffixiconscalesize: 3.sp,
          suffixiconWidget: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
              controller.ishidden2 ? Icons.visibility_off : Icons.visibility,
              color: AppColor.DARK_BROWN_COLOR,
            ),
            onPressed: () {
              // Update the state i.e. toogle the state of passwordVisible variable
              controller.setisSelected2();
            },
          )),
    );
  }

  Widget _phonenumber() {
    return TextFieldContainer(
      keyboardType: TextInputType.phone,
      // inputFormatters: [DialCodeFormatter()],
      hinttext: AppStrings.PHONE_TEXT,
      obsecureText: false,
      controller: phoneIn,
      isPrefixImageEnable: true,
      preiconscalesize: 3.sp,
      isprefiximage: AssetPaths.PASSWORD,
      PrefixPathStatus: false,
      prefixiconWidget: Icon(
        Icons.phone,
        color: AppColor.DARK_BROWN_COLOR,
      ),
      SuffixPathStatus: false,
      suffixiconWidget: Icon(
        Icons.phone,
        color: AppColor.DARK_BROWN_COLOR,
      ),
      contentPadding: EdgeInsets.only(left: 20.w, top: 10.h),
    );
  }

  Widget _signupbtn(context) {
    return CustomAppBtn(
        onclickPressed: _onbuttondelay == true
            ? () async {
                setState(() {
                  _onbuttondelay = false;
                });
                Timer(Duration(seconds: 3), () {
                  setState(() {
                    _onbuttondelay = true;
                  });
                });

                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
                bool val = Signupvalidation.signupVaidation(
                  SignupemailAdressfield: emailIn,
                  Signupnamefield: nameIn,
                  Signuppasswordfield: passIn,
                  Signupconfirmpasswordfield: cpassIn,
                  SignupPhoneNumber: phoneIn,
                );

                if (val) {
                  await AuthController().signup(
                      nameIn.text, emailIn.text, passIn.text, phoneIn.text);
                }
              }
            : null,
        title: AppStrings.SIGNUP_TEXT);
  }

  Widget _screenname() {
    return  CustomTextWidget(
      fontWeight: FontWeight.bold,
      text: AppStrings.SIGNUP_TEXT,
      textColor: AppColor.BLACK_COLOR,
    );
  }

  Widget _customapplogo() {
    return CustomAppLogo(
      height: 0.15.sh,
      width: 1.sw,
    );
  }

  // Widget _signupbtn() {
  Widget _alreadyhaveanaccount() {
    return Container(
        // padding: EdgeInsets.only(top: 0..sh),
        child: CustomBottom(
      title1: AppStrings.ALREADY_HAVE_AN_ACCOUNT,
      title2: AppStrings.LOGIN_TEXT,
      onclickTap: (() {
        Get.offAndToNamed(AppRouteName.LOGIN_SCREEN_ROUTE);
      }),
    ));
  }
}
