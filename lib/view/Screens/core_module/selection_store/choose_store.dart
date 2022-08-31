import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getxpractice/Resuable_widgets/custom_app_logo.dart';
import 'package:getxpractice/Resuable_widgets/custom_background_image.dart';
import 'package:getxpractice/Resuable_widgets/custom_text_widget.dart';

import 'package:getxpractice/utils/app_color.dart';

import 'package:getxpractice/utils/app_strings.dart';
import 'package:getxpractice/utils/constant.dart';
import 'package:getxpractice/view/Screens/core_module/home_menu_module/Home_menu.dart';
import '../../../../Modular/auth/Controllers.dart/CoreController/GetResturant/GetResController.dart';

import '../../registration_module/splash_screen_module/splash_screen.dart';
import 'choose_store_widget/choose_store_widget.dart';

class ChooseStore extends StatefulWidget {
  const ChooseStore({Key? key}) : super(key: key);

  @override
  State<ChooseStore> createState() => _ChooseStoreState();
}

class _ChooseStoreState extends State<ChooseStore> {
  @override
  void initState() {
    GetResController.i.GetRes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
        child: SafeArea(
            child: GetBuilder<GetResController>(
                builder: (controller) => GetResController.i.getResModel == null
                    ? Container(child: Container())
                    : Padding(
                        padding: EdgeInsets.only(
                            top: kDefaultPadding,
                            left: kDefaultPadding,
                            right: kDefaultPadding),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _customapplogo(),
                              _choosetext(),
                              ListView.builder(
                                  shrinkWrap: true, //Added
                                  itemCount: GetResController
                                      .i.getResModel?.resturant?.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ChooseStoreWidget(
                                        title: GetResController
                                                .i
                                                .getResModel!
                                                .resturant![index]
                                                .resturantName ??
                                            AppStrings.DEFAULT_CARD_TEXT,
                                        onTap: () async {
                                          Get.to(HOME_MENU_PAGES());
                                          await box.write(
                                              "GetRes",
                                              GetResController.i.getResModel!
                                                  .resturant![index]);

                                          await box.write(
                                              "GetResName",
                                              GetResController
                                                  .i
                                                  .getResModel!
                                                  .resturant![index]
                                                  .resturantName);
                                        });
                                  })
                            ])))));
  }

  Widget _choosetext() {
    return Column(
      children: [
        CustomTextWidget(
          fontSize: 1.4.sp,
          fontWeight: FontWeight.bold,
          textColor: AppColor.BLACK_COLOR,
          text: AppStrings.PLEASE_CHOOSE_STORE_TEXT,
        ),
        CustomTextWidget(
          fontSize: 1.4.sp,
          fontWeight: FontWeight.bold,
          textColor: AppColor.BLACK_COLOR,
          text: AppStrings.LIKE_TO_PICKUP_FORM_TEXT,
        ),
      ],
    );
  }

  Widget _customapplogo() {
    return CustomAppLogo(
      height: 0.15.sh,
      width: 0.50.sw,
    );
  }
}
