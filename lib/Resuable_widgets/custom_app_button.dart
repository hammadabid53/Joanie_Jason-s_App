import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getxpractice/Resuable_widgets/custom_text_widget.dart';
import 'package:getxpractice/utils/constant.dart';

import '../utils/app_color.dart';

class CustomAppBtn extends StatefulWidget {
  final String title;
  void Function()? onclickPressed;

  CustomAppBtn({this.onclickPressed, required this.title, Key? key})
      : super(key: key);

  @override
  State<CustomAppBtn> createState() => _CustomAppBtnState();
}

class _CustomAppBtnState extends State<CustomAppBtn> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Entry.scale(
      child: GestureDetector(
          onTap: widget.onclickPressed,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 0.05.sw),
            padding: EdgeInsets.symmetric(vertical: 0.03.sw),
            // height: ScreenMediaQuery.heightSize * 0.10,
            width: 1.sw,
            decoration: BoxDecoration(
              color: AppColor.SECONDARY_COLOR,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: CustomTextWidget(
                maxLines: 1,
                textAlign: TextAlign.center,
                fontSize: 1.2.sp,
                fontWeight: FontWeight.w400,
                text: widget.title,
              ),
            ),
          ).addNeumorphism(
              blurRadius: 0.5,
              spreadradius: 0.1,
              offset: Offset(0, 15),
              bottomShadowColor: AppColor.GREY_COLOR.withOpacity(0.02))),
    );
  }
}
