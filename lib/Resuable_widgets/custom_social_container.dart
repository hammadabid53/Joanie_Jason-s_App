import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getxpractice/Resuable_widgets/custom_text_widget.dart';
import 'package:getxpractice/utils/constant.dart';

class SocialContainer extends StatelessWidget {
  final String textname;
  final Color color;
  final String iconimage;
  final Color textcolor;
  final Color iconcolor;
  void Function()? onclicktap;

  SocialContainer(
      {required this.onclicktap,
      required this.color,
      required this.textname,
      required this.iconimage,
      required this.textcolor,
      required this.iconcolor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: InkWell(
        onTap: onclicktap,
        child: Container(
          height: 40.h,
          width: 1.sw,
          margin: EdgeInsets.only(top: 15.h),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ImageIcon(
                AssetImage(
                  iconimage,
                ),
                color: iconcolor,
              ),
              SizedBox(
                width: 10.w,
              ),
              CustomTextWidget(
                  text: textname, textColor: textcolor, fontSize: 1.2.sp)
            ],
          ),
        ),
      ),
    );
  }
}
