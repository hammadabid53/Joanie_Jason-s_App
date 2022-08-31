import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:getxpractice/utils/api.dart';
import 'package:getxpractice/utils/app_color.dart';
import 'package:getxpractice/utils/app_strings.dart';
import 'package:getxpractice/utils/constant.dart';

import '../../../../../Modular/auth/Controllers.dart/AuthController/AuthController.dart';
import '../../../../../Resuable_widgets/custom_app_button.dart';
import '../../../../../utils/app_assets_path.dart';
import '../../../../../utils/app_route_name.dart';
import '../../../registration_module/profile_module/profilewidget/profile_textfield_widget.dart';
import '../../../registration_module/splash_screen_module/splash_screen.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  bool istrue = true;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) => Padding(
              padding: EdgeInsets.all(kDefaultPadding),
              child: Column(
                children: [
                  CircularEditprofile(),
                  ProfileTextFields(
                    readonly: true,
                    hinttext: box.read("name") ?? AppStrings.LOADING_TEXT,
                    // AuthController.i.username ?? AppStrings.LOADING_TEXT,
                    obsecureText: false,
                    title: AppStrings.NAME_HINT_TEXT,
                  ),
                  ProfileTextFields(
                    readonly: true,
                    hinttext: box.read("email") ?? AppStrings.LOADING_TEXT,
                    //AuthController.i.email ?? AppStrings.LOADING_TEXT,
                    obsecureText: false,
                    title: AppStrings.EMAIL_HINT_TEXT,
                  ),
                  if (box.read("issocialshowdata") == true)
                    ProfileTextFields(
                      readonly: true,
                      hinttext: box.read("phone") != null
                          ? box.read("phone").toString()
                          : AppStrings.LOADING_TEXT,
                      obsecureText: false,
                      title: AppStrings.PHONE_TEXT,
                    ),
                  if (box.read("issocialshowdata") == true)
                    ProfileTextFields(
                      readonly: true,
                      hinttext: AppStrings.PASSWORD_HIDDEN_TEXT,
                      obsecureText: false,
                      title: AppStrings.PASSWORD_HINT_TEXT,
                    ),
                  _EditProfile()
                ],
              ),
            ));
  }

  Widget _EditProfile() {
    return CustomAppBtn(
        onclickPressed: () async {
          Get.toNamed(AppRouteName.EDIT_PROFILE_ROUTE);
        },
        title: AppStrings.EDIT_PROFILE_TEXT);
  }

  Widget CircularEditprofile() {
    return Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(),
            child: Align(
                alignment: Alignment.center,
                child: box.read("image") != null
                    ? ProfileNetworkImage(
                        SharedApi().imageUrl + box.read("image"))
                    : Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            // color: AppColor.DARK_BROWN_COLOR,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                scale: 3.sp,
                                image: AssetImage(
                                    AssetPaths.PROFILE_IMAGE_ICON))))))
        .addNeumorphism(
            bottomShadowColor: AppColor.GREY_COLOR.withOpacity(0.1));
  }

  Widget ProfileNetworkImage(String backgroundImage) {
    return CachedNetworkImage(
      color: AppColor.DARK_BROWN_COLOR,
      imageUrl: backgroundImage,
      imageBuilder: (context, imageProvider) => Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
              color: AppColor.DARK_BROWN_COLOR,
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover, scale: 3.sp, image: imageProvider))),
      placeholder: (context, url) => Center(
          child: CircularProgressIndicator(
        color: AppColor.DARK_BROWN_COLOR,
      )),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
