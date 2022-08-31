import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getxpractice/utils/app_color.dart';

//defaultpadding
final kDefaultPadding = 15.0.sp;

//ScreenSize

// class ScreenMediaQuery {
//   static double widthSize = 0.0;
//   static double heightSize = 0.0;

//   static void screenSizeMethod({required BuildContext context}) {
//     widthSize = MediaQuery.of(context).size.width;
//     heightSize = MediaQuery.of(context).size.height;
//   }
// }

//global font

const String PlayFairDisplay = "PlayfairDisplay";
const String PlayFairDisplay_Black = "PlayfairDisplay-Black";
const String PlayFairDisplay_Bold = "PlayfairDisplay-Bold";
const String PlayFairDisplay_Regular = "PlayfairDisplay-Regular";

//global textstyle

TextStyle setTextStyle(
    {color = Colors.white,
    double size = 15,
    weight = FontWeight.normal,
    family = PlayFairDisplay}) {
  return TextStyle(
    fontWeight: weight,
    color: color,
    fontSize: size,
    fontFamily: family,
  );
}

final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

//Neumorphisum design for containers

extension Neumorphism on Widget {
  addNeumorphism({
    double borderRadius = 30.0,
    Offset offset = const Offset(0, 3),
    double blurRadius = 5,
    double spreadradius = 3,
    // Color topShadowColor = AppColor.GREY_COLOR,
    Color bottomShadowColor = AppColor.BGAPPCOLOR,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            offset: offset,
            blurRadius: blurRadius,
            color: bottomShadowColor,
            spreadRadius: spreadradius,
          ),
          // BoxShadow(
          //   offset: Offset(-offset.dx, -offset.dx),
          //   blurRadius: blurRadius,
          //   spreadRadius: spreadradius,
          //   color: topShadowColor,
          // ),
        ],
      ),
      child: this,
    );
  }
}
