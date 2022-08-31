

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getxpractice/utils/app_color.dart';
import 'package:getxpractice/utils/constant.dart';

import '../../../../../Resuable_widgets/custom_text_widget.dart';
import '../../../../../utils/app_strings.dart';


class OnGoingOrder extends StatelessWidget {
  const OnGoingOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
            margin: EdgeInsets.only(top: kDefaultPadding),
            height: 0.18.sh,
            width: 1.sw,
            decoration: BoxDecoration(
              color: AppColor.WHITE_COLOR,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(kDefaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 0.14.sh,
                    width: 0.30.sw,
                    decoration: BoxDecoration(
                      color: AppColor.RED_COLOR,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        fontSize: 1.sp,
                        text: AppStrings.DRIP_COFFEE_TEXT,
                        textColor: AppColor.BLACK_COLOR,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomTextWidget(
                        text: AppStrings.FRESH_BROWED_COFFEE_TEXT,
                        fontSize: 0.8.sp,
                        textColor: AppColor.DARK_GREY,
                        fontWeight: FontWeight.normal,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomTextWidget(
                        text: AppStrings.DATE_TEXT,
                        fontSize: 0.8.sp,
                        textColor: AppColor.DARK_GREY,
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: AppStrings.PRICE_TEXT,
                          fontSize: 1.5.sp,
                          textColor: AppColor.DARK_BROWN_COLOR,
                          fontWeight: FontWeight.normal,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ))
        .addNeumorphism(
            blurRadius: 0.5,
            spreadradius: 0.1,
            offset: Offset(0, 15),
            bottomShadowColor: AppColor.GREY_COLOR.withOpacity(0.02));
    
  }
}