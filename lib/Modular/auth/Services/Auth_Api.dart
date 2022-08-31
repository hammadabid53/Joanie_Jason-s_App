import 'dart:convert';

import 'package:get/get.dart';
import 'package:getxpractice/Modular/auth/Controllers.dart/AuthController/AuthController.dart';

import 'package:getxpractice/Modular/auth/Services/connectivity_manager.dart';
import 'package:getxpractice/Resuable_widgets/custom_snackbar.dart';
import 'package:getxpractice/utils/app_route_name.dart';
import 'package:http/http.dart' as http;

import '../../../Resuable_widgets/bot_toast/error_message.dart';

import '../../../Resuable_widgets/bot_toast/loading.dart';
import '../../../Resuable_widgets/bot_toast/network_message.dart';
import '../../../utils/api.dart';

import '../../../view/Screens/registration_module/splash_screen_module/splash_screen.dart';
import '../Models/RegistrationModuleModels/Get_User/get_user.dart';
import '../Models/RegistrationModuleModels/change_password/change_password_model.dart';
import '../Models/RegistrationModuleModels/forget_password/forget_model.dart';
import '../Models/RegistrationModuleModels/login_model/login_model.dart';
import '../Models/RegistrationModuleModels/logout/logout.dart';
import '../Models/RegistrationModuleModels/policy_model/policy.dart';
import '../Models/RegistrationModuleModels/resend_model/resend_model.dart';
import '../Models/RegistrationModuleModels/signup_model/Signup_model.dart';
import '../Models/RegistrationModuleModels/update_password/update_password.dart';
import '../Models/RegistrationModuleModels/verify_otp/verify_otp.dart';

class AuthApi extends SharedApi {
////////////////////////////////////loginApi////////////////////////////////////////////
  Future<LoginUserModel?> loginAPI(String email, String password) async {
    try {
      showLoading();
      ConnectivityManager _connectivityManager = ConnectivityManager();
      if (await _connectivityManager.isInternetConnected() == true) {
        var jsonData;

        var data = await http.post(
          Uri.parse("$baseUrl/login"),
          body: {'email': email, 'password': password},
          //  headers: getToken()
        ).timeout(
          const Duration(seconds: 15),
          onTimeout: () {
            stopLoading();
            showErrorMessage("connection Time out Sorry! try again");
            return http.Response(
                'Error', 408); // Request Timeout response status code
          },
        );
        print(data.body.toString());
        jsonData = json.decode(data.body);
        print(data.statusCode);

        print(" Login api JsonData:######################${jsonData}");

        if (data.statusCode == 200) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");
          customSnackBar("user login successfully", "congrats");
          return LoginUserModel.fromJson(jsonData);
        } else if (data.statusCode == 400) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");
          showErrorMessage(jsonData['message']);
        }
      } else {
        stopLoading();
        customSnackBar("NO_INTERNET_CONNECTION", "CHECK INTERNET");
      }
    } on Exception catch (_) {
      stopLoading();
      printError();
      showInternetMessage("Failed! Exception Something Went Wrong");

      return LoginUserModel.fromJson({"status": 404});
    }
    return null;
  }

////////////////////////////////////resendotpApi////////////////////////////////////////////
  Future<ResendOtpModel?> resendotp() async {
    try {
      showLoading();
      ConnectivityManager _connectivityManager = ConnectivityManager();
      if (await _connectivityManager.isInternetConnected() == true) {
        var jsonData;

        print(verifyotp);
        var data = await http.post(
          Uri.parse("$baseUrl/resend-code"),
          body: {
            'user_id': await box.read("user_id"),
          },
        ).timeout(const Duration(seconds: 15), onTimeout: () {
          stopLoading();
          showErrorMessage("connection Time out Sorry! try again");
          return http.Response('Error', 408);
        });

        print(data.body.toString());
        jsonData = json.decode(data.body);

        print(data.statusCode);

        print(" Resend api JsonData:######################${jsonData}");
        if (data.statusCode == 200) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");
          customSnackBar("resend code successfully", "congrats");
          return ResendOtpModel.fromJson(jsonData);
        } else if (data.statusCode == 400) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");
          showErrorMessage(jsonData['message']);

          return ResendOtpModel.fromJson({"status": data.statusCode});
        }
      } else {
        stopLoading();
        customSnackBar("NO_INTERNET_CONNECTION", "CHECK INTERNET");

        return null;
      }
    } on Exception catch (_) {
      stopLoading();
      printError();
      showInternetMessage("Failed! Exception Something Went Wrong");
      return ResendOtpModel.fromJson({"status": 404});
    }
    return null;
  }

