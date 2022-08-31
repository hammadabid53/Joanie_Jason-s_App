import 'package:bot_toast/bot_toast.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:getxpractice/utils/app_Binding.dart';
import 'package:getxpractice/utils/app_color.dart';
import 'package:getxpractice/utils/app_route.dart';
import 'package:getxpractice/utils/app_strings.dart';

import 'dart:io';

import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

////////////////#######################################////////////////////////////////////
void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // HttpOverrides.global = MyHttpOverrides();

  // CountryCodes.init();
  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (context, child) {
          return GetMaterialApp(
            transitionDuration: 400.milliseconds,
            defaultTransition: Transition.rightToLeftWithFade,
            debugShowCheckedModeBanner: false,
            title: AppStrings.APP_TITLE_TEXT,
            onGenerateRoute: AppRouter().onGenerateRoute,
            builder: BotToastInit(),
            navigatorObservers: [BotToastNavigatorObserver()],
            //initialRoute: '/',
            initialBinding: AppBinding(),
            theme: ThemeData(
                scaffoldBackgroundColor: AppColor.BGAPPCOLOR, //
                //  fontFamily: PlayFairDisplay,
                textTheme: GoogleFonts.playfairDisplayTextTheme()),
            // getPages: [
            //   GetPage(name: '/', page: () => ),
            // ],
          );
        });
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
