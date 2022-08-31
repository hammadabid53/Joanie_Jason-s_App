import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getxpractice/Modular/auth/Controllers.dart/CoreController/Get_Single_Product_Controller/Get_Single_Product_Controller.dart';
import 'package:getxpractice/Modular/auth/Models/CoreModuleModels/Get_Product/Get_Product_model.dart';
import 'package:getxpractice/Resuable_widgets/bot_toast/error_message.dart';
import 'package:getxpractice/Resuable_widgets/custom_snackbar.dart';

import 'package:getxpractice/Resuable_widgets/custom_text_widget.dart';
import 'package:getxpractice/utils/api.dart';
import 'package:getxpractice/utils/app_assets_path.dart';
import 'package:getxpractice/utils/app_color.dart';
import 'package:getxpractice/utils/app_strings.dart';
import 'package:getxpractice/utils/constant.dart';
import 'package:getxpractice/view/Screens/core_module/bottom_navibar_pages/Shopping_Cart/shopping_cart.dart';

import '../../../../../../../../Resuable_widgets/appbar.dart/custom_appbar.dart';
import '../../../../../../../../Resuable_widgets/custom_app_button.dart';
import '../../../../Shopping_Cart/shoppingcart_controller.dart';

double calprice = 0;
int quantity = 1;

class SingleProductDetails extends StatefulWidget {
  Data product;
  SingleProductDetails(this.product);

  @override
  State<SingleProductDetails> createState() => _SingleProductDetailsState();
}

class _SingleProductDetailsState extends State<SingleProductDetails> {
  @override
  void initState() {
    GetSingleProductController.sp
        .GetSingleProduct(widget.product.id!.toString());
    quantity = 0;
    calprice = 0;
    super.initState();
  }

  bool isUnique = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            onTap: () {
              Get.back();
            },
            LeadingIconImage: AssetPaths.BACK_ICON,
            headingtitle: widget.product.title ?? AppStrings.DEFAULT_CARD_TEXT
            // Get.arguments['product_title'] ?? AppStrings.LOADING_TEXT

            ),
        body: GetBuilder<GetSingleProductController>(
            builder: (controller) =>
                GetSingleProductController.sp.singleProductDetailsModel == null
                    ? Container()
                    : Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(kDefaultPadding),
                            child: Column(
                              children: [
                                _centerimage(SharedApi().imageUrl +
                                    widget.product.prodImage!),
                                SizedBox(
                                  height: 10.h,
                                ),
                                _bottompart(
                                  widget.product.title ??
                                      AppStrings.LOADING_TEXT,
                                  calprice.toStringAsFixed(2),
                                  widget.product.description ??
                                      AppStrings.LOADING_TEXT,
                                ),
                                addtocart(),
                                SizedBox(
                                  height: 10.h,
                                ),
                                _ordernowBtn(),
                              ],
                            ),
                          )
                        ],
                      )));
  }

  Widget _centerimage(String backgroundImage) {
    return CachedNetworkImage(
      imageUrl: backgroundImage,
      imageBuilder: (context, imageProvider) => Container(
        height: 180.h,
        decoration: BoxDecoration(
            image: DecorationImage(scale: 1.sp, image: imageProvider),
            color: AppColor.BLACK_COLOR,
            shape: BoxShape.circle),
      ),
      placeholder: (context, url) => CircularProgressIndicator(
        color: AppColor.DARK_BROWN_COLOR,
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }

  Widget _bottompart(
    String title,
    String price,
    String discription,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextWidget(
          text: title,
          fontWeight: FontWeight.bold,
          textColor: AppColor.BLACK_COLOR,
          fontSize: 2.sp,
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomTextWidget(
          text: discription,
          textColor: AppColor.BLACK_COLOR,
          fontSize: 1.sp,
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomTextWidget(
          text: price,
          textColor: AppColor.BLACK_COLOR,
          fontWeight: FontWeight.bold,
          fontSize: 1.6.sp,
        ),
        SizedBox(
          height: 10.h,
        ),
        Card(
          color: AppColor.DARK_BROWN_COLOR,
          child: SizedBox(
              height: 50.h,
              width: 140.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColor.PRIMARY_COLOR,
                    child: IconButton(
                      color: AppColor.SECONDARY_COLOR,
                      icon: Center(child: const Icon(Icons.remove)),
                      onPressed: () {
                        setState(() {
                          if (quantity > 0) quantity--;
                          calprice = (widget.product.price)! * (quantity);
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10.h,
                  ),
                  CustomTextWidget(
                    text: quantity.toString(),
                    fontSize: 2.sp,
                    textColor: AppColor.PRIMARY_COLOR,
                  ),
                  SizedBox(
                    width: 10.h,
                  ),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColor.PRIMARY_COLOR,
                    child: IconButton(
                      color: AppColor.SECONDARY_COLOR,
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          if (quantity >= 0) quantity++;
                          calprice = (widget.product.price)! * (quantity);
                        });
                      },
                    ),
                  ),
                ],
              )),
        ),
        SizedBox(
          height: 5.h,
        ),
        CustomTextWidget(
          text: AppStrings.QUANTITY_TEXT,
          textColor: AppColor.BLACK_COLOR,
          fontWeight: FontWeight.bold,
          fontSize: 1.5.sp,
        ),
      ],
    );
  }

  Widget addtocart() {
    return GetBuilder<AddToCartVM>(
        init: AddToCartVM(),
        builder: (controller) => Card(
            shape: StadiumBorder(
              side: BorderSide(
                // color: AppColor.SECONDARY_COLOR,
                width: 2.0,
              ),
            ),
            color: AppColor.DARK_BROWN_COLOR,
            child: Container(
              // height: 50.h,
              width: 140.w,
              child: TextButton(
                child: const Text(
                  'Add Item',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  for (int i = 0; i < AddToCartVM.sp.lst.length; i++) {
                    if (AddToCartVM.sp.lst[i].id == widget.product.id!) {
                      isUnique = false;
                      setState(() {
                        AddToCartVM.sp.lst[i].price =
                            (AddToCartVM.sp.lst[i].price)! + (calprice);

                        AddToCartVM.sp.lst[i].quantity =
                            (AddToCartVM.sp.lst[i].quantity)! + (quantity);

                        // AddToCartVM.sp.lst[i].quantity += quantity;
                      });
                    }
                  }
                  if (isUnique == true) {
                    if (quantity == 0 && calprice == 0) {
                      showErrorMessage("please add atleast 1 quantity");
                    } else {
                      AddToCartVM.sp.add(
                          widget.product.title!,
                          widget.product.prodImage!,
                          calprice,
                          widget.product.id!,
                          quantity);
                      customSnackBar("product added successfully", "Congrats");
                    }
                  }

                  print("clicked");

                  print("ye list h ");
                  print(widget.product.prodImage!);
                  print(calprice);
                  print(widget.product.id!);
                  print(widget.product.title!);
                  print(quantity);

                  AddToCartVM.sp.subtotal();
                },
              ),
            )));
  }

  Widget _ordernowBtn() {
    return GetBuilder<GetSingleProductController>(
        builder: (controller) => CustomAppBtn(
            onclickPressed: () {
              Get.to(ShoppingCart(
                isshow: true,
              ));
              // Get.toNamed(AppRouteName.SHOPPING_CART_ROUTE);
              setState(() {
                quantity = 1;
                calprice = 0;
              });
            },
            title: AppStrings.ORDER_NOW_TEXT));
  }
}
