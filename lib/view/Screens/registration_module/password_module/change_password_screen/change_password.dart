import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:getxpractice/Resuable_widgets/custom_text_widget.dart';
import 'package:getxpractice/utils/app_assets_path.dart';
import 'package:getxpractice/utils/app_color.dart';
import 'package:getxpractice/utils/app_route_name.dart';
import 'package:getxpractice/utils/app_strings.dart';
import 'package:getxpractice/utils/constant.dart';
import 'package:getxpractice/utils/validations/change_password_validation/change_password_validation.dart';
import 'package:getxpractice/view/Screens/registration_module/password_module/password_controller/change_password_controller.dart';

import '../../../../../Modular/auth/Controllers.dart/AuthController/AuthController.dart';
import '../../../../../Resuable_widgets/appbar.dart/custom_appbar.dart';
import '../../../../../Resuable_widgets/custom_app_button.dart';
import '../../../../../Resuable_widgets/custom_textfield_container.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  void initState() {
    super.initState();
  }

  final newpassword = TextEditingController();
  final confirmpassword = TextEditingController();
  bool _onPressed = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.BGAPPCOLOR,
      appBar: CustomAppBar(
        LeadingIconImage: AssetPaths.BACK_ICON,
        onTap: () {
          Get.toNamed(AppRouteName.FORGOT_PASSWORD_SCREEN_ROUTE);
        },
        headingtitle: AppStrings.CHANGE_PASSWORD,
      ),
      body: Padding(
        padding: EdgeInsets.all(kDefaultPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              centerpart(),
              SizedBox(
                height: 0.3.sh,
              ),
              _changepasswordbtn()
            ],
          ),
        ),
      ),
    );
  }

  Widget centerpart() {
    return GetBuilder<changepasswordcontroller>(
        builder: (controller) => Container(
              margin: EdgeInsets.only(top: 50.h),
              height: 0.30.sh,
              //color: Colors.grey,
              child: Stack(
                children: [
                  Positioned(
                      top: 20.h,
                      right: 2.w,
                      left: 2.w,
                      child: TextFieldContainer(
                        controller: newpassword,
                        SuffixPathStatus: false,
                        issufixImageEnable: true,
                        suffixiconscalesize: 3.sp,
                        obsecureText: controller.ishidden,
                        suffixiconWidget: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            controller.ishidden
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColor.DARK_BROWN_COLOR,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            controller.setisSelected();
                          },
                        ),
                      )),
                  Positioned(
                    top: 10.h,
                    left: 10.h,
                    child: CustomTextWidget(
                      fontSize: 1.2.sp,
                      fontWeight: FontWeight.bold,
                      text: AppStrings.ENTER_NEW_PASSWORD_TEXT,
                      textColor: AppColor.BLACK_COLOR,
                    ),
                  ),
                  Positioned(
                      top: 90.h,
                      right: 2.w,
                      left: 2.w,
                      child: TextFieldContainer(
                        controller: confirmpassword,
                        obsecureText: controller.ishidden2,
                        SuffixPathStatus: false,
                        issufixImageEnable: true,
                        suffixiconscalesize: 3.sp,
                        suffixiconWidget: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            controller.ishidden2
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColor.DARK_BROWN_COLOR,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            controller.setisSelected2();
                          },
                        ),
                      )),
                  Positioned(
                    top: 80.h,
                    left: 10.h,
                    child: CustomTextWidget(
                      fontSize: 1.2.sp,
                      fontWeight: FontWeight.bold,
                      text: AppStrings.CONFIRM_PASSWORD_TEXT,
                      textColor: AppColor.BLACK_COLOR,
                    ),
                  ),
                ],
              ),
            ));
  }

  Widget _changepasswordbtn() {
    return GetBuilder<AuthController>(
        builder: (controller) => CustomAppBtn(
              title: AppStrings.CHANGE_PASSWORD,
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
                      ChangePasswordValidation().ChangePasswordVaidation(
                          newpassword: newpassword,
                          confirmpassword: confirmpassword,
                          context: context);
                    }
                  : null,
            ));
  }
}
