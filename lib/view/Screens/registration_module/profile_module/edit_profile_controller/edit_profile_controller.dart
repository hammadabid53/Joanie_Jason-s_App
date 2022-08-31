import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:getxpractice/Modular/auth/Models/RegistrationModuleModels/update_Profile_model/update_profile.dart';

import 'package:getxpractice/Resuable_widgets/bot_toast/loading.dart';
import 'package:getxpractice/Resuable_widgets/custom_snackbar.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../Modular/auth/Controllers.dart/AuthController/AuthController.dart';
import '../../../../../Modular/auth/Services/connectivity_manager.dart';
import '../../../../../Resuable_widgets/bot_toast/network_message.dart';
import '../../../../../utils/app_route_name.dart';
import '../../splash_screen_module/splash_screen.dart';
import '../edit_profile_screen/edit_profile.dart';

// File? pickedFile;
// dynamic imagevalue;

class EditProfileController extends GetxController {
  static EditProfileController get e => Get.find();
  File? image;

  PickedFile? imageFile;
  final ImagePicker imagePicker = ImagePicker();

  void takePhoto(ImageSource source) async {
    final pickedFile = await imagePicker.pickImage(
      source: source,
    );
    final croppedImage = await ImageCropper().cropImage(
      sourcePath: pickedFile!.path,
         maxWidth: 1080,
      maxHeight: 1080,
      uiSettings: [
        AndroidUiSettings(
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),]
    
    );

    //       Future getImages(name,source)async{
    //   final pickedFile = await _picker.pickImage(source: source,imageQuality: 80);
    //    final croppedImage = await ImageCropper().cropImage(
    //     sourcePath: pickedFile!.path,
    //     maxWidth: 1080,
    //     maxHeight: 1080,
    //     uiSettings: [
    //       AndroidUiSettings(
    //           initAspectRatio: CropAspectRatioPreset.original,
    //           lockAspectRatio: false),]
    //   );
    //   if (croppedImage != null) {
    //     image = File(croppedImage.path);
    //     images[name.toString()] = image!.path;
    //     update();
    //     print(images);
    //   }else {
    //       Get.snackbar(AppStrings.FAILED, AppStrings.LOAD_IMAGE,backgroundColor: AppColors.NOTIFICATION_COLOR);
    //   }
    // }

    // imageFile = pickedFile;
    // update();

    if (croppedImage != null) {
      image = File(croppedImage.path);
      // images[source.toString()] = image!.path;
      print("image upload ${image}");

      // image = File(imageFile!.path);
      update();
    } else {
      print("No Image Picked..");
    }
    Get.back();
    update();
  }

  Future<void> uploadImage() async {
    ConnectivityManager _connectivityManager = ConnectivityManager();
    if (await _connectivityManager.isInternetConnected() == true) {
      try {
        showLoading();
        Map<String, String> header = {
          // "Authorization": 'Bearer  ${box.read("user_token")}'
          "Authorization": 'Bearer ' + AuthController.i.Token
        };
        var uri =
            Uri.parse('http://server.appsstaging.com:3096/api/update-profile');
        print(AuthController.i.Token);
        print("&&&&&&&&&&&&&&&&&&&***********************************");
        print(box.read("user_token"));
        var request = http.MultipartRequest('POST', uri);
        request.headers.addAll(header);
        request.fields['user_name'] = username.text;
        if (image != null) {
          var multipart = http.MultipartFile.fromPath('image', image!.path);
          request.files.add(await multipart);
        }
        var streamResponse = await request.send();
        var response = await http.Response.fromStream(streamResponse);
        var data = jsonDecode(response.body);
        var jsondata = UpdateProfileModel.fromJson(data);

        if (response.statusCode == 200) {
          stopLoading();
          print(response.body);
          print(response.statusCode);
          print("Loaded Image");

          AuthController.i.username = jsondata.data!.userName;
          AuthController.i.userphoneno = jsondata.data!.phoneNumber;
          AuthController.i.email = jsondata.data!.email;
          AuthController.i.userimage = jsondata.data!.image;
          await box.write("name", AuthController.i.username);
          await box.write("phone", AuthController.i.userphoneno);
          await box.write("email", AuthController.i.email);
          await box.write("image", AuthController.i.userimage);
          customSnackBar("profile updated successfully", "Congrats");
          Get.toNamed(AppRouteName.HOME_PAGES_ROUTE);
          update();
        } else {
          stopLoading();
          print(response.statusCode);
          customSnackBar("sorry profile not updated", "try again");
          print("NO Image Loaded");
          print(response.body);
        }
      } on Exception catch (_) {
        stopLoading();
        showInternetMessage("Failed! Something Went Wrong");
      }
    } else {
      stopLoading();
      customSnackBar("NO_INTERNET_CONNECTION", "CHECK INTERNET");

      return null;
    }
    return null;
  }
}
