import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../Modular/auth/Controllers.dart/AuthController/AuthController.dart';
import '../../../../Resuable_widgets/custom_forground_logo_widget.dart';
import '../../../../utils/app_assets_path.dart';
import 'package:get_storage/get_storage.dart';

GetStorage box = GetStorage('myData');

class SplashScreen extends StatefulWidget {
  final Widget? child;
  const SplashScreen({this.child, Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    box;
    AuthController.i.autoLogin();

    // onDoneLoading();
    // _splashTimer();
  }

  AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        builder: (controller) => Container(
              width: 1.sw,
              height: 1.sh,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AssetPaths.APP_BACKGROUND_IMAGE),
                      fit: BoxFit.cover)),
              child: Center(child: _centerapplogo()),
            ));
  }

  Widget _centerapplogo() {
    return CustomForegroundLogoWidget(
      logoWidth: 0.50.sw,
      logoHeight: 0.50.sh,
      animation: true,
    );
  }

  // Future<Timer> _splashTimer() async {
  //   return Timer(const Duration(seconds: 3), _switchToNextScreen);
  // }

  // void _switchToNextScreen() async {
  //   // Get.offAndToNamed(AppRouteName.SOCIAL_LOGIN_SCREEN_ROUTE);
  //   AuthController.i.autoLogin();
  // }

  Future<Timer> init() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  onDoneLoading() async {
    if (box.read('user_token') != null) {
     
      print(box.read('user_token'));

      print("my token${token}");
    }
  }
}
