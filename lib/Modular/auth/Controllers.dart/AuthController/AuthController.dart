import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:getxpractice/utils/app_route_name.dart';
import 'package:getxpractice/view/Screens/registration_module/splash_screen_module/splash_screen.dart';

import '../../../../view/Screens/registration_module/social_login_module/social_login_controller/social_login_controller.dart';
import '../../Models/RegistrationModuleModels/Get_User/get_user.dart';
import '../../Models/RegistrationModuleModels/change_password/change_password_model.dart';
import '../../Models/RegistrationModuleModels/forget_password/forget_model.dart';
import '../../Models/RegistrationModuleModels/login_model/login_model.dart';
import '../../Models/RegistrationModuleModels/logout/logout.dart';
import '../../Models/RegistrationModuleModels/policy_model/policy.dart';
import '../../Models/RegistrationModuleModels/resend_model/resend_model.dart';
import '../../Models/RegistrationModuleModels/signup_model/Signup_model.dart';
import '../../Models/RegistrationModuleModels/update_Profile_model/update_profile.dart';
import '../../Models/RegistrationModuleModels/update_password/update_password.dart';
import '../../Models/RegistrationModuleModels/verify_otp/verify_otp.dart';
import '../../Services/Auth_Api.dart';

bool issignupScreen = false;
bool forgetPasswordScreen = false;
bool loginscreen = false;
bool updatepassword = false;

var userid;
var token;

class AuthController extends GetxController {
  static AuthController get i => Get.find();
  var Token;
  SignupUserModel? signu_user;
  LoginUserModel? login_user;
  VerifyOtpModel? verifyOtpModel;
  ForgetPasswordModel? forgetPasswordModel;
  Change_password_Model? changepasswordModel;
  UpdatePasswordModel? updatePasswordModel;
  ResendOtpModel? resendPasswordModel;
  UpdateProfileModel? updateProfileModel;
  LogoutModel? logoutModel;
  PolicyModel? policyModel;
  GetUserModel? getUserModel;
  String? privacycontent;
  String? termscontent;
  var userimage;
  var username;
  var userphoneno;
  var email;

/////////////////////////////login////////////////////////////////////////////////

  Future login(String emailIn, String passwordIn) async {
    loginscreen = true;
    updatepassword = true;
    issocialshowdata = true;

    await box.write("issocialshowdata", issocialshowdata);

    print("############LOGIN API FUNCTION #####################");
    update();
    AuthController.i.login_user = await AuthApi().loginAPI(emailIn, passwordIn);

    if (AuthController.i.login_user?.data?.isVerified == 1) {
      print("is_verified :${AuthController.i.login_user?.data?.isVerified}");
      token = AuthController.i.login_user?.data?.userAuthentication;
      userid = AuthController.i.login_user?.data?.id;

      await box.write("user_id", userid);
      await box.write("user_token", token);

      print(box.read("user_token"));
      print(box.read("user_id"));
      AuthController.i.username = AuthController.i.login_user?.data?.userName;
      AuthController.i.userphoneno =
          AuthController.i.login_user?.data?.phoneNumber;
      AuthController.i.email = AuthController.i.login_user?.data?.email;
      AuthController.i.userimage = AuthController.i.login_user?.data?.image;

      await box.write("name", AuthController.i.username);
      await box.write("phone", AuthController.i.userphoneno);
      await box.write("email", AuthController.i.email);
      await box.write("image", AuthController.i.userimage);

      print("####login token########${token}");

      Get.toNamed(AppRouteName.CHOOSE_STORE_ROUTE);

      update();
    } else if (AuthController.i.login_user?.data?.isVerified == 0) {
      Get.toNamed(AppRouteName.OTP_VERFICATION_ROUTE);

      update();
    }
  }

/////////////////////////////resendotp////////////////////////////////////////////////

  Future resendotp() async {
    print("#################RESEND API FUNCTION################");
    resendPasswordModel = await AuthApi().resendotp();
    print(resendPasswordModel);
    if (resendPasswordModel?.status == 1) {
      resendPasswordModel?.message;
      print(resendPasswordModel.toString());
      update();
    } else {
      resendPasswordModel?.message;
      update();
    }
  }

/////////////////////////////verifyotp////////////////////////////////////////////////

