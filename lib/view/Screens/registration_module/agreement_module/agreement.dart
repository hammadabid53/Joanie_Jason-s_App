import 'dart:async';

import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getxpractice/Resuable_widgets/checkbox.dart';
import 'package:getxpractice/Resuable_widgets/custom_text_widget.dart';
import 'package:getxpractice/utils/app_route_name.dart';
import 'package:getxpractice/view/Screens/registration_module/agreement_module/agreement_controller/agreement_controller.dart';

import '../../../../Resuable_widgets/alertcontainer.dart';
import '../../../../Resuable_widgets/custom_snackbar.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_strings.dart';
import '../../../../utils/constant.dart';

Future<void> showMyDialog(context) async {
  final agreementcontroller = Get.find<AgreementController>();

  List<String> text = [
    AppStrings.TERMS_CONDITIONS_TEXT,
    AppStrings.PRIVACY_POLICY_TEXT
  ];
  bool _onPresseddelay = true;

  return showAnimatedDialog<void>(
      animationType: DialogTransitionType.scaleRotate,
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Entry.scale(
            curve: Curves.ease,
            // delay: const Duration(seconds: 0),
            duration: const Duration(milliseconds: 500),
            child: AlertDialog(
                titlePadding: EdgeInsets.only(
                    left: kDefaultPadding,
                    right: kDefaultPadding,
                    top: kDefaultPadding),
                title: Center(
                  child: CustomTextWidget(
                    text: AppStrings.AGREEMENT_TEXT,
                    fontSize: 1.4.sp,
                    textColor: AppColor.BLACK_COLOR,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: AppColor.WHITE_COLOR,
                contentPadding: const EdgeInsets.only(bottom: 15),
                content: SizedBox(
                  height: 0.50.sh,
                  width: 1.sw,
                  child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: kDefaultPadding),
                            child: GetBuilder<AgreementController>(
                                builder: (controller) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        Center(
                                          child: CustomTextWidget(
                                            text: AppStrings.DISCLAIMER_TEXT,
                                            fontSize: 1.sp,
                                            textColor: AppColor.BLACK_COLOR,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          AppStrings.LOREM_IPSUM,
                                          style: setTextStyle(
                                            size: 12.sp,
                                            weight: FontWeight.bold,
                                            color: AppColor.DARK_GREY,
                                          ),
                                        ),
                                        LabeledCheckbox(
                                          label: text[0],
                                          onTap: () {
                                            Get.toNamed(AppRouteName
                                                .TERMS_AND_CONDTION_ROUTE);
                                          },
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          value: agreementcontroller.isSelected,
                                          onChanged: (bool newValue) {
                                            // agreementcontroller.isSelected =
                                            //     newValue;

                                            agreementcontroller
                                                .setisSelected(newValue);
                                            // _isSelected = newValue;

                                            // agreementcontroller.isSelected = false;
                                          },
                                        ),
                                        LabeledCheckbox(
                                          label: text[1],
                                          onTap: () {
                                            Get.toNamed(AppRouteName
                                                .PRIVACY_POLICY_ROUTE);
                                          },
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          value:
                                              agreementcontroller.isSelected2,
                                          onChanged: (bool newValue) {
                                            agreementcontroller
                                                .setisSelected2(newValue);

                                            // _isSelected2 = newValue;

                                            // agreementcontroller.isSelected2 = false;
                                          },
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            AlertContainer(
                                              onclickTap: (() {
                                                agreementcontroller
                                                    .setisSelected(false);
                                                agreementcontroller
                                                    .setisSelected2(false);
                                                Get.back();
                                              }),
                                              text: AppStrings.REJECT_TEXT,
                                              containercolor:
                                                  AppColor.WHITE_COLOR,
                                              textcolor:
                                                  AppColor.SECONDARY_COLOR,
                                            ),
                                            AlertContainer(
                                              onclickTap: _onPresseddelay ==
                                                      true
                                                  ? (() {
                                                      setState(() {
                                                        _onPresseddelay = false;
                                                      });
                                                      Timer(
                                                          Duration(seconds: 3),
                                                          () {
                                                        setState(() {
                                                          _onPresseddelay =
                                                              true;
                                                        });
                                                      });

                                                      if (agreementcontroller
                                                              .isSelected ==
                                                          false) {
                                                        customSnackBar(
                                                          "Please Check Terms And Condtions",
                                                          'Try Again',
                                                        );
                                                        return;
                                                      } else if (agreementcontroller
                                                              .isSelected2 ==
                                                          false) {
                                                        customSnackBar(
                                                          "Please Check Privacy",
                                                          'Try Again',
                                                        );
                                                        return;
                                                      }
                                                      if (agreementcontroller
                                                                  .isSelected ==
                                                              true &&
                                                          agreementcontroller
                                                                  .isSelected2 ==
                                                              true) {
                                                        Get.offNamed(AppRouteName
                                                            .LOGIN_SCREEN_ROUTE);
                                                      }
                                                      agreementcontroller
                                                          .setisSelected(false);
                                                      agreementcontroller
                                                          .setisSelected2(
                                                              false);
                                                    })
                                                  : null,
                                              containercolor:
                                                  AppColor.SECONDARY_COLOR,
                                              textcolor: AppColor.WHITE_COLOR,
                                              text: AppStrings.ACCEPT_TEXT,
                                            ).addNeumorphism(
                                                bottomShadowColor: AppColor
                                                    .DARK_GREY
                                                    .withOpacity(0.1))
                                          ],
                                        ),
                                      ],
                                    )))
                      ]),
                )),
          );
        });
      });
}
 
      
// class AgreementDialog extends StatefulWidget {
//   const AgreementDialog({Key? key}) : super(key: key);

