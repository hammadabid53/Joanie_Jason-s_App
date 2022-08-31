import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getxpractice/utils/constant.dart';

import '../utils/app_color.dart';

class OtpContainer extends StatelessWidget {
  final String? text;
  const OtpContainer({this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        padding:
            const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 15),
        decoration: BoxDecoration(
            color: AppColor.WHITE_COLOR,
            borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
