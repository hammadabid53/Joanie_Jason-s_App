import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getxpractice/Resuable_widgets/custom_text_widget.dart';
import 'package:getxpractice/utils/app_color.dart';
import 'package:getxpractice/utils/app_strings.dart';

showErrorMessage(String message) {
  BotToast.showCustomText(
    animationDuration: const Duration(milliseconds: 200),
    align: Alignment.center,
    clickClose: true,
    toastBuilder: (close) {
      return AnimatedContainer(
        duration: const Duration(seconds: 5),
        curve: Curves.fastLinearToSlowEaseIn,
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
                blurRadius: 7,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Orange Bar
              Container(
                height: 20,
                width: double.infinity,
                decoration: const BoxDecoration(
                  // color: AppColor.DARK_BROWN_COLOR,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0)),
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(6),
                // child: Image.asset(scale: 4, AssetPaths.ERROR_ICON),
              ),
              // Title
              Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: CustomTextWidget(
                    text: AppStrings.ERROR_FOUND_TEXT,
                    fontSize: 1.4.sp,
                    fontWeight: FontWeight.bold,
                    textColor: AppColor.RED_COLOR,
                  )),
              // Message
              Container(
                  margin: const EdgeInsets.fromLTRB(10, 8, 10, 10),
                  width: double.infinity,
                  child: CustomTextWidget(
                    text: message,
                    fontSize: 1.2.sp,
                    textColor: AppColor.RED_COLOR,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  )),

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
                      text: AppStrings.TRY_AGAIN_TEXT,
                      fontSize: 1.2.sp,
                      fontWeight: FontWeight.bold,
                      textColor: AppColor.WHITE_COLOR),
                ),
              )
            ],
          ),
        ),
      );
    },
    duration: Duration(seconds: 5),
    onClose: () {
      print("closed");
    },
    onlyOne: false,
  );
}
