import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getxpractice/Modular/auth/Controllers.dart/AuthController/AuthController.dart';

import 'package:getxpractice/view/Screens/registration_module/profile_module/edit_profile_controller/edit_profile_controller.dart';
import 'package:getxpractice/utils/app_assets_path.dart';

import 'package:getxpractice/utils/app_route_name.dart';
import 'package:getxpractice/utils/app_strings.dart';
import 'package:getxpractice/utils/constant.dart';

import '../../../../../Resuable_widgets/appbar.dart/custom_appbar.dart';
import '../../../../../Resuable_widgets/custom_app_button.dart';

import '../../splash_screen_module/splash_screen.dart';
import '../profilewidget/profile_picture_widget.dart';
import '../profilewidget/profile_textfield_widget.dart';

// File? image;
// PickedFile? _imageFile;
// final ImagePicker imagePicker = ImagePicker();
TextEditingController username = TextEditingController();

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  void initState() {
    AuthController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          onTap: () {
            Get.toNamed(AppRouteName.HOME_PAGES_ROUTE);
          },
          LeadingIconImage: AssetPaths.BACK_ICON,
          headingtitle: AppStrings.EDIT_PROFILE_TEXT,
        ),
        body: Padding(
            padding: EdgeInsets.all(kDefaultPadding),
            child: SingleChildScrollView(
                child: GetBuilder<AuthController>(
              builder: (controller) => Column(
                children: [
                  ProfilePictureWidget(
                    isEditIconEnable: true,
                  ),
                  ProfileTextFields(
                    readonly: false,
                    controller: username
                      ..text = box.read("name") ?? AppStrings.LOADING_TEXT,
                    obsecureText: false,
                    title: AppStrings.NAME_HINT_TEXT,
                  ),
                  ProfileTextFields(
                    readonly: true,
                    hinttext: box.read("email") ?? AppStrings.LOADING_TEXT,
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
                  CustomAppBtn(
                      title: AppStrings.SAVE_TEXT,
                      onclickPressed: () async {
                        print("click");
                        await EditProfileController.e.uploadImage();
                        print(username.text + ' ye username h');
                      })
                ],
              ),
            ))));
  }
}

//var split = string.split(' ');