  Future verifyotp(String verifyotp) async {
    print("###########VERIFY OTP FUNCTION#####################");
    print("verifyotp code ZZZZZZZZZZZZZZZZ:${verifyotp}");

    issocialshowdata = true;

    await box.write("issocialshowdata", issocialshowdata);
    update();
    AuthController.i.verifyOtpModel = await AuthApi().verifyotp(verifyotp);
    if (AuthController.i.verifyOtpModel?.status == 1) {
      token = AuthController.i.verifyOtpModel?.data?.userAuthentication;
      await box.write('user_token', token);
      print(box.read("user_token"));
      print("####verify otp token########${token}");
      AuthController.i.username =
          AuthController.i.verifyOtpModel?.data?.userName;
      AuthController.i.userphoneno =
          AuthController.i.verifyOtpModel?.data?.phoneNumber;
      AuthController.i.email = AuthController.i.verifyOtpModel?.data?.email;
      AuthController.i.userimage = AuthController.i.verifyOtpModel?.data?.image;

      await box.write("name", AuthController.i.username);
      await box.write("phone", AuthController.i.userphoneno);
      await box.write("email", AuthController.i.email);
      await box.write("image", AuthController.i.userimage);
      update();
      if (issignupScreen == true) {
        print(issignupScreen);

        Get.toNamed(AppRouteName.CHOOSE_STORE_ROUTE);
      } else if (issignupScreen == false && loginscreen == false) {
        print(issignupScreen);
        Get.toNamed(AppRouteName.CHANGE_PASSWORD_ROUTE);
      } else if (loginscreen == true) {
        print(loginscreen);
        Get.toNamed(AppRouteName.SUCESS_SCREEN_ROUTE);
      }
    } else if (AuthController.i.verifyOtpModel?.status == 0) {
      AuthController.i.verifyOtpModel?.message;
      print("otp #################### message");
      update();
    }
  }

/////////////////////////////signup////////////////////////////////////////////////

  Future signup(
      String nameIn, String emailIn, String passIn, String phoneIn) async {
    print("###########SIGNUP FUNCTION#####################");
    issignupScreen = true;
    updatepassword = true;
    issocialshowdata = true;

    await box.write("issocialshowdata", issocialshowdata);
    update();

    print("############SIGNUP API FUNCTION #######################");

    AuthController.i.signu_user =
        await AuthApi().signupAPI(nameIn, emailIn, passIn, phoneIn);

    if (AuthController.i.signu_user?.status == 1) {
      userid = AuthController.i.signu_user?.data?.userId;
      await box.write("user_id", userid);
      print("user id @@@@@@@@@@@@@@@@@@@@${userid}");
      print("status:${AuthController.i.signu_user}");

      Get.toNamed(AppRouteName.OTP_VERFICATION_ROUTE);
      update();
    } else if (signu_user!.status == 0) {
      AuthController.i.signu_user?.message;
      print(
          "Signup message @@@@@@@@@@@@@@@@@@@@${AuthController.i.signu_user?.message}");
      update();
    }
  }

/////////////////////////////forgetpassword////////////////////////////////////////////////

  Future forgetpassword(String emailIn) async {
    print("###########FORGET PASSWORD FUNCTION#####################");
    issignupScreen = false;
    loginscreen = false;
    update();
    AuthController.i.forgetPasswordModel =
        await AuthApi().forgetpasswordAPI(emailIn);
    if (AuthController.i.forgetPasswordModel?.status == 1) {
      userid = AuthController.i.forgetPasswordModel?.data!.userId;
      await box.write("user_id", userid);
      print("user id @@@@@@@@@@@@@@@@@@@@${userid}");
      print(AuthController.i.forgetPasswordModel?.status);

      Get.toNamed(AppRouteName.OTP_VERFICATION_ROUTE);

      update();
    } else {
      Get.toNamed(AppRouteName.FORGOT_PASSWORD_SCREEN_ROUTE);

      print(AuthController.i.forgetPasswordModel?.message);
      print(
          "forgot password message @@@@@@@@@@@@@@@@@@@@${AuthController.i.forgetPasswordModel?.message}");
      update();
    }
  }

/////////////////////////////PrivacypolicyAPI///////////////////////////////////////////////

  Future PrivacyPolicy() async {
    print("###########PRIVACY POLICY FUNCTION#####################");
    AuthController.i.policyModel = await AuthApi().PrivacypolicyAPI();
    if (AuthController.i.policyModel?.status == 1) {
      print(policyModel.toString());
      print(policyModel!.status);
      AuthController.i.privacycontent = policyModel?.message[0].content;

      print(
          "privacycontent ##############################${AuthController.i.privacycontent}");
      update();
    } else if (AuthController.i.policyModel?.status == 0) {
      print(AuthController.i.policyModel?.message);
      print(
          "PrivacypolicyAPI message ##############################${AuthController.i.policyModel?.message}");
      update();
    }
  }

/////////////////////////////TermsAndCondpolicyAPI/////////////////////////////////////////////

