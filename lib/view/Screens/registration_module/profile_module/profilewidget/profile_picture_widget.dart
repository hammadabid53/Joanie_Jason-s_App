import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:getxpractice/utils/constant.dart';
import 'package:getxpractice/view/Screens/registration_module/profile_module/edit_profile_controller/edit_profile_controller.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../Resuable_widgets/custom_text_widget.dart';
import '../../../../../utils/api.dart';
import '../../../../../utils/app_assets_path.dart';
import '../../../../../utils/app_color.dart';
import '../../splash_screen_module/splash_screen.dart';

class ProfilePictureWidget extends StatelessWidget {
  bool isEditIconEnable;

  ProfilePictureWidget({required this.isEditIconEnable, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(
        builder: (controller) => Container(
              height: 100.h,
              width: 100.w,
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: EditProfileController.e.image == null
                          ? NetworkImageEDITPROFILE(
                              box.read("image") != null
                                  ? SharedApi().imageUrl + box.read("image")
                                  : "https://static.vecteezy.com/system/resources/thumbnails/002/002/403/small/man-with-beard-avatar-character-isolated-icon-free-vector.jpg",
                            )
                          : ClipOval(
                              child: Image.file(
                                EditProfileController.e.image!,
                              ),
                            )),
                  isEditIconEnable
                      ? Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: () {
                              print("camera clicked");
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) => bottomsheet(context));
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                color: AppColor.SECONDARY_COLOR,
                                shape: BoxShape.circle,
                              ),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 15,
                                    width: 15,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(AssetPaths.EDIT_PROFILE),
                                  )),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ).addNeumorphism(
                bottomShadowColor: AppColor.GREY_COLOR.withOpacity(0.1)));
  }

  bottomsheet(BuildContext context) {
    return GetBuilder<EditProfileController>(
        builder: (controller) => Container(
              height: 0.30.sh,
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                children: [
                  CustomTextWidget(
                    text: "Choose Profile Photo",
                    fontSize: 2.sp,
                    textColor: AppColor.BLACK_COLOR,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          print("gallery");
                          EditProfileController.e
                              .takePhoto(ImageSource.gallery);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.image, color: AppColor.SECONDARY_COLOR),
                            SizedBox(
                              height: 5.h,
                            ),
                            CustomTextWidget(
                              text: "Image",
                              fontSize: 2.sp,
                              textColor: AppColor.BLACK_COLOR,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 50.w,
                      ),
                      InkWell(
                        onTap: () {
                          print("camera");
                          EditProfileController.e.takePhoto(ImageSource.camera);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera,
                              color: AppColor.SECONDARY_COLOR,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            CustomTextWidget(
                              text: "Camera",
                              fontSize: 2.sp,
                              textColor: AppColor.BLACK_COLOR,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ));
  }

  // Widget shimmerAvatar(double width, double height) => Shimmer.fromColors(
  //       baseColor: AppColor.DARK_GREY,
  //       highlightColor: AppColor.WHITE_COLOR,
  //       child: Container(
  //         width: width,
  //         height: height,
  //         color: Colors.black,
  //       ),
  //     );

  Widget NetworkImageEDITPROFILE(String backgroundImage) {
    return CachedNetworkImage(
      color: AppColor.DARK_BROWN_COLOR,
      imageUrl: backgroundImage,
      imageBuilder: (context, imageProvider) => Container(
        margin: EdgeInsets.only(left: 5.w, top: 5.w),
        decoration: BoxDecoration(
          shape: BoxShape.circle,

          // borderRadius: BorderRadius.circular(50.0),
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