////////////////////////////////////verifyotpApi////////////////////////////////////////////

  Future<VerifyOtpModel?> verifyotp(String verifyotp) async {
    try {
      showLoading();
      ConnectivityManager _connectivityManager = ConnectivityManager();
      if (await _connectivityManager.isInternetConnected() == true) {
        var jsonData;

        print("verifyotp value : $verifyotp");
        var data = await http.post(
          Uri.parse("$baseUrl/verifyOtp"),
          body: {
            'verification_code': verifyotp.toString(),
            'user_id': await box.read("user_id"),
          },
          // headers: getToken()
        ).timeout(const Duration(seconds: 15), onTimeout: () {
          stopLoading();
          showErrorMessage("connection Time out Sorry! try again");
          return http.Response('Error', 408);
        });

        print(data.body.toString());
        jsonData = json.decode(data.body);

        print(data.statusCode);
        print(" verify api JsonData:######################${jsonData}");
        if (data.statusCode == 200) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");

          customSnackBar("otp matched successfully", "congrats");
          return VerifyOtpModel.fromJson(jsonData);
        } else if (data.statusCode == 400) {
          print("statusCode:##########${data.statusCode}");
          showErrorMessage(jsonData['message']);
          return VerifyOtpModel.fromJson({"status": data.statusCode});
        }
      } else {
        stopLoading();
        customSnackBar("NO_INTERNET_CONNECTION", "CHECK INTERNET");
      }
    } on Exception catch (_) {
      stopLoading();
      printError();
      showInternetMessage("Failed! Exception Something Went Wrong");
      return VerifyOtpModel.fromJson({"status": 404});
    }
    return null;
  }

////////////////////////////////////SignUp Api////////////////////////////////////////////
  // Sign Up API
  Future<SignupUserModel?> signupAPI(
    String name,
    String email,
    String pass,
    String phone,
  ) async {
    try {
      showLoading();
      ConnectivityManager _connectivityManager = ConnectivityManager();
      if (await _connectivityManager.isInternetConnected() == true) {
        var jsonData;

        var data = await http.post(
          Uri.parse('$baseUrl/register'),
          body: {
            'user_name': name,
            'email': email,
            'password': pass,
            'phone_number': phone,
          },
          // headers: getToken());
        ).timeout(const Duration(seconds: 15), onTimeout: () {
          stopLoading();
          showErrorMessage("connection Time out Sorry! try again");
          return http.Response('Error', 408);
        });
        print(data.body.toString());
        jsonData = json.decode(data.body);

        print(data.statusCode);
        print(" Signup  api JsonData:######################${jsonData}");
        if (data.statusCode == 200) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");

          customSnackBar("user signup sucessfully", "congrats");

          return SignupUserModel.fromJson(jsonData);
        }
        if (data.statusCode == 400) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");
          showErrorMessage(jsonData['message']);
          return SignupUserModel.fromJson({"status": data.statusCode});
        }
      } else {
        stopLoading();
        customSnackBar("NO_INTERNET_CONNECTION", "CHECK INTERNET");
      }
    } on Exception catch (_) {
      stopLoading();
      printError();
      showInternetMessage("Failed! Exception Something Went Wrong");

      return SignupUserModel.fromJson({"status": 404});
    }
    return null;
  }