//   @override
//   State<AgreementDialog> createState() => _AgreementDialogState();
// }

// class _AgreementDialogState extends State<AgreementDialog> {
//   final agreementcontroller = Get.find<AgreementController>();

//   List<String> text = [
//     AppStrings.TERMS_CONDITIONS_TEXT,
//     AppStrings.PRIVACY_POLICY_TEXT
//   ];
//   bool _onPresseddelay = true;
//   @override
//   Widget build(BuildContext context) {
//      return
//     Entry.scale(
//       curve: Curves.ease,
//       // delay: const Duration(seconds: 0),
//       duration: const Duration(milliseconds: 500),
//       child: AlertDialog(
//           titlePadding: EdgeInsets.only(
//               left: kDefaultPadding,
//               right: kDefaultPadding,
//               top: kDefaultPadding),
//           title: Center(
//             child: CustomTextWidget(
//               text: AppStrings.AGREEMENT_TEXT,
//               fontSize: 1.4.sp,
//               textColor: AppColor.BLACK_COLOR,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30),
//           ),
//           backgroundColor: AppColor.WHITE_COLOR,
//           contentPadding: const EdgeInsets.only(bottom: 15),
//           content: SizedBox(
//             height: 0.50.sh,
//             width: 1.sw,
//             child: Column(
//                 // mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: kDefaultPadding),
//                       child: GetBuilder<AgreementController>(
//                           builder: (controller) => Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   SizedBox(
//                                     height: 15.h,
//                                   ),
//                                   Center(
//                                     child: CustomTextWidget(
//                                       text: AppStrings.DISCLAIMER_TEXT,
//                                       fontSize: 1.sp,
//                                       textColor: AppColor.BLACK_COLOR,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10.h,
//                                   ),
//                                   Text(
//                                     AppStrings.LOREM_IPSUM,
//                                     style: setTextStyle(
//                                       size: 12.sp,
//                                       weight: FontWeight.bold,
//                                       color: AppColor.DARK_GREY,
//                                     ),
//                                   ),
//                                   LabeledCheckbox(
//                                     label: text[0],
//                                     onTap: () {
//                                       Get.toNamed(AppRouteName
//                                           .TERMS_AND_CONDTION_ROUTE);
//                                     },
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 20.0),
//                                     value: agreementcontroller.isSelected,
//                                     onChanged: (bool newValue) {
//                                       // agreementcontroller.isSelected =
//                                       //     newValue;

//                                       agreementcontroller
//                                           .setisSelected(newValue);
//                                       // _isSelected = newValue;

//                                       // agreementcontroller.isSelected = false;
//                                     },
//                                   ),
//                                   LabeledCheckbox(
//                                     label: text[1],
//                                     onTap: () {
//                                       Get.toNamed(
//                                           AppRouteName.PRIVACY_POLICY_ROUTE);
//                                     },
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 20.0),
//                                     value: agreementcontroller.isSelected2,
//                                     onChanged: (bool newValue) {
//                                       agreementcontroller
//                                           .setisSelected2(newValue);
//                                       // _isSelected2 = newValue;

//                                       // agreementcontroller.isSelected2 = false;
//                                     },
//                                   ),
//                                   SizedBox(
//                                     height: 10.h,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       AlertContainer(
//                                         onclickTap: (() {
//                                           Get.back();
//                                         }),
//                                         text: AppStrings.REJECT_TEXT,
//                                         containercolor: AppColor.WHITE_COLOR,
//                                         textcolor: AppColor.SECONDARY_COLOR,
//                                       ),
//                                       AlertContainer(
//                                         onclickTap: _onPresseddelay == true
//                                             ? (() {
//                                                 setState(() {
//                                                   _onPresseddelay = false;
//                                                 });
//                                                 Timer(Duration(seconds: 3), () {
//                                                   setState(() {
//                                                     _onPresseddelay = true;
//                                                   });
//                                                 });

//                                                 if (agreementcontroller
//                                                         .isSelected ==
//                                                     false) {
//                                                   customSnackBar(
//                                                     "Please Check Terms And Condtions",
//                                                     'Try Again',
//                                                   );
//                                                   return;
//                                                 } else if (agreementcontroller
//                                                         .isSelected2 ==
//                                                     false) {
//                                                   customSnackBar(
//                                                     "Please Check Privacy",
//                                                     'Try Again',
//                                                   );
//                                                   return;
//                                                 }
//                                                 if (agreementcontroller
//                                                             .isSelected ==
//                                                         true &&
//                                                     agreementcontroller
//                                                             .isSelected2 ==
//                                                         true) {
//                                                   Get.toNamed(AppRouteName
//                                                       .LOGIN_SCREEN_ROUTE);
//                                                 }
//                                                 agreementcontroller
//                                                     .setisSelected(false);
//                                                 agreementcontroller
//                                                     .setisSelected2(false);
//                                               })
//                                             : null,
//                                         containercolor:
//                                             AppColor.SECONDARY_COLOR,
//                                         textcolor: AppColor.WHITE_COLOR,
//                                         text: AppStrings.ACCEPT_TEXT,
//                                       ).addNeumorphism(
//                                           bottomShadowColor: AppColor.DARK_GREY
//                                               .withOpacity(0.1))
//                                     ],
//                                   ),
//                                 ],
//                               )))
//                 ]),
//           )),
//     );
//   }
// }


        
 
      
