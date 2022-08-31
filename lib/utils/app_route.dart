import 'package:flutter/material.dart';
import 'package:getxpractice/utils/app_route_name.dart';
import 'package:getxpractice/view/Screens/core_module/contact_us_screen/contactus.dart';
import 'package:getxpractice/view/Screens/core_module/home_menu_module/Home_menu.dart';
import 'package:getxpractice/view/Screens/core_module/order_screens/order_screen/order.dart';
import 'package:getxpractice/view/Screens/core_module/payment_screens/card_details.dart';
import 'package:getxpractice/view/Screens/core_module/selection_store/choose_store.dart';
import 'package:getxpractice/view/Screens/core_module/settings_screen/settings.dart';
import 'package:getxpractice/view/Screens/core_module/sucess_screen/sucess_screen.dart';
import 'package:getxpractice/view/Screens/registration_module/login_module/login_screen/Login.dart';
import 'package:getxpractice/view/Screens/registration_module/otp_module/otp_screen/otpscreen.dart';
import 'package:getxpractice/view/Screens/registration_module/password_module/change_password_screen/change_password.dart';
import 'package:getxpractice/view/Screens/registration_module/password_module/forgot_password_screen/forget_password.dart';
import 'package:getxpractice/view/Screens/registration_module/policy_pages/privacy_policy.dart';
import 'package:getxpractice/view/Screens/registration_module/policy_pages/terms&condition.dart';
import 'package:getxpractice/view/Screens/registration_module/profile_module/edit_profile_screen/edit_profile.dart';
import 'package:getxpractice/view/Screens/registration_module/signup_module/signup_screen/sign_up.dart';
import 'package:getxpractice/view/Screens/registration_module/social_login_module/social_login.dart';
import 'package:getxpractice/view/Screens/registration_module/splash_screen_module/splash_screen.dart';
import 'package:getxpractice/view/Screens/registration_module/update_password/update_password_screen/update_password.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (BuildContext context) {
        switch (routeSettings.name) {
          case AppRouteName.SPLASH_SCREEN_ROUTE:
            return const SplashScreen();

          case AppRouteName.SOCIAL_LOGIN_SCREEN_ROUTE:
            return const SocialLogin();

          case AppRouteName.LOGIN_SCREEN_ROUTE:
            return LoginScreen();

          case AppRouteName.SIGNUP_SCREEN_ROUTE:
            return Signup();

          case AppRouteName.FORGOT_PASSWORD_SCREEN_ROUTE:
            return ForgotPassword();

          case AppRouteName.SUCESS_SCREEN_ROUTE:
            return const SuccessScreen();

          case AppRouteName.OTP_VERFICATION_ROUTE:
            return const OtpScreen();
          case AppRouteName.EDIT_PROFILE_ROUTE:
            return const EditProfile();
          case AppRouteName.UPDATE_PASSWORD_ROUTE:
            return UpdatePassword();

          case AppRouteName.CHOOSE_STORE_ROUTE:
            return const ChooseStore();
          case AppRouteName.HOME_PAGES_ROUTE:
            return HOME_MENU_PAGES();

          case AppRouteName.PRIVACY_POLICY_ROUTE:
            return const PrivacyPolicy();
          case AppRouteName.TERMS_AND_CONDTION_ROUTE:
            return const TermsandCondition();
          case AppRouteName.CONTACT_US_ROUTE:
            return const ContactUs();
          case AppRouteName.ORDERS_ROUTE:
            return const Orderscreen();
          case AppRouteName.SETTINGS_ROUTE:
            return const Settings();
          // case AppRouteName.CHECKOUT_ROUTE:
          //   return  CheckOut();
          // case AppRouteName.SHOPPING_CART_ROUTE:
          //   return const ShoppingCart();
          case AppRouteName.CHANGE_PASSWORD_ROUTE:
            return ChangePassword();
          case AppRouteName.CARD_DETAILS_ROUTE:
            return CardDetails();

          default:
            return Container();
        }
      },
    );
  }
}
