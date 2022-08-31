import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getxpractice/utils/app_color.dart';

import '../../utils/app_strings.dart';
import '../custom_text_widget.dart';

showSuccessMessage(String message) {
  BotToast.showCustomText(
    animationDuration: const Duration(milliseconds: 500),
    align: Alignment.center,
    clickClose: true,
    toastBuilder: (close) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: AnimatedContainer(
          duration: const Duration(seconds: 3),
          curve: Curves.fastOutSlowIn,
          color: Colors.black.withOpacity(0.45),
          alignment: Alignment.center,
          child: Container(
            width: 250,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColor.BGAPPCOLOR,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Green Bar
                Container(
                  height: 20,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    //  color: Color.fromARGB(255, 126, 230, 16),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0)),
                  ),
                  alignment: Alignment.center,
                ),
                // Title
                Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: CustomTextWidget(
                      text: AppStrings.SUCCESS_TEXT,
                      fontSize: 1.6.sp,
                      fontWeight: FontWeight.bold,
                      textColor: AppColor.GREEN_COLOR,
                    )),
                // Message
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 8, 10, 10),
                  width: double.infinity,
                  // child: CustomTextWidget(
                  //   text: message,
                  //   fontSize: 1.2.sp,
                  //   textColor: AppColor.GREEN_COLOR,
                  //   fontWeight: FontWeight.bold,
                  //   textAlign: TextAlign.center,
                  // )
                ),
                // Close Button
                Container(
                  height: 40,
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: MaterialButton(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    onPressed: close,
                    color: AppColor.DARK_BROWN_COLOR,
                    child: CustomTextWidget(
                        text: message,
                        fontSize: 1.0.sp,
                        fontWeight: FontWeight.bold,
                        textColor: AppColor.WHITE_COLOR),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
    duration: null,
    onClose: () {
      print("closed");
    },
    onlyOne: false,
  );
}
