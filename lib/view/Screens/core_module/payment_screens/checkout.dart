import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getxpractice/Modular/auth/Controllers.dart/CoreController/GetResturant/GetResController.dart';
import 'package:getxpractice/Modular/auth/Controllers.dart/CoreController/product_order_Controller/product_controller.dart';
import 'package:getxpractice/Modular/auth/Controllers.dart/PaymentController/Get_Card_Controller.dart';
import 'package:getxpractice/Modular/auth/Models/CoreModuleModels/Get_Single_Product/Get_Single_Product_Model.dart';
import 'package:getxpractice/Resuable_widgets/appbar.dart/custom_appbar.dart';
import 'package:getxpractice/Resuable_widgets/custom_text_widget.dart';
import 'package:getxpractice/utils/app_assets_path.dart';
import 'package:getxpractice/utils/app_color.dart';
import 'package:getxpractice/utils/app_strings.dart';
import 'package:getxpractice/utils/constant.dart';
import 'package:getxpractice/view/Screens/core_module/payment_screens/card_details.dart';
import 'package:getxpractice/view/Screens/registration_module/splash_screen_module/splash_screen.dart';

import '../../../../Modular/auth/Models/PaymentModels/Get_Card_Model.dart';
import '../../../../Resuable_widgets/custom_app_button.dart';
import '../bottom_navibar_pages/Shopping_Cart/shoppingcart_controller.dart';

List<dynamic> temp = [];

class CheckOut extends StatefulWidget {
  Data? data;
  Product? product;

  CheckOut({this.data});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  void initState() {
    GetCardController.g.GetCard();
    for (int i = 0; i < AddToCartVM.sp.lst.length; i++) {
      temp.add(AddToCartVM.sp.lst[i].toJson());
    }

    super.initState();
  }

