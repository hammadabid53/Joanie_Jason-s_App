import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:getxpractice/Resuable_widgets/custom_text_widget.dart';
import 'package:getxpractice/utils/app_assets_path.dart';
import 'package:getxpractice/utils/app_color.dart';
import 'package:getxpractice/utils/app_strings.dart';
import 'package:getxpractice/utils/constant.dart';

import '../../../../Modular/auth/Controllers.dart/AuthController/AuthController.dart';
import '../../../../Resuable_widgets/appbar.dart/custom_appbar.dart';


class TermsandCondition extends StatefulWidget {
  const TermsandCondition({Key? key}) : super(key: key);

  @override
  State<TermsandCondition> createState() => _TermsandConditionState();
}

class _TermsandConditionState extends State<TermsandCondition> {
  final _controller = Get.find<AuthController>();

  @override
  void initState() {
    _controller.TermsAndCondpolicyAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        builder: (controller) => Scaffold(
              backgroundColor: AppColor.BGAPPCOLOR,
              appBar: CustomAppBar(
                onTap: () {
                  Get.back();
                },
                LeadingIconImage: AssetPaths.BACK_ICON,
                headingtitle: AppStrings.TERMS_CONDITIONS_TEXT,
              ),
              body: Padding(
                padding: EdgeInsets.all(kDefaultPadding),
                child: CustomTextWidget(
                  text: _controller.termscontent,
                  textColor: AppColor.BLACK_COLOR,
                  fontSize: 1.5.sp,
                ),
              ),
            ));
  }
}
