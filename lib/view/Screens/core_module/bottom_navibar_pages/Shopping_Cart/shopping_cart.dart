import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getxpractice/Resuable_widgets/appbar.dart/custom_appbar.dart';
import 'package:getxpractice/Resuable_widgets/bot_toast/success_message.dart';
import 'package:getxpractice/Resuable_widgets/custom_text_widget.dart';
import 'package:getxpractice/utils/app_assets_path.dart';
import 'package:getxpractice/utils/app_color.dart';
import 'package:getxpractice/utils/app_strings.dart';
import 'package:getxpractice/utils/constant.dart';

import 'package:getxpractice/view/Screens/core_module/bottom_navibar_pages/Shopping_Cart/shoppingcart_controller.dart';
import 'package:getxpractice/view/Screens/core_module/payment_screens/checkout.dart';

import '../../../../../Resuable_widgets/custom_app_button.dart';

class ShoppingCart extends StatefulWidget {
  bool? isshow;
  ShoppingCart({this.isshow, Key? key}) : super(key: key);

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  @override
  Widget build(BuildContext context) {
    print("length kia arhi h :  ${AddToCartVM.sp.lst.length}");

    return Scaffold(
      appBar: widget.isshow!
          ? CustomAppBar(
              headingtitle: AppStrings.SHOPPING_CART_TEXT,
              LeadingIconImage: AssetPaths.BACK_ICON,
              onTap: () {
                Get.back();
              },
            )
          : null,
      body: SafeArea(
        child: GetBuilder<AddToCartVM>(
          builder: (controller) => Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 10.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _PreparationContainer(),
                  SizedBox(
                    height: 20.h,
                  ),
                  _SubtotalContainer(),
                  SizedBox(
                    height: 0.05.sh,
                  ),
                  _ReviewPaymentbtn()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _SubtotalContainer() {
  return GetBuilder<AddToCartVM>(
      builder: (controller) => 
      Container(
            // width: 0.80.sw,
            decoration: BoxDecoration(
              color: AppColor.WHITE_COLOR,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  left: 20.w, right: 20.w, top: 10.h, bottom: 20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    width: 300.w,
                    // color: AppColor.GREY_COLOR,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        CustomTextWidget(
                          text: AppStrings.QUANTITY_TEXT,
                          textColor: AppColor.BLACK_COLOR,
                          fontWeight: FontWeight.bold,
                          fontSize: 1.sp,
                        ),
                        SizedBox(
                          width: 5.h,
                        ),
                        Container(
                          width: 0.35.sw,
                          // color: AppColor.BLACK_COLOR,
                          child: CustomTextWidget(
                            text: AppStrings.PRODUCT_DETAILS_TEXT,
                            textColor: AppColor.BLACK_COLOR,
                            fontWeight: FontWeight.bold,
                            fontSize: 1.sp,
                          ),
                        ),
                        SizedBox(
                          width: 5.h,
                        ),
                        CustomTextWidget(
                          text: AppStrings.PRICE_TEXT,
                          textColor: AppColor.BLACK_COLOR,
                          fontWeight: FontWeight.bold,
                          fontSize: 1.sp,
                        ),
                        SizedBox(
                          width: 10.h,
                        ),
                        CustomTextWidget(
                          text: AppStrings.DELETE_TEXT,
                          textColor: AppColor.BLACK_COLOR,
                          fontWeight: FontWeight.bold,
                          fontSize: 1.sp,
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      height: 0.15.sh,
                      child: ListView.builder(
                          shrinkWrap: true, //Added
                          itemCount: AddToCartVM.sp.lst.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: kDefaultPadding, bottom: 0),
                                child: Container(
                                  padding:
                                      EdgeInsets.only(left: 10.w, right: 10.w),
                                  width: 300.w,
                                  // color: AppColor.GREEN_COLOR,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 20.h,
                                        width: 20.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          color: AppColor.SECONDARY_COLOR,
                                        ),
                                        child: Center(
                                          child: CustomTextWidget(
                                              fontSize: 1.sp,
                                              textColor: AppColor.WHITE_COLOR,
                                              fontWeight: FontWeight.bold,
                                              text: AddToCartVM
                                                  .sp.lst[index].quantity
                                                  .toString()),
                                        ),
                                      ),
                                      Container(
                                        width: 0.35.sw,
                                        // color: AppColor.BLACK_COLOR,
                                        child: CustomTextWidget(
                                          fontSize: 1.2.sp,
                                          textColor: AppColor.SECONDARY_COLOR,
                                          fontWeight: FontWeight.bold,
                                          text: AddToCartVM
                                                      .sp.lst[index].title !=
                                                  null
                                              ? AddToCartVM.sp.lst[index].title!
                                              : AppStrings.LOADING_TEXT,
                                        ),
                                      ),
                                      CustomTextWidget(
                                        fontSize: 1.4.sp,
                                        textColor: AppColor.SECONDARY_COLOR,
                                        fontWeight: FontWeight.bold,
                                        text: AddToCartVM.sp.lst[index].price !=
                                                null
                                            ? AddToCartVM.sp.lst[index].price!
                                                .toStringAsFixed(2)
                                            : AppStrings.LOADING_TEXT,
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            AddToCartVM.sp.sub =
                                                AddToCartVM.sp.sub -
                                                    AddToCartVM
                                                        .sp.lst[index].price!;
                                            AddToCartVM.sp.del(index);
                                            showSuccessMessage(
                                                "product Deleted");

                                            print(
                                                "sub value####################${AddToCartVM.sp.sub.toString()}");

                                            controller.refresh();
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: AppColor.SECONDARY_COLOR,
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ]);
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  Container(
                    height: 30.h,
                    padding: EdgeInsets.only(
                        top: 10, left: kDefaultPadding, right: 15.w),
                    // color: AppColor.DARK_GREY,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(
                          fontSize: 1.4.sp,
                          textColor: AppColor.BLACK_COLOR,
                          fontWeight: FontWeight.bold,
                          text: AppStrings.SUBTOTAL_TEXT,
                        ),
                        CustomTextWidget(
                          fontSize: 1.2.sp,
                          textColor: AppColor.SECONDARY_COLOR,
                          fontWeight: FontWeight.bold,
                          text: AddToCartVM.sp.sub.toStringAsFixed(2),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(kDefaultPadding),
                    child: Row(
                      children: [
                        Image.asset(
                            height: 25.h,
                            width: 25.w,
                            AssetPaths.CHECKBOX_ICON),
                        SizedBox(
                          width: 10.w,
                        ),
                        CustomTextWidget(
                          fontSize: 1.2.sp,
                          textColor: AppColor.BLACK_COLOR,
                          fontWeight: FontWeight.bold,
                          text: AppStrings.APPY_TEXT,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 40.h,
                    margin: EdgeInsets.only(left: 10.w, right: 10.w),
                    decoration: BoxDecoration(
                      color: AppColor.PRIMARY_COLOR,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: kDefaultPadding, right: kDefaultPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget(
                            fontSize: 1.2.sp,
                            text: AppStrings.TOTAL_INCLUDE_TEXT,
                            textColor: AppColor.BLACK_COLOR,
                            fontWeight: FontWeight.bold,
                          ),
                          CustomTextWidget(
                            fontSize: 1.2.sp,
                            textColor: AppColor.SECONDARY_COLOR,
                            fontWeight: FontWeight.bold,
                            text: AddToCartVM.sp.sub.toStringAsFixed(2),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ).addNeumorphism(
              bottomShadowColor: AppColor.GREY_COLOR.withOpacity(0.1)));
}

Widget _ReviewPaymentbtn() {
  return CustomAppBtn(
      onclickPressed: () {
        Get.to(CheckOut());
      },
      title: AppStrings.REVIEW_PAYMENT_TEXT);
}

Widget _PreparationContainer() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
          height: 60.h,
          width: 150.w,
          decoration: BoxDecoration(
            color: AppColor.PRIMARY_COLOR,
            borderRadius: BorderRadius.circular(40),
          ),
          child: ListTile(
            horizontalTitleGap: 0.1,
            leading: Image.asset(
                height: 30.h, width: 30.w, AssetPaths.PREPARATION_TIME),
            title: CustomTextWidget(
              fontSize: 0.7.sp,
              textColor: AppColor.BLACK_COLOR,
              fontWeight: FontWeight.bold,
              text: AppStrings.PREPARATION_TIME_TEXT,
            ),
            subtitle: CustomTextWidget(
              fontSize: 1.sp,
              fontWeight: FontWeight.bold,
              textColor: AppColor.BLACK_COLOR,
              text: AppStrings.TIME_IN_MINS_TEXT,
            ),
          )).addNeumorphism(
        bottomShadowColor: AppColor.GREY_COLOR.withOpacity(0.1),
      ),
      SizedBox(
        width: 10.w,
      ),
      Container(
          height: 60.h,
          width: 140.w,
          decoration: BoxDecoration(
            color: AppColor.SECONDARY_COLOR,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextWidget(
                    fontSize: 0.8.sp,
                    fontWeight: FontWeight.bold,
                    textColor: AppColor.WHITE_COLOR,
                    text: AppStrings.ST_ANDREWS_CENTER,
                    softWrap: true,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Image.asset(scale: 3.sp, AssetPaths.DROP_DOWN_IMAGE),
                ],
              )
            ],
          ))
    ],
  );
}
