import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getxpractice/Resuable_widgets/custom_text_widget.dart';
import 'package:getxpractice/utils/app_route_name.dart';

import 'package:getxpractice/utils/app_strings.dart';
import 'package:getxpractice/utils/constant.dart';

import '../../../../Modular/auth/Controllers.dart/AuthController/AuthController.dart';
import '../../../../Resuable_widgets/appbar.dart/custom_appbar.dart';
import '../../../../Resuable_widgets/custom_app_button.dart';
import '../../../../utils/app_assets_path.dart';
import '../../../../utils/app_color.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onTap: () {
          Get.toNamed(AppRouteName.HOME_PAGES_ROUTE);
        },
        LeadingIconImage: AssetPaths.BACK_ICON,
        headingtitle: AppStrings.SETTINGS_TEXT,
      ),
      body: Padding(
        padding: EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            _pushnotification(),
            if (updatepassword == true) _changepasswordbtn(),
            _termsandconditionbtn(),
            _privacypolicybtn()
          ],
        ),
      ),
    );
  }

  Widget _pushnotification() {
    return Container(
      height: 40.h,
      padding: EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
      decoration: BoxDecoration(
          color: AppColor.PRIMARY_COLOR,
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextWidget(
            text: AppStrings.RECIEVE_PUSH_NOTIFICATION_TEXT,
            textColor: AppColor.BLACK_COLOR,
            fontWeight: FontWeight.bold,
            fontSize: 1.2.sp,
          ),
          Image.asset(scale: 3.sp, AssetPaths.SWITCH_ICON)
        ],
      ),
    );
  }

  Widget _changepasswordbtn() {
    return CustomAppBtn(
        onclickPressed: () {
          Get.toNamed(AppRouteName.UPDATE_PASSWORD_ROUTE);
        },
        title: AppStrings.CHANGE_PASSWORD);
  }

  Widget _termsandconditionbtn() {
    return CustomAppBtn(
        onclickPressed: () {
          Get.toNamed(AppRouteName.TERMS_AND_CONDTION_ROUTE);
        },
        title: AppStrings.TERMS_CONDITIONS_TEXT);
  }

  Widget _privacypolicybtn() {
    return CustomAppBtn(
        onclickPressed: () {
          Get.toNamed(AppRouteName.PRIVACY_POLICY_ROUTE);
        },
        title: AppStrings.PRIVACY_POLICY_TEXT);
  }
}