///////////////////////////////////  // Forget Password API//////////////////////////////////////////

  Future<ForgetPasswordModel?> forgetpasswordAPI(
    String email,
  ) async {
    try {
      showLoading();
      ConnectivityManager _connectivityManager = ConnectivityManager();
      if (await _connectivityManager.isInternetConnected() == true) {
        var jsonData;

        var data = await http.post(
          Uri.parse('$baseUrl/forgetpassword'),
          body: {
            'email': email,
          },
          // headers: getToken()
        ).timeout(const Duration(seconds: 15), onTimeout: () {
          stopLoading();
          showErrorMessage("connection Time out Sorry! try again");
          return http.Response('Error', 408);
        });
        print(data.body.toString());
        jsonData = json.decode(data.body);

        print(data.statusCode);
        print(
            " forget password  api JsonData:######################${jsonData}");

        if (data.statusCode == 200) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");

          customSnackBar(
              "verification code send successfully", "please check your email");
          return ForgetPasswordModel.fromJson(jsonData);
        } else if (data.statusCode == 400) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");
          showErrorMessage(jsonData['message']);

          return ForgetPasswordModel.fromJson({"status": data.statusCode});
        }
      } else {
        stopLoading();
        customSnackBar("NO_INTERNET_CONNECTION", "CHECK INTERNET");
      }
    } on Exception catch (_) {
      stopLoading();
      printError();
      showInternetMessage("Failed! Exception Something Went Wrong");
      return ForgetPasswordModel.fromJson({"status": 404});
    }
    return null;
  }

  /////////////////////////////////// PrivacypolicyAPI//////////////////////////////////////////

  Future<PolicyModel?> PrivacypolicyAPI() async {
    try {
      showLoading();
      ConnectivityManager _connectivityManager = ConnectivityManager();
      if (await _connectivityManager.isInternetConnected() == true) {
        var jsonData;

        var data = await http
            .get(
          Uri.parse('$baseUrl/content/privacy_policy'),
        )
            .timeout(const Duration(seconds: 15), onTimeout: () {
          stopLoading();
          showErrorMessage("connection Time out Sorry! try again");
          return http.Response('Error', 408);
        });
        print(data.body.toString());
        jsonData = json.decode(data.body);
        print(" Privacy Policy api JsonData:######################${jsonData}");
        if (data.statusCode == 200) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");

          return PolicyModel.fromJson(jsonData);
        } else if (data.statusCode == 400) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");
          showErrorMessage(jsonData['message']);

          return PolicyModel.fromJson({"status": data.statusCode});
        }
      } else {
        stopLoading();
        customSnackBar("NO_INTERNET_CONNECTION", "CHECK INTERNET");
      }
    } on Exception catch (_) {
      stopLoading();
      printError();
      showInternetMessage("Failed! Exception Something Went Wrong");
      return PolicyModel.fromJson({"status": 404});
    }
    return null;
  }

  ///////////////////////////////////  TermsAndCondpolicyAPI //////////////////////////////////////////

  Future<PolicyModel?> TermsAndCondpolicyAPI() async {
    try {
      showLoading();
      ConnectivityManager _connectivityManager = ConnectivityManager();
      if (await _connectivityManager.isInternetConnected() == true) {
        var jsonData;

        var data = await http
            .get(
          Uri.parse('$baseUrl/content/terms_and_conditions'),
        )
            .timeout(const Duration(seconds: 15), onTimeout: () {
          stopLoading();
          showErrorMessage("connection Time out Sorry! try again");
          return http.Response('Error', 408);
        });
        print(data.body.toString());
        jsonData = json.decode(data.body);

        print(data.statusCode);
        print(
            " Terms And Condtion Policy api JsonData:######################${jsonData}");
        stopLoading();
        if (data.statusCode == 200) {
          print("statusCode:##########${data.statusCode}");

          return PolicyModel.fromJson(jsonData);
        } else if (data.statusCode == 400) {
          print("statusCode:##########${data.statusCode}");
          showErrorMessage(jsonData['message']);

          return PolicyModel.fromJson({"status": data.statusCode});
        }
      } else {
        stopLoading();
        customSnackBar("NO_INTERNET_CONNECTION", "CHECK INTERNET");
      }
    } on Exception catch (_) {
      stopLoading();
      printError();
      showInternetMessage("Failed! Exception Something Went Wrong");
      return PolicyModel.fromJson({"status": 404});
    }
    return null;
  }

// //////////////////////////////////update Password API//////////////////////////////////////
  Future<UpdatePasswordModel?> updatePasswordAPI(
      String oldpassword, String newPassword) async {
    try {
      showLoading();

      ConnectivityManager _connectivityManager = ConnectivityManager();
      if (await _connectivityManager.isInternetConnected() == true) {
        var jsonData;

        var data = await http
            .post(Uri.parse('$baseUrl/change-password'),
                body: {
                  'user_id': await box.read("user_id"),
                  'old_password': oldpassword,
                  'new_password': newPassword,
                },
                headers: getToken())
            .timeout(const Duration(seconds: 15), onTimeout: () {
          showErrorMessage("connection Time out Sorry! try again");
          return http.Response('Error', 408);
        });

        jsonData = json.decode(data.body);

        print(data.toString());
        print("update password api JsonData:######################${jsonData}");
        if (data.statusCode == 200) {
          print("statusCode:##########${data.statusCode}");
          stopLoading();
          customSnackBar("update password successfully", "Congrats");

          return UpdatePasswordModel.fromJson(jsonData);
        } else if (data.statusCode == 400) {
          print("statusCode:##########${data.statusCode}");
          stopLoading();
          showErrorMessage(jsonData['message']);

          return UpdatePasswordModel.fromJson({"status": data.statusCode});
        }
      } else {
        stopLoading();
        customSnackBar("NO_INTERNET_CONNECTION", "CHECK INTERNET");
      }
    } on Exception catch (_) {
      stopLoading();
      printError();
      showInternetMessage("Failed! Exception Something Went Wrong");

      return UpdatePasswordModel.fromJson({"status": 404});
    }
    return null;
  }

