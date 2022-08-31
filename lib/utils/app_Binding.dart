import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxpractice/Modular/auth/Controllers.dart/PaymentController/Add_Card_Controller.dart';
import 'package:getxpractice/Modular/auth/Controllers.dart/PaymentController/Get_Card_Controller.dart';
import 'package:getxpractice/utils/validations/forgot_validation.dart/forgot_validation.dart';
import 'package:getxpractice/utils/validations/login_validation/login_validation.dart';
import 'package:getxpractice/utils/validations/signup_validation/signup_validation.dart';
import 'package:getxpractice/view/Screens/registration_module/password_module/password_controller/change_password_controller.dart';

import '../Modular/auth/Controllers.dart/AuthController/AuthController.dart';
import '../Modular/auth/Controllers.dart/CoreController/Favorites_Controller/Add_Remove_Fav/Add_Remove_Controller.dart';
import '../Modular/auth/Controllers.dart/CoreController/Favorites_Controller/show_Fav_Controller/Favorites_Controller.dart';
import '../Modular/auth/Controllers.dart/CoreController/GetAllCategories/Get_All_Categories_Controller.dart';
import '../Modular/auth/Controllers.dart/CoreController/GetResturant/GetResController.dart';
import '../Modular/auth/Controllers.dart/CoreController/GetSubCategories/Get_Sub_Categories.dart';
import '../Modular/auth/Controllers.dart/CoreController/Get_Product_Controller/Get_Product_Controller.dart';
import '../Modular/auth/Controllers.dart/CoreController/Get_Single_Product_Controller/Get_Single_Product_Controller.dart';

import '../Modular/auth/Controllers.dart/CoreController/PastOrderController/PastOrderController.dart';
import '../Modular/auth/Controllers.dart/CoreController/product_order_Controller/product_controller.dart';
import '../Modular/auth/Controllers.dart/PaymentController/Default_Card_Controller.dart';
import '../Modular/auth/Controllers.dart/PaymentController/Deleted_Card_Controller.dart';
import '../view/Screens/core_module/bottom_navibar_pages/Shopping_Cart/shoppingcart_controller.dart';
import '../view/Screens/registration_module/agreement_module/agreement_controller/agreement_controller.dart';
import '../view/Screens/registration_module/login_module/login_controller/login_screen_controller.dart';
import '../view/Screens/registration_module/otp_module/otp_controller/otp_controller.dart';

import '../view/Screens/registration_module/profile_module/edit_profile_controller/edit_profile_controller.dart';
import '../view/Screens/registration_module/signup_module/signup_controller/signup_screen_controller.dart';
import '../view/Screens/registration_module/social_login_module/social_login_controller/social_login_controller.dart';
import '../view/Screens/registration_module/update_password/update_pass_screen_controller.dart/update_pass_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    WidgetsFlutterBinding.ensureInitialized();
    Get.put<AuthController>(AuthController());
    Get.put<Signupvalidation>(Signupvalidation());
    Get.put<Loginvalidation>(Loginvalidation());
    Get.put<OtpController>(OtpController());
    Get.put<AgreementController>(AgreementController());
    Get.put<Forgotvalidation>(Forgotvalidation());
    Get.put<changepasswordcontroller>(changepasswordcontroller());
    Get.put<signupscreencontroller>(signupscreencontroller());
    Get.put<loginscreencontroller>(loginscreencontroller());
    Get.put<updatepasscontroller>(updatepasscontroller());
    Get.put<EditProfileController>(EditProfileController());
    Get.put<SocialLoginController>(SocialLoginController());
    //####################################Core binding###################################
    Get.put<GetResController>(GetResController());
    Get.put<GetAllCatController>(GetAllCatController());
    Get.put<GetSubCatController>(GetSubCatController());
    Get.put<GetProductController>(GetProductController());
    Get.put<GetSingleProductController>(GetSingleProductController());
    Get.put<ShowFavoritesController>(ShowFavoritesController());
    Get.put<AddRemoveFavoritesController>(AddRemoveFavoritesController());
    Get.put<AddToCartVM>(AddToCartVM());
    // ###################################### CardControllers#######################################3
    Get.put<AddCardController>(AddCardController());
    Get.put<GetCardController>(GetCardController());
    Get.put<DefaultCardController>(DefaultCardController());
    Get.put<DeleteCardController>(DeleteCardController());
    Get.put<PastOrderController>(PastOrderController());
    Get.put<ProductOrderController>(ProductOrderController());
  }
}