  bool isvalue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.BGAPPCOLOR,
      appBar: CustomAppBar(
        onTap: () {
          Get.back();
        },
        LeadingIconImage: AssetPaths.BACK_ICON,
        headingtitle: AppStrings.CHECKOUT_TEXT,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 25.w,
          right: 25.w,
        ),
        child: SingleChildScrollView(
          child: Container(
            height: 0.95.sh,
            child: Column(
              children: [
                _PaymentMethod(),
                SizedBox(
                  height: 10.h,
                ),
                GetBuilder<AddToCartVM>(
                  builder: (controller) => _ordersummarycontainer(),
                ),
                SizedBox(
                  height: 10.h,
                ),
                _PickUpLocation(),
                SizedBox(
                  height: 10.h,
                ),
                _Checkoutbtn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _ordersummarycontainer() {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.WHITE_COLOR,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: kDefaultPadding,
          left: kDefaultPadding,
          right: kDefaultPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 10,
              ),
              child: CustomTextWidget(
                  fontSize: 1.2.sp,
                  textColor: AppColor.BLACK_COLOR,
                  fontWeight: FontWeight.bold,
                  text: AppStrings.ORDER_SUMMARY_TEXT),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: kDefaultPadding, top: kDefaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 30.w,
                    // color: AppColor.FACEBOOK_COLOR,
                    child: CustomTextWidget(
                      text: AppStrings.QUANTITY_TEXT,
                      textColor: AppColor.BLACK_COLOR,
                      fontWeight: FontWeight.bold,
                      fontSize: 1.sp,
                    ),
                  ),
                  // SizedBox(
                  //   width: 10.h,
                  // ),
                  Container(
                    width: 140.w,
                    // color: AppColor.TEXT_BODY_COLOR,
                    child: CustomTextWidget(
                      text: AppStrings.PRODUCT_DETAILS_TEXT,
                      textColor: AppColor.BLACK_COLOR,
                      fontWeight: FontWeight.bold,
                      fontSize: 1.sp,
                    ),
                  ),
                  SizedBox(
                    width: 30.h,
                  ),
                  Container(
                    width: 60.w,
                    // color: AppColor.RED_COLOR,
                    child: CustomTextWidget(
                      text: AppStrings.PRICE_TEXT,
                      textColor: AppColor.BLACK_COLOR,
                      fontWeight: FontWeight.bold,
                      fontSize: 1.sp,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  // top: kDefaultPadding,
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                  bottom: 0),
              child: Container(
                height: 0.15.sh,
                child: ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true, //Added
                    itemCount: AddToCartVM.sp.lst.length,
                    itemBuilder: (BuildContext context, int index) {
                      print(
                          "title ############:${AddToCartVM.sp.lst[index].title}");
                      return Padding(
                        padding:
                            EdgeInsets.only(top: kDefaultPadding, bottom: 0),
                        child: Row(
                          children: [
                            /////////////////////////quantity///////////////////////////////////////
                            Column(
                              children: [
                                Container(
                                  height: 20.h,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: AppColor.SECONDARY_COLOR,
                                  ),
                                  child: Center(
                                      child: CustomTextWidget(
                                          fontSize: 1.sp,
                                          textColor: AppColor.WHITE_COLOR,
                                          fontWeight: FontWeight.bold,
                                          text: AddToCartVM
                                              .sp.lst[index].quantity
                                              .toString())),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            /////////////////////////product name///////////////////////////////////////
                            Container(
                              width: 140.w,
                              // color: Colors.black,
                              child: CustomTextWidget(
                                  fontSize: 1.2.sp,
                                  textColor: AppColor.SECONDARY_COLOR,
                                  fontWeight: FontWeight.bold,
                                  text: AddToCartVM.sp.lst[index].title ??
                                      AppStrings.LOADING_TEXT),
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            /////////////////////////price///////////////////////////////////////

                            Container(
                              child: CustomTextWidget(
                                  fontSize: 1.2.sp,
                                  textColor: AppColor.SECONDARY_COLOR,
                                  fontWeight: FontWeight.bold,
                                  text: AddToCartVM.sp.lst[index].price!
                                      .toStringAsFixed(2)),
                            ),
                          ],
                        ),
                      );
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
              margin: EdgeInsets.only(
                  left: kDefaultPadding, right: kDefaultPadding),
              // color: AppColor.DARK_GREY,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    fontSize: 1.2.sp,
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
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 40.h,
              margin: EdgeInsets.only(
                bottom: 20.h,
              ),
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
    ).addNeumorphism(bottomShadowColor: AppColor.GREY_COLOR.withOpacity(0.1));
  }

  Widget _Checkoutbtn() {
    return GetBuilder<ProductOrderController>(
        builder: (controller) => CustomAppBtn(
            onclickPressed: () {
              ProductOrderController.po.ProductOrder();

              // Get.toNamed(AppRouteName.HOME_PAGES_ROUTE);
            },
            title: AppStrings.CHECKOUT_TEXT));
  }

  Widget _PickUpLocation() {
    return GetBuilder<GetResController>(
      builder: (controller) => Container(
          height: 0.16.sh,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 3,
                blurRadius: 3,
                offset: const Offset(0, 1),
              )
            ],
            color: AppColor.WHITE_COLOR,
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.only(left: kDefaultPadding, right: 15.w),
          // color: AppColor.DARK_GREY,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    // color: AppColor.APP_DARK_COLOR,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          fontSize: 1.2.sp,
                          textColor: AppColor.BLACK_COLOR.withOpacity(0.9),
                          fontWeight: FontWeight.w700,
                          text: AppStrings.PICKUP_LOCATION_TEXT,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        box.read("GetResName") == AppStrings.ST_ANDREW_FULL_TEXT
                            ? CustomTextWidget(
                                fontSize: 1.1.sp,
                                textColor: AppColor.DARK_GREY,
                                fontWeight: FontWeight.w600,
                                text: AppStrings.ST_ANDREWS_CENTER,
                              )
                            : CustomTextWidget(
                                fontSize: 1.1.sp,
                                textColor: AppColor.DARK_GREY,
                                fontWeight: FontWeight.w600,
                                text: AppStrings.DOWNTOWN_PUBLIC_SQUARE,
                              ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomTextWidget(
                          fontSize: 0.8.sp,
                          textColor: AppColor.SECONDARY_COLOR.withOpacity(0.6),
                          fontWeight: FontWeight.bold,
                          text:
                              box.read("GetResName") ?? AppStrings.LOADING_TEXT,
                        )
                      ],
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 70.h,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: AppColor.SECONDARY_COLOR,
                            style: BorderStyle.solid),
                        shape: BoxShape.circle),
                    child: Center(
                      child: Image.asset(
                          height: 40.h, width: 30.w, AssetPaths.JOANIE_LOGO2),
                    ),
                  )),
            ],
          )),
    );
  }

  Widget _PaymentMethod() {
    if (GetCardController.g.getCardModel?.data == null) {
      return InkWell(
        onTap: () {
          Get.to(CardDetails());
        },
        child: Container(
            height: 0.15.sh,
            decoration: BoxDecoration(
                color: AppColor.WHITE_COLOR,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: const Offset(0, 1),
                  )
                ]),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(kDefaultPadding),
                child: CustomTextWidget(
                  text: "Sorry! No Card Found click to Select Card First",
                  textColor: AppColor.BLACK_COLOR,
                  fontWeight: FontWeight.bold,
                  fontSize: 1.2.sp,
                ),
              ),
            )),
      );
    } else {
      return GetBuilder<GetCardController>(
          builder: (controller) => Container(
                height: 0.15.sh,
                decoration: BoxDecoration(
                    color: AppColor.WHITE_COLOR,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 3,
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      )
                    ]),
                padding: EdgeInsets.only(left: kDefaultPadding, right: 15.w),
                // color: AppColor.DARK_GREY,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(
                          fontSize: 1.2.sp,
                          textColor: AppColor.BLACK_COLOR,
                          fontWeight: FontWeight.bold,
                          text: AppStrings.PAYMENT_METHOD_TEXT,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                            height: 40.h, width: 40.w, AssetPaths.STRIPE_ICON),
                        CustomTextWidget(
                          fontSize: 1.sp,
                          textColor: AppColor.BLACK_COLOR,
                          fontWeight: FontWeight.bold,
                          text: widget.data?.cardNumber.toString() ??
                              AppStrings.DEFAULT_CARD_TEXT,
                        ),
                        //  widget.data!.cardNumber.toString()
                      ],
                    ),
                  ],
                ),
              ));
    }
  }
}
