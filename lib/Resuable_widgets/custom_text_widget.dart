import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getxpractice/utils/app_color.dart';

class CustomTextWidget extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final Widget? child;
  final String? fontFamily;
  bool? softWrap;

  CustomTextWidget(
      {this.text,
      this.child,
      this.textColor,
      this.fontSize,
      this.fontWeight,
      this.fontFamily,
      this.maxLines,
      this.textOverflow,
      this.textAlign,
      this.textDecoration,
      this.softWrap});

  @override
  Widget build(BuildContext context) {
    return Text(
      softWrap: softWrap,
      text ?? "",
      style: TextStyle(
        fontFamily: fontFamily,
        color: textColor ?? AppColor.WHITE_COLOR,
        fontWeight: fontWeight ?? FontWeight.w400,
        decoration: textDecoration ?? TextDecoration.none,
      ),
      textScaleFactor: fontSize ?? 1.5.sp,
      maxLines: maxLines,
      overflow: textOverflow,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
