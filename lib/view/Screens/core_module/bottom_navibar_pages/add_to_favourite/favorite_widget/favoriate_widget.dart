import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:getxpractice/utils/api.dart';
import 'package:getxpractice/utils/constant.dart';

import '../../../../../../Modular/auth/Controllers.dart/CoreController/Favorites_Controller/Add_Remove_Fav/Add_Remove_Controller.dart';
import '../../../../../../Resuable_widgets/custom_text_widget.dart';
import '../../../../../../utils/app_assets_path.dart';
import '../../../../../../utils/app_color.dart';

class FavoriateListContainer extends StatelessWidget {
  String? title, discription, id;
  String image;
  void Function()? onTap;

  FavoriateListContainer(
      {this.onTap,
      required this.image,
      this.discription,
      this.title,
      this.id,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: kDefaultPadding),
        height: 0.20.sh,
        // width: 1.sw,
        decoration: BoxDecoration(
          color: AppColor.WHITE_COLOR,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(kDefaultPadding),
              child: Row(
                children: [
                  FavListImage(SharedApi().imageUrl + image),
                  SizedBox(
                    width: 5.w,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(left: 5.w),
                      height: 0.15.sh,
                      width: 0.35.sw,
                      decoration: BoxDecoration(
                        // color: AppColor.BLACK_COLOR,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: title,
                            textColor: AppColor.BLACK_COLOR,
                            fontWeight: FontWeight.bold,
                          ),
                          CustomTextWidget(
                            text: discription,
                            fontSize: 0.8.sp,
                            textColor: AppColor.DARK_BROWN_COLOR,
                            fontWeight: FontWeight.w600,
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(left: 5.w),
                      height: 0.15.sh,
                      width: 0.40.sw,
                      decoration: BoxDecoration(
                        // color: AppColor.BLACK_COLOR,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget(
                              fontSize: 1.2.sp,
                              textColor: AppColor.SECONDARY_COLOR,
                              fontWeight: FontWeight.bold,
                              text: id),
                          GetBuilder<AddRemoveFavoritesController>(
                              builder: (controller) => InkWell(
                                    onTap: onTap,
                                    child: Container(
                                        child: Image.asset(
                                      scale: 3.sp,
                                      AssetPaths.LIKE_ICON,
                                      color: AppColor.RED_COLOR,
                                    )),
                                  ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget FavListImage(String backgroundImage) {
    return CachedNetworkImage(
      color: AppColor.DARK_BROWN_COLOR,
      imageUrl: backgroundImage,
      imageBuilder: (context, imageProvider) => Container(
        margin: EdgeInsets.only(top: 5.w),
        height: 0.15.sh,
        width: 0.30.sw,
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