// ///////////////////////////////////Change Password API////////////////////////////////////////////////////
  Future<Change_password_Model?> changePasswordAPI(String newPassword) async {
    try {
      showLoading();
      ConnectivityManager _connectivityManager = ConnectivityManager();
      if (await _connectivityManager.isInternetConnected() == true) {
        var jsonData;

        var data = await http.post(
          Uri.parse('$baseUrl/updatePassword'),
          body: {
            'new_password': newPassword,
            'user_id': await box.read('user_id')
          },
          // headers: getToken()
        ).timeout(const Duration(seconds: 15), onTimeout: () {
          stopLoading();
          showErrorMessage("connection Time out Sorry! try again");
          return http.Response('Error', 408);
        });

        print(data.body.toString());
        jsonData = json.decode(data.body);
        print("Change password api JsonData:######################${jsonData}");
        if (data.statusCode == 200) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");

          customSnackBar("change password successfully", "Congrats");
          return Change_password_Model.fromJson(jsonData);
        } else if (data.statusCode == 400) {
          print("statusCode:##########${data.statusCode}");
          stopLoading();
          showErrorMessage(jsonData['message']);

          return Change_password_Model.fromJson({"status": data.statusCode});
        }
      } else {
        stopLoading();
        customSnackBar("NO_INTERNET_CONNECTION", "CHECK INTERNET");
      }
    } on Exception catch (_) {
      stopLoading();
      printError();
      showInternetMessage("Failed! Exception Something Went Wrong");
      return Change_password_Model.fromJson({"status": 404});
    }
    return null;
  }

// ///////////////////////////////////Logout API////////////////////////////////////////////////////
  Future<LogoutModel?> logout() async {
    try {
      showLoading();
      ConnectivityManager _connectivityManager = ConnectivityManager();
      if (await _connectivityManager.isInternetConnected() == true) {
        var jsonData;

        var data = await http
            .post(Uri.parse('$baseUrl/logout'),
                body: {'user_id': await box.read("user_id")},
                headers: getToken()
                // headers: {'Authorization': 'Bearer $token'},

                //  getToken()
                )
            .timeout(const Duration(seconds: 15), onTimeout: () {
          stopLoading();
          showErrorMessage("connection Time out Sorry! try again");
          return http.Response('Error', 408);
        });
        print(token);
        print(data.body.toString());
        jsonData = json.decode(data.body);
        print("logout api JsonData:######################${jsonData}");

        if (data.statusCode == 200) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");
          box.remove("user_token");
          box.remove("user_id");
          customSnackBar("user logout successfully", "Congrats");
          return LogoutModel.fromJson(jsonData);
        } else if (data.statusCode == 400) {
          print("statusCode:##########${data.statusCode}");
          stopLoading();
          showErrorMessage(jsonData['message']);

          return LogoutModel.fromJson({"status": data.statusCode});
        }
      } else {
        stopLoading();
        customSnackBar("NO_INTERNET_CONNECTION", "CHECK INTERNET");
      }
    } on Exception catch (_) {
      stopLoading();
      printError();
      showInternetMessage("Failed! Exception Something Went Wrong");
      return LogoutModel.fromJson({"status": 404});
    }
    return null;
  }

  ////////////////////////////////////GetUserModel////////////////////////////////////////////

  Future<GetUserModel?> getuser() async {
    try {
      ConnectivityManager _connectivityManager = ConnectivityManager();
      if (await _connectivityManager.isInternetConnected() == true) {
        showLoading();

        var jsonData;

        var data = await http
            .get(Uri.parse("$baseUrl/profile"), headers: getToken())
            .timeout(const Duration(seconds: 15), onTimeout: () {
          stopLoading();
          showErrorMessage("connection Time out Sorry! try again");
          return http.Response('Error', 408);
        });

        print(data.body.toString());

        jsonData = json.decode(data.body);

        print("Get users api JsonData:######################${jsonData}");

        if (data.statusCode == 200) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");

          customSnackBar("get user sucessfully", "Congrats");

          return GetUserModel.fromJson(jsonData);
        } else if (data.statusCode == 400) {
          print("statusCode:##########${data.statusCode}");
          stopLoading();
          showErrorMessage(jsonData['message']);

          return GetUserModel.fromJson({"status": data.statusCode});
        }
      } else {
        stopLoading();
        customSnackBar("NO_INTERNET_CONNECTION", "CHECK INTERNET");
      }
    } on Exception catch (_) {
      stopLoading();
      printError();
      showInternetMessage("Failed! Exception Something Went Wrong");
      return GetUserModel.fromJson({"status": 404});
    }
    return null;
  }
}
