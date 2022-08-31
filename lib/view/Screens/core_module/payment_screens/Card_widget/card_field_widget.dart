import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Resuable_widgets/custom_text_widget.dart';
import '../../../../../Resuable_widgets/custom_textfield_container.dart';
import '../../../../../utils/app_color.dart';

class CardFieldWidget extends StatelessWidget {
  String? titlename;
  TextEditingController? controller;
  CardFieldWidget({this.titlename, this.controller, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 0.10.sh,

      // color: Colors.grey,
      child: Stack(
        children: [
          Positioned(
              top: 15.h,
              right: 2.w,
              left: 2.w,
              child: Container(
                  child: TextFieldContainer(
                controller: controller,
                obsecureText: false,
              ))),
          Positioned(
            top: 5.h,
            left: 10.h,
            child: CustomTextWidget(
              fontSize: 1.2.sp,
              fontWeight: FontWeight.bold,
              text: titlename,
              textColor: AppColor.BLACK_COLOR,
            ),
          ),
        ],
      ),
    );
  }
}
