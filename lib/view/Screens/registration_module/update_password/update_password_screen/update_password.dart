import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getxpractice/utils/app_strings.dart';
import 'package:getxpractice/utils/constant.dart';
import 'package:getxpractice/utils/validations/update_password_validation/update_password_validation.dart';


import '../../../../../Modular/auth/Controllers.dart/AuthController/AuthController.dart';
import '../../../../../Resuable_widgets/appbar.dart/custom_appbar.dart';
import '../../../../../Resuable_widgets/custom_app_button.dart';
import '../../../../../Resuable_widgets/custom_text_widget.dart';
import '../../../../../Resuable_widgets/custom_textfield_container.dart';
import '../../../../../utils/app_assets_path.dart';
import '../../../../../utils/app_color.dart';
import '../update_pass_screen_controller.dart/update_pass_controller.dart';

class UpdatePassword extends StatefulWidget {
  UpdatePassword({Key? key}) : super(key: key);

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  final newpassword = TextEditingController();

  final oldpassword = TextEditingController();

  final confpassword = TextEditingController();
  bool isdelay = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColor.BGAPPCOLOR,
        appBar: CustomAppBar(
          LeadingIconImage: AssetPaths.BACK_ICON,
          onTap: () {
            Get.back();
          },
          headingtitle: AppStrings.UPDATE_PASSWORD,
        ),
        body: GetBuilder<AuthController>(
          builder: (controller) => Padding(
            padding: EdgeInsets.all(kDefaultPadding),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  centerpart(),
                  SizedBox(
                    height: 0.3.sh,
                  ),
                  _changepasswordbtn(context)
                ],
              ),
            ),
          ),
        ));
  }

  Widget centerpart() {
    return GetBuilder<updatepasscontroller>(
        builder: (controller) => Container(
              margin: EdgeInsets.only(top: 10.h),
              height: 0.35.sh,
              //color: Colors.grey,
              child: Stack(
                children: [
                  Positioned(
                      top: 20.h,
                      right: 2.w,
                      left: 2.w,
                      child: TextFieldContainer(
                        controller: oldpassword,
                        SuffixPathStatus: false,
                        issufixImageEnable: true,
                        suffixiconscalesize: 3.sp,
                        obsecureText: controller.isshow,
                        suffixiconWidget: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            controller.isshow
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColor.DARK_BROWN_COLOR,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            controller.isSelected();
                          },
                        ),
                      )),
                  Positioned(
                    top: 10.h,
                    left: 10.h,
                    child: CustomTextWidget(
                      fontSize: 1.2.sp,
                      fontWeight: FontWeight.bold,
                      text: AppStrings.ENTER_OLD_PASSWORD_TEXT,
                      textColor: AppColor.BLACK_COLOR,
                    ),
                  ),
                  Positioned(
                      top: 90.h,
                      right: 2.w,
                      left: 2.w,
                      child: TextFieldContainer(
                        controller: newpassword,
                        SuffixPathStatus: false,
                        issufixImageEnable: true,
                        suffixiconscalesize: 3.sp,
                        obsecureText: controller.isshow2,
                        suffixiconWidget: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            controller.isshow2
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColor.DARK_BROWN_COLOR,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            controller.isSelected2();
                          },
                        ),
                      )),
                  Positioned(
                    top: 80.h,
                    left: 10.h,
                    child: CustomTextWidget(
                      fontSize: 1.2.sp,
                      fontWeight: FontWeight.bold,
                      text: AppStrings.ENTER_NEW_PASSWORD_TEXT,
                      textColor: AppColor.BLACK_COLOR,
                    ),
                  ),
                  Positioned(
                      top: 160.h,
                      right: 2.w,
                      left: 2.w,
                      child: TextFieldContainer(
                        controller: confpassword,
                        SuffixPathStatus: false,
                        issufixImageEnable: true,
                        suffixiconscalesize: 3.sp,
                        obsecureText: controller.isshow3,
                        suffixiconWidget: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            controller.isshow3
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColor.DARK_BROWN_COLOR,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            controller.isSelected3();
                          },
                        ),
                      )),
                  Positioned(
                    top: 150.h,
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

  Widget _changepasswordbtn(context) {
    return GetBuilder<AuthController>(
        builder: (controller) => CustomAppBtn(
            onclickPressed: isdelay == true
                ? () async {
                    setState(() {
                      isdelay = false;
                    });
                    Timer(Duration(seconds: 3), () {
                      setState(() {
                        isdelay = true;
                      });
                    });

                    bool val = UpdatePasswordValidation.updatePasswordVaidation(
                        oldpassword: oldpassword,
                        newpassword: newpassword,
                        confirmpassword: confpassword,
                        context: context);
                    if (val) {
                      await AuthController()
                          .updatePassword(oldpassword.text, newpassword.text);
                    }

                    print(
                        "###################UpdatePasswordBtn############################");
                  }
                : null,
            title: AppStrings.UPDATE_PASSWORD));
  }
}
