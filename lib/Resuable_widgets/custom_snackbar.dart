import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getxpractice/Resuable_widgets/custom_text_widget.dart';
import 'package:getxpractice/utils/app_color.dart';

SnackbarController customSnackBar(String message, String title) => Get.snackbar(
      titleText: CustomTextWidget(
        text: title,
      ),
      "",
      message,
      animationDuration: const Duration(seconds: 1),
      margin: const EdgeInsets.all(8),
      borderRadius: 10,
      reverseAnimationCurve: Curves.easeIn,
      forwardAnimationCurve: Curves.easeOut,
      duration: const Duration(seconds: 2),
      icon: const Icon(
        Icons.info_outline,
        color: Colors.white,
      ),
      snackPosition: SnackPosition.TOP,
      isDismissible: true,
      backgroundColor: AppColor.DARK_BROWN_COLOR,
      colorText: AppColor.WHITE_COLOR,
    );
