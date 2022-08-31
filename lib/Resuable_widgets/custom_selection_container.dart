import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getxpractice/Resuable_widgets/custom_text_widget.dart';


class CustomSelection extends StatelessWidget {
  final String? title;
  final Color? color;

  void Function()? onclickTap;
  CustomSelection({this.onclickTap, this.color, this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onclickTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0.30.sw),
        width: 150.w,
        // height: ScreenMediaQuery.heightSize * 0.40,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(8), color: color),
        child: Center(child: CustomTextWidget(fontSize: 2.sp, text: title)),
      ),
    );
  }
}
