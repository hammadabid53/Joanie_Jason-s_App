import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getxpractice/Modular/auth/Models/CoreModuleModels/GetRestuarant/GetResModel.dart';

import 'package:getxpractice/Resuable_widgets/custom_text_widget.dart';
import 'package:getxpractice/utils/api.dart';
import 'package:getxpractice/utils/app_assets_path.dart';
import 'package:getxpractice/utils/app_color.dart';
import 'package:getxpractice/utils/app_strings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:getxpractice/utils/constant.dart';

import '../../../../../Modular/auth/Controllers.dart/CoreController/GetAllCategories/Get_All_Categories_Controller.dart';

import 'Get_Sub_Categories/Get_sub_Categories.dart';

class GetAllRestaurant extends StatefulWidget {
  Resturant? resturant;
  GetAllRestaurant({this.resturant});

  @override
  State<GetAllRestaurant> createState() => _GetAllRestaurantState();
}

class _GetAllRestaurantState extends State<GetAllRestaurant> {
  @override
  void initState() {
    GetAllCatController.g.GetAllCat(widget.resturant!.id!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetAllCatController>(
        builder: (controller) => Padding(
            padding: EdgeInsets.all(kDefaultPadding),
            child: Column(
              children: [_productgridview()],
            )));
  }

// Shimmer.fromColors(
  //     baseColor: AppColor.WHITE_COLOR,
  ///    highlightColor: AppColor.DARK_GREY,
  //   enabled: _enabled,
  Widget _productgridview() {
    if (GetAllCatController.g.getAllCategories == null) {
      return Expanded(
          child: Container(
        child: Center(
          child: CustomTextWidget(
            text: "No List Found",
            fontSize: 1.2.sp,
            fontWeight: FontWeight.bold,
            textColor: AppColor.BLACK_COLOR,
          ),
        ),
      ));
    } else {
      return GetAllCatController.g.getAllCategories?.category?.length == 0
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
          : GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
              ),
              itemCount:
                  GetAllCatController.g.getAllCategories?.category?.length ?? 0,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Get.to(GetSubCategories(GetAllCatController
                          .g.getAllCategories!.category![index]));

                      print(
                          "id${GetAllCatController.g.getAllCategories!.category![index]}");
                    },
                    child: Container(
                        padding: EdgeInsets.only(
                            top: 10.h, bottom: 5.h, left: 20.w, right: 20.w),
                        decoration: BoxDecoration(
                            color: AppColor.WHITE_COLOR,
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              )
                            ]),
                        child: Column(
                          children: [
                            SharedApi().imageUrl +
                                        GetAllCatController.g.getAllCategories!
                                            .category![index].catImage! !=
                                    null
                                ? CachedNetworkImage(
                                    imageUrl: SharedApi().imageUrl +
                                        GetAllCatController.g.getAllCategories!
                                            .category![index].catImage!,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                            height: 0.12.sh,
                                            decoration: BoxDecoration(
                                                // color: AppColor.RED_COLOR,
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    scale: 2.sp,
                                                    image: imageProvider))),
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(
                                      color: AppColor.DARK_BROWN_COLOR,
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  )
                                : Image(
                                    image: AssetImage(AssetPaths.ALERT_ICON)),
                            SizedBox(
                              height: 10.h,
                            ),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: GetAllCatController.g.getAllCategories!
                                            .category![index].title !=
                                        null
                                    ? CustomTextWidget(
                                        text: GetAllCatController
                                            .g
                                            .getAllCategories!
                                            .category![index]
                                            .title,
                                        fontWeight: FontWeight.w600,
                                        textColor: AppColor.BLACK_COLOR,
                                        fontSize: 1.0.sp,
                                      )
                                    : CustomTextWidget(
                                        text: AppStrings.DEFAULT_CARD_TEXT,
                                        fontWeight: FontWeight.w600,
                                        textColor: AppColor.BLACK_COLOR,
                                        fontSize: 1.0.sp,
                                      )),
                          ],
                        )));
                // );
              });
    }
  }
}
