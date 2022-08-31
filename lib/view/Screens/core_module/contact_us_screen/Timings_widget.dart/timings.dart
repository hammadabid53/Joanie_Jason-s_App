import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Resuable_widgets/custom_text_widget.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/app_strings.dart';

class TimingsFields extends StatelessWidget {
  String? Day, TimingText, Dayopenclose;

  TimingsFields({this.Day, this.TimingText, this.Dayopenclose, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: CustomTextWidget(
            text: AppStrings.MONDAY_TIMINGS_TEXT,
            fontSize: 1.sp,
            textColor: AppColor.DARK_BROWN_COLOR,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Container(
          width: 80.w,
          // color: AppColor.DARK_BROWN_COLOR,
          child: Row(
            children: [
              CustomTextWidget(
                text: TimingText,
                fontSize: 1.sp,
                textColor: AppColor.DARK_BROWN_COLOR,
                fontWeight: FontWeight.normal,
              ),
              CustomTextWidget(
                text: "-",
                fontSize: 1.sp,
                textColor: AppColor.DARK_BROWN_COLOR,
                fontWeight: FontWeight.normal,
              ),
              CustomTextWidget(
                text: Dayopenclose,
                fontSize: 1.sp,
                textColor: AppColor.DARK_BROWN_COLOR,
                fontWeight: FontWeight.normal,
              ),
            ],
          ),
        )
      ],
    );
  }
}
