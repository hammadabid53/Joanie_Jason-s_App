import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getxpractice/Resuable_widgets/custom_text_widget.dart';
import 'package:getxpractice/utils/app_assets_path.dart';
import 'package:getxpractice/utils/app_color.dart';

import 'package:getxpractice/utils/app_strings.dart';
import 'package:getxpractice/utils/constant.dart';

import '../../../../Modular/auth/Controllers.dart/AuthController/AuthController.dart';
import '../../../../Resuable_widgets/appbar.dart/custom_appbar.dart';


class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  final _controller = Get.find<AuthController>();

  @override
  void initState() {
    _controller.PrivacyPolicy();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.BGAPPCOLOR,
        appBar: CustomAppBar(
            onTap: () {
              Get.back();
            },
            LeadingIconImage: AssetPaths.BACK_ICON,
            headingtitle: AppStrings.PRIVACY_POLICY_TEXT),
        body: Padding(
          padding: EdgeInsets.all(kDefaultPadding),
          child: GetBuilder<AuthController>(
            // init: _controller.refresh(),
            builder: (controller) => CustomTextWidget(
              text: _controller.privacycontent,
              textColor: AppColor.BLACK_COLOR,
            ),
          ),
        ));
  }
}
