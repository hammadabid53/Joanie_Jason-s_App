import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:getxpractice/utils/app_assets_path.dart';
import 'package:getxpractice/utils/app_route_name.dart';

import '../../../../Resuable_widgets/custom_app_button.dart';
import '../../../../Resuable_widgets/custom_app_logo.dart';
import '../../../../Resuable_widgets/custom_background_image.dart';
import '../../../../utils/app_strings.dart';


class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 
    return BackgroundImage(
        child: SafeArea(
            child: Padding(
                padding: EdgeInsets.only(bottom: 20.h, left: 20.w, right: 30.w),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _customapplogo(),
                      _successlogo(),
                      _SuccessBtn(),
                    ]))));
  }

  Widget _customapplogo() {
    return CustomAppLogo(
      height: 0.40.sw,
      width: 0.40.sw,
    );
  }

  Widget _successlogo() {
    return Container(
        margin: const EdgeInsets.only(top: 50, bottom: 50),
        // height: 0.50.sw,
        // width: 0.50.sw,
        child: Image.asset(scale: 4.sp, AssetPaths.TICK_IMAGE));
  }

  Widget _SuccessBtn() {
    return CustomAppBtn(
        onclickPressed: () {
          Get.toNamed(AppRouteName.CHOOSE_STORE_ROUTE);
        },
        title: AppStrings.CONTINUE_TEXT);
  }

  
}
