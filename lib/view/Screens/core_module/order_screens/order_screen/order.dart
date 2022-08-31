import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getxpractice/Modular/auth/Controllers.dart/CoreController/PastOrderController/PastOrderController.dart';
import 'package:getxpractice/utils/app_assets_path.dart';
import 'package:getxpractice/utils/app_color.dart';
import 'package:getxpractice/utils/app_strings.dart';
import 'package:getxpractice/utils/constant.dart';
import 'package:getxpractice/view/Screens/core_module/order_screens/order_screen_widget.dart/past_order.dart';

import '../../../../../Resuable_widgets/appbar.dart/custom_appbar.dart';
import '../../../../../Resuable_widgets/custom_text_widget.dart';
import '../../../../../utils/app_route_name.dart';
import '../../../registration_module/splash_screen_module/splash_screen.dart';

class Orderscreen extends StatefulWidget {
  const Orderscreen({Key? key}) : super(key: key);

  @override
  State<Orderscreen> createState() => _OrderscreenState();
}

class _OrderscreenState extends State<Orderscreen> {
  @override
  void initState() {
    PastOrderController.p.Pastorderapi(box.read("user_id").toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.BGAPPCOLOR,
      appBar: CustomAppBar(
        onTap: () {
          Get.toNamed(AppRouteName.HOME_PAGES_ROUTE);
        },
        LeadingIconImage: AssetPaths.BACK_ICON,
        headingtitle: AppStrings.ORDERS_TITLE,
      ),
      body: Padding(
        padding: EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              fontSize: 1.4.sp,
              text: AppStrings.PAST_ORDERS_TEXT,
              textColor: AppColor.BLACK_COLOR,
              fontWeight: FontWeight.bold,
            ),
            GetBuilder<PastOrderController>(
              
                builder: (controller) => PastOrder())
          ],
        ),
      ),
    );
  }
}
