import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getxpractice/Resuable_widgets/custom_text_widget.dart';

import '../utils/app_color.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final Widget? body;
  final Widget? leading;
  final Widget? child;
  final bool? backIconEnable;

  final String? iconimage;

  void Function()? onLeadingTap;

  CustomAppBar(
      {this.backIconEnable = false,
      this.iconimage,
      this.child,
      this.onLeadingTap,
      this.leading,
      this.body,
      this.title,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: _backIconWidget(),
      title: appbartitle(),
    );
  }

  Widget appbartitle() {
    return Padding(
      padding: EdgeInsets.only(
        top: 0.05.sw,
      ),
      child: CustomTextWidget(
        fontWeight: FontWeight.bold,
        text: title,
        textColor: AppColor.BLACK_COLOR,
      ),
    );
  }

  Widget _backIconWidget() {
    return Visibility(
      visible: backIconEnable!,
      child: InkWell(
        onTap: onLeadingTap,
        child: Padding(
            padding: EdgeInsets.only(top: 0.06.sw, left: 22.0, right: 20.0),
            child: Image.asset(
              iconimage!,
              width: 25.w,
            )),
      ),
    );
  }
}
