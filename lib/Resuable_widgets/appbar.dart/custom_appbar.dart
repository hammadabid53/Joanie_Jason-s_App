import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getxpractice/utils/app_color.dart';
import 'package:getxpractice/utils/constant.dart';

import '../custom_text_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? headingtitle;
  void Function()? onTap;
  final String? LeadingIconImage;

  CustomAppBar({
    Key? key,
    this.onTap,
    this.LeadingIconImage,
    this.headingtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColor.BGAPPCOLOR,
      leading: GestureDetector(
        onTap: onTap,
        child: Padding(
            padding:
                EdgeInsets.only(left: kDefaultPadding, top: 12, bottom: 12),
            child: Image.asset(LeadingIconImage!)),
      ),
      title: CustomTextWidget(
        text: headingtitle,
        fontSize: 1.2.sp,
        fontWeight: FontWeight.bold,
        textColor: AppColor.BLACK_COLOR,
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
