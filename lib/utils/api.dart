import 'package:getxpractice/Modular/auth/Controllers.dart/AuthController/AuthController.dart';

import '../view/Screens/registration_module/splash_screen_module/splash_screen.dart';

class SharedApi {
  String imageUrl = "http://server.appsstaging.com:3096/";
  String baseUrl = "http://server.appsstaging.com:3096/api";

  Map<String, String> getToken() {
    AuthController.i.Token = box.read('user_token');
    print("get token ${AuthController.i.Token}");
    if (AuthController.i.Token != null)
      return {
        "Authorization": "Bearer " + AuthController.i.Token,
      };
    return {
      "Authorization": "Bearer " + "BadToken",
    };
  }
}
