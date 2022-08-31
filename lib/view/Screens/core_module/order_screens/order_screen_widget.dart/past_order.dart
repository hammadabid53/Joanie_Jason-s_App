import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getxpractice/Modular/auth/Controllers.dart/CoreController/PastOrderController/PastOrderController.dart';
import 'package:getxpractice/utils/constant.dart';

import '../../../../../Resuable_widgets/custom_text_widget.dart';
import '../../../../../utils/api.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/app_strings.dart';

class PastOrder extends StatefulWidget {
  const PastOrder({Key? key}) : super(key: key);

  @override
  State<PastOrder> createState() => _PastOrderState();
}

class _PastOrderState extends State<PastOrder> {
  
  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PastOrderController.p.pastOrderModel?.orders == null
        ? Expanded(
            child: Container(
            child: Center(
              child: CustomTextWidget(
                text: "No orders Get",
                fontSize: 1.sp,
                fontWeight: FontWeight.bold,
                textColor: AppColor.BLACK_COLOR,
              ),
            ),
          ))
        : ListView.builder(
            shrinkWrap: true, //Added
            itemCount: PastOrderController.p.pastOrderModel?.orders?.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(children: [
                Container(
                        margin: EdgeInsets.only(top: kDefaultPadding),
                        height: 0.18.sh,
                        width: 1.sw,
                        decoration: BoxDecoration(
                          color: AppColor.WHITE_COLOR,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(kDefaultPadding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PastOrderNetworkImage(SharedApi().imageUrl +
                                  PastOrderController.p.orders![index]
                                      .products![index].id!.prodImage!),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextWidget(
                                    fontSize: 1.sp,
                                    text: PastOrderController.p.orders?[index]
                                            .products?[index].id!.title ??
                                        AppStrings.LOADING_TEXT,
                                    textColor: AppColor.BLACK_COLOR,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  CustomTextWidget(
                                    text: AppStrings.FRESH_BROWED_COFFEE_TEXT,
                                    fontSize: 0.8.sp,
                                    textColor: AppColor.DARK_GREY,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  CustomTextWidget(
                                    text:
                                        PastOrderController.p.dateList[index] ??
                                            AppStrings.LOADING_TEXT,
                                    fontSize: 0.8.sp,
                                    textColor: AppColor.DARK_GREY,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ],
                              ),
                              Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomTextWidget(
                                      text: PastOrderController.p.orders?[index]
                                              .products?[index].id?.price
                                              .toString() ??
                                          AppStrings.LOADING_TEXT,
                                      fontSize: 1.5.sp,
                                      textColor: AppColor.DARK_BROWN_COLOR,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ))
                    .addNeumorphism(
                        blurRadius: 0.5,
                        spreadradius: 0.1,
                        offset: Offset(0, 15),
                        bottomShadowColor:
                            AppColor.GREY_COLOR.withOpacity(0.02))
              ]);
            });
  }

  Widget PastOrderNetworkImage(String backgroundImage) {
    return CachedNetworkImage(
      color: AppColor.DARK_BROWN_COLOR,
      imageUrl: backgroundImage,
      imageBuilder: (context, imageProvider) => Container(
        margin: EdgeInsets.only(left: 5.w, top: 5.w),
        height: 0.15.sh,
        width: 0.25.sw,
        decoration: BoxDecoration(
          // color: AppColor.RED_COLOR,
          borderRadius: BorderRadius.circular(30.0),
          image: DecorationImage(fit: BoxFit.cover, image: imageProvider),
        ),
      ),
      placeholder: (context, url) => Center(
          child: CircularProgressIndicator(
        color: AppColor.DARK_BROWN_COLOR,
      )),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
