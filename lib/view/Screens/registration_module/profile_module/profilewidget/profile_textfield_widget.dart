import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getxpractice/utils/app_color.dart';

import '../../../../../Resuable_widgets/custom_text_widget.dart';
import '../../../../../Resuable_widgets/custom_textfield_container.dart';

class ProfileTextFields extends StatelessWidget {
  TextEditingController? controller;
  bool readonly;
  String? hinttext;
  bool? obsecureText = true;
  String? title;
  ProfileTextFields(
      {this.hinttext,
      this.obsecureText,
      required this.readonly,
      this.controller,
      this.title,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.10.sh,

      // color: Colors.grey,
      child: Stack(
        children: [
          Positioned(
              top: 10.h,
              right: 2.w,
              left: 2.w,
              child: TextFieldContainer(
                readonly: readonly,
                controller: controller,
                hinttext: hinttext,
                obsecureText: obsecureText,
              )),
          Positioned(
            top: 5.h,
            left: 10.h,
            child: CustomTextWidget(
              fontSize: 1.2.sp,
              fontWeight: FontWeight.w700,
              text: title,
              textColor: AppColor.BLACK_COLOR,
            ),
          ),
        ],
      ),
    );
  }
}
