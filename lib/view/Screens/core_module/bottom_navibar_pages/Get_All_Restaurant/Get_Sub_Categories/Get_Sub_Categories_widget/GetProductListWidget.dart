import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getxpractice/utils/constant.dart';

import '../../../../../../../Modular/auth/Controllers.dart/CoreController/Get_Product_Controller/Get_Product_Controller.dart';
import '../../../../../../../Resuable_widgets/custom_text_widget.dart';
import '../../../../../../../utils/api.dart';
import '../../../../../../../utils/app_assets_path.dart';
import '../../../../../../../utils/app_color.dart';
import '../../../../../../../utils/app_strings.dart';
import 'Get_Single_Product_Detail/Get_Single_Product_Detail.dart';

class GetProductListWidget extends StatefulWidget {
  Color? color;
  GetProductListWidget({this.color, Key? key}) : super(key: key);

  @override
  State<GetProductListWidget> createState() => _GetProductListWidgetState();
}

class _GetProductListWidgetState extends State<GetProductListWidget> {
  @override
  void initState() {
    // if (GetProductController.p.data != null) {
    //   for (int i = 0; i < GetProductController.p.data!.length; i++) {
    //     //isfavourite.add[i] = false;
    //     isfavourite.add(AppColor.BLACK_COLOR);
    //   }
    // }

    print('Bool list Length' + isfavourite.length.toString());
    super.initState();
  }

  List<Color> isfavourite = [];

  @override
  Widget build(BuildContext context) {
    return GetProductController.p.data == null
        ? Expanded(
            child: Container(
            child: Center(
              child: CustomTextWidget(
                text: "No List Found",
                fontSize: 1.2.sp,
                fontWeight: FontWeight.bold,
                textColor: AppColor.BLACK_COLOR,
              ),
            ),
          ))
        : Expanded(
            child: ListView.builder(
                shrinkWrap: true, //Added
                itemCount: GetProductController.p.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap: () {
                        Get.to(
                          SingleProductDetails(GetProductController
                              .p.getProductModel!.data![index]),
                        );
                      },
                      child: Container(
                              margin: EdgeInsets.only(
                                  top: kDefaultPadding,
                                  left: kDefaultPadding,
                                  right: kDefaultPadding),
                              height: 0.20.sh,
                              width: 1.sw,
                              decoration: BoxDecoration(
                                color: AppColor.WHITE_COLOR,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: _CachedNetworkImage(
                                              SharedApi().imageUrl +
                                                  GetProductController
                                                      .p
                                                      .getProductModel!
                                                      .data![index]
                                                      .prodImage!),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            margin: EdgeInsets.only(left: 5.w),
                                            height: 0.15.sh,
                                            width: 0.40.sw,
                                            decoration: BoxDecoration(
                                              // color: AppColor.BLACK_COLOR,
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                CustomTextWidget(
                                                  text: GetProductController
                                                          .p
                                                          .getProductModel!
                                                          .data![index]
                                                          .title ??
                                                      AppStrings.LOADING_TEXT,
                                                  textColor:
                                                      AppColor.BLACK_COLOR,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                CustomTextWidget(
                                                  text: GetProductController
                                                          .p
                                                          .getProductModel!
                                                          .data![index]
                                                          .description ??
                                                      AppStrings.LOADING_TEXT,
                                                  fontSize: 1.0.sp,
                                                  textColor:
                                                      AppColor.BLACK_COLOR,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                                CustomTextWidget(
                                                  text: GetProductController
                                                              .p
                                                              .getProductModel!
                                                              .data![index]
                                                              .price!
                                                              .toStringAsFixed(
                                                                  2) !=
                                                          null
                                                      ? GetProductController
                                                          .p
                                                          .getProductModel!
                                                          .data![index]
                                                          .price
                                                          ?.toStringAsFixed(2)
                                                      : AppStrings.LOADING_TEXT,
                                                  fontSize: 1.2.sp,
                                                  textColor:
                                                      AppColor.DARK_BROWN_COLOR,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            // isfavourite[index] =
                                            //     AppColor.RED_COLOR;
                                            GetProductController.p
                                                .toogle(index);
                                          },
                                          child: Container(
                                              margin: EdgeInsets.only(
                                                  right: kDefaultPadding,
                                                  top: 60.h),
                                              child: Image.asset(
                                                  scale: 3.sp,
                                                  AssetPaths.LIKE_ICON,
                                                  color:
                                                      // box.read("favlist") !=
                                                      //         null

                                                      GetProductController
                                                              .p
                                                              .data![index]
                                                              .favourite!
                                                              .isNotEmpty
                                                          ? AppColor.RED_COLOR
                                                          : AppColor
                                                              .GREY_COLOR)),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ))
                          .addNeumorphism(
                              blurRadius: 0.5,
                              spreadradius: 0.1,
                              offset: Offset(0, 15),
                              bottomShadowColor:
                                  AppColor.GREY_COLOR.withOpacity(0.02)));
                }));
  }
}

Widget _CachedNetworkImage(String backgroundImage) {
  return CachedNetworkImage(
    color: AppColor.DARK_BROWN_COLOR,
    imageUrl: backgroundImage,
    imageBuilder: (context, imageProvider) => Container(
      margin: EdgeInsets.only(left: 5.w, top: 5.w),
      height: 0.15.sh,
      width: 0.40.sw,
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
