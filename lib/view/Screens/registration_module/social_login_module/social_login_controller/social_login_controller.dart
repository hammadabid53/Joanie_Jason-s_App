import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import 'package:getxpractice/Modular/auth/Controllers.dart/AuthController/AuthController.dart';
import 'package:getxpractice/Modular/auth/Services/connectivity_manager.dart';
import 'package:getxpractice/Resuable_widgets/bot_toast/error_message.dart';
import 'package:getxpractice/utils/app_route_name.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../Modular/auth/Models/socialLoginModel/Social_login.dart';
import '../../../../../Resuable_widgets/bot_toast/loading.dart';
import 'package:http/http.dart' as http;

import '../../../../../Resuable_widgets/bot_toast/network_message.dart';
import '../../splash_screen_module/splash_screen.dart';

bool issocialshowdata = false;

class SocialLoginController extends GetxController {
  static SocialLoginController get s => Get.find();
  var id;
  String? username;
  String? email;

  googleSignUp() async {
    issocialshowdata = false;
    updatepassword = false;
    await box.write("issocialshowdata", issocialshowdata);
    update();
    ConnectivityManager _connectivityManager = ConnectivityManager();
    if (await _connectivityManager.isInternetConnected() == true) {
      try {
        final GoogleSignIn googleSignIn = GoogleSignIn(
          scopes: ['email'],
        );
        final FirebaseAuth auth = FirebaseAuth.instance;

        final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        print(credential.token);

        id = googleUser?.id.toString();
        email = googleUser?.email;

        username = googleUser?.displayName;

        print(
            "ye name h #########################################${googleUser?.displayName}");

        print("email ye h ###############${email}");

        String? devicetoken = await FirebaseMessaging.instance.getToken();
        print("==================**************=${devicetoken}");

        print("====================zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz${id}");
        socialapi();

        if (googleUser != null) {
          await googleSignIn.signOut();
        }
        final User? user = (await auth.signInWithCredential(credential)).user;

        print("===================zzzzzzzzzzzzzzzzzzzzzzzzzzzzzz========");
      } on Exception catch (e) {
        showInternetMessage(e.toString());
        print(showInternetMessage(e.toString()));
      }
    }
  }

  Future<SocialLoginModel?> socialapi() async {
    print("===================socail login========");
    showLoading();
    var data = await http.post(
      Uri.parse("http://server.appsstaging.com:3096/api/socialLogin"),
      body: {
        "user_social_token": id,
        "email": email,
        "user_name": username,
        "user_social_type": "Google"
      },
    );
    print("===================after body========");
    print(data.body.toString());
    var jsonData = json.decode(data.body);
    print(data.statusCode);

    if (data.statusCode == 200) {
      stopLoading();
      print(data.statusCode);
      print(
          "###########################################data body################################");
      print(data.body);

      print("#####################");
      var sociallogin = SocialLoginModel.fromJson(jsonData);
      var socailtoken = sociallogin.data?.userAuthentication;
      await box.write("user_token", socailtoken);

      await box.write("user_id", sociallogin.data?.id);
      await box.write("name", sociallogin.data?.userName);

      await box.write("email", sociallogin.data?.email);
      print("ye token h social ka #################${box.read("user_token")}");
      Get.toNamed(AppRouteName.CHOOSE_STORE_ROUTE);
      update();
    } else {
      showErrorMessage(jsonData['message']);
    }
    return null;
  }
}
