import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getxpractice/utils/constant.dart';

import '../../../../../Resuable_widgets/custom_text_widget.dart';
import '../../../../../utils/app_assets_path.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/app_strings.dart';

class ChooseStoreWidget extends StatelessWidget {
  String title;
  void Function() onTap;
ChooseStoreWidget( { required this.title,  required this.onTap , Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      

      child: Container(
        height: 150.h,
        margin: EdgeInsets.only(top: kDefaultPadding),
       
        child: Wrap(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 0.50.sw,
                      // color: AppColor.FACEBOOK_BUTTON_COLOR,
                      padding: const EdgeInsets.only(left: 40),
                      margin: const EdgeInsets.only(left: 40),
                      child: CircleAvatar(
                        radius: 58,
                        backgroundColor: AppColor.DARK_BROWN_COLOR,
                        child: CircleAvatar(
                          radius: 55,
                          backgroundColor: AppColor.WHITE_COLOR,
                          child: Image.asset(
                              height: 60.h,
                              width: 80.w,
                              AssetPaths.JOANIE_LOGO2),
                        ),
                      ),
                    ),
                    Container(
                      width: 0.30.sw,
                      // color: AppColor.RED_COLOR,
                      padding: EdgeInsets.only(right: kDefaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor:
                                AppColor.DARK_BROWN_COLOR.withOpacity(0.7),
                            child: Center(
                              child: Image.asset(
                                  height: 20.h,
                                  width: 30.w,
                                  AssetPaths.LOCATION_IMAGE),
                            ),
                          ),
                          Wrap(children: [
                            CustomTextWidget(
                              fontSize: 1.sp,
                              fontWeight: FontWeight.bold,
                              maxLines: 2,
                              textColor: AppColor.BLACK_COLOR,
                              text: AppStrings.MILES_AWAY_TEXT,
                            ),
                          ]),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  height: 50.h,
                  // color: AppColor.green,
                  padding: EdgeInsets.only(
                      left: kDefaultPadding, right: kDefaultPadding),
                  child: Center(
                    child: CustomTextWidget(
                      fontSize: 1.sp,
                      fontWeight: FontWeight.bold,
                      textColor: AppColor.BLACK_COLOR,
                      text: title,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
