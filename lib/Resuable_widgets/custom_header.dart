import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_assets_path.dart';
import 'custom_text_widget.dart';


class CustomHeaderApp extends StatelessWidget {
  final void Function()? onTap;
  final String? title;
  final bool isnull;

  CustomHeaderApp({this.isnull = true, this.title, this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: GestureDetector(
                onTap: onTap,
                child: Container(
                  alignment: Alignment.topLeft,
                  // color: Colors.blue,
                  margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
                  child: Container(
                    width: 25.w,
                    height: 25.h,
                    child: const Center(
                      child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(AssetPaths.BACK_ICON)),
                    ),
                  ),
                ))),
        Visibility(
          visible: isnull,
          child: Expanded(
            flex: 5,
            child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 10.h, bottom: 10.h, right: 50.w),
                height: 40.h,
                child: Center(
                  child: CustomTextWidget(
                    fontSize: 3.sp,
                    text: title,
                  ),
                )),
          ),
        )
      ],
    );
  }
}
