import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getxpractice/utils/app_color.dart';
import 'package:getxpractice/utils/constant.dart';

class TextFieldContainer extends StatelessWidget {
  final String? hinttext;
  final String? headingText;
  void Function()? onTapsuffixicon;
  final bool? isPrefixImageEnable;
  final String? isprefiximage;
  final String? issufiximage;
  final bool? issufixImageEnable;
  final Color? prefixIconColor;
  EdgeInsetsGeometry? contentPadding;
  final Widget? prefixiconWidget;
  final bool? SuffixPathStatus;
  final bool? PrefixPathStatus;
  final double? preiconscalesize;
  final double? suffixiconscalesize;
  final Widget? suffixiconWidget;

  final double? PrefixIconWidth;
  FocusNode? focusNode;
  TextInputType? keyboardType;
  List<TextInputFormatter>? inputFormatters;
  void Function(String)? onChanged;


  @override
  Key? key;
  bool? readonly;
   bool? obsecureText;
  String? Function(String?)? validator;
  final TextEditingController? controller;

  TextFieldContainer(
      {this.controller,
      this.prefixiconWidget,
      this.suffixiconscalesize,
      this.PrefixPathStatus,
      this.preiconscalesize,
      this.SuffixPathStatus,
      this.readonly,
      this.contentPadding,
      this.onTapsuffixicon,
      this.suffixiconWidget,
      this.focusNode,
      this.onChanged,
      this.inputFormatters,
      this.keyboardType,
      this.PrefixIconWidth,
      this.prefixIconColor,
      this.isprefiximage,
      this.issufiximage,
      this.issufixImageEnable,
      this.isPrefixImageEnable,
      this.headingText,
      this.obsecureText = true,
      this.hinttext,
      this.validator,
      this.key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 40.h,
            width: 1.sw,
            // width: ScreenMediaQuery.widthSize,
            margin: EdgeInsets.only(
              top: 12.h,
            ),
            decoration: BoxDecoration(
                color: AppColor.WHITE_COLOR,
                borderRadius: BorderRadius.circular(30.r)),
            child: TextFormField(
              onChanged: onChanged,
              readOnly: readonly ?? false,
              inputFormatters: inputFormatters,
              keyboardType: keyboardType,
              validator: validator,
              focusNode: focusNode,
              obscureText: obsecureText??false,
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: isPrefixImageEnable == true
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            width: PrefixIconWidth ?? 20,
                            // color: Colors.black,
                            child: PrefixPathStatus == false
                                ? prefixiconWidget
                                : Image.asset(
                                    scale: preiconscalesize,
                                    isprefiximage!,
                                  )),
                      )
                    : null,
                suffixIcon: issufixImageEnable == true
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: GestureDetector(
                            onTap: onTapsuffixicon,
                            child: SuffixPathStatus == false
                                ? suffixiconWidget
                                : Image.asset(
                                    alignment: Alignment.topLeft,
                                    scale: suffixiconscalesize,
                                    issufiximage!,
                                  ),
                          ),
                        ),
                      )
                    : null,
                prefixIconColor: prefixIconColor,
                contentPadding: contentPadding ??
                    EdgeInsets.only(left: 10.w, bottom: 10.w, top: 10.w),
                border: InputBorder.none,
                hintText: hinttext,
                hintStyle: TextStyle(
                  fontSize: 16.sp,
                  color: AppColor.BLACK_COLOR.withOpacity(0.8),
                ),
              ),
            ))
        .addNeumorphism(
            blurRadius: 0.5,
            spreadradius: 0.1,
            offset: Offset(0, 15),
            bottomShadowColor: AppColor.GREY_COLOR.withOpacity(0.02));
  }
}