  Future TermsAndCondpolicyAPI() async {
    print("########### TERMS AND CONDITION FUNCTION #####################");
    AuthController.i.policyModel = await AuthApi().TermsAndCondpolicyAPI();
    if (AuthController.i.policyModel?.status == 1) {
      print(policyModel.toString());
      print(policyModel?.status);

      AuthController.i.termscontent = policyModel?.message[0].content;

      print(
          "TERMS AND CONDTION CONTENT ##############################${AuthController.i.termscontent}");

      update();
    } else if (AuthController.i.policyModel?.status == 0) {
      print(AuthController.i.policyModel?.message);
      print(
          "TERMS AND CONDTION MESSAGE ##############################${AuthController.i.policyModel?.message}");
      update();
    }
  }

/////////////////////////////autologin////////////////////////////////////////////////

  autoLogin() async {
    print("########### AUTO LOGIN FUNCTION #####################");
    Future.delayed(const Duration(seconds: 3)).then((value) {
      GetStorage box = GetStorage('myData');
      if (box.read('user_token') == null) {
        Get.offAllNamed(AppRouteName.SOCIAL_LOGIN_SCREEN_ROUTE);
        // box.remove("user_token");
      } else {
        Get.offAllNamed(AppRouteName.CHOOSE_STORE_ROUTE);
        // box.remove("user_token");
      }
    });
  }

/////////////////////////////change_password////////////////////////////////////////////////
  changePassword(String newpassword) async {
    print("########### CHANGE PASSWORD FUNCTION #####################");
    AuthController.i.changepasswordModel =
        await AuthApi().changePasswordAPI(newpassword);

    if (AuthController.i.changepasswordModel?.status == 1) {
      Get.toNamed(AppRouteName.LOGIN_SCREEN_ROUTE);
      print(
          "update password message :${AuthController.i.changepasswordModel?.message}");
      update();
    } else {
      print(
          "update password message :${AuthController.i.changepasswordModel?.message}");
      update();
    }
  }

/////////////////////////////update_password////////////////////////////////////////////////
  updatePassword(String oldpassword, String newpassword) async {
    print("########### UPDATE PASSWORD FUNCTION #####################");

    updatePasswordModel =
        await AuthApi().updatePasswordAPI(oldpassword, newpassword);

    if (updatePasswordModel?.status == 1) {
      Get.toNamed(AppRouteName.LOGIN_SCREEN_ROUTE);
      print("update password message :${updatePasswordModel?.message}");
      update();
    } else {
      print("update password message :${updatePasswordModel?.message}");
      update();
    }
  }

  /////////////////////////////Logout////////////////////////////////////////////////
  logout() async {
    print("########### LOGOUT FUNCTION #####################");

    AuthController.i.logoutModel = await AuthApi().logout();
    update();

    if (AuthController.i.logoutModel?.status == 1) {
      print("Logout message :${AuthController.i.logoutModel?.message}");
      Get.toNamed(AppRouteName.SOCIAL_LOGIN_SCREEN_ROUTE);
    } else {
      AuthController.i.logoutModel?.message;
      print("Logout message :${AuthController.i.logoutModel?.message}");
      update();
    }
  }

  //////////////////////Get Users/////////////////////////////
  Future getuser() async {
    print("########### GET PROFILE USER API FUNCTION #####################");
    AuthController.i.getUserModel = await AuthApi().getuser();

    AuthController.i.username = AuthController.i.getUserModel?.user?.userName;
    AuthController.i.userphoneno =
        AuthController.i.getUserModel!.user?.phoneNumber;
    AuthController.i.email = AuthController.i.getUserModel?.user?.email;
    AuthController.i.userimage = AuthController.i.getUserModel?.user?.image;

    print(AuthController.i.username);
    print(AuthController.i.userphoneno);
    print(AuthController.i.email);
    print(AuthController.i.userimage);
    await box.write("name", AuthController.i.username);
    await box.write("phone", AuthController.i.userphoneno);
    await box.write("email", AuthController.i.email);
    await box.write("image", AuthController.i.userimage);
    update();
  }
}
