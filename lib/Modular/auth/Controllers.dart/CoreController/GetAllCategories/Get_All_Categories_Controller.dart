import 'package:get/get.dart';
import 'package:getxpractice/Modular/auth/Models/CoreModuleModels/GetAllCategories/GetAllCat.dart';

import '../../../Services/Core_Api.dart';

class GetAllCatController extends GetxController {
  static GetAllCatController get g => Get.find();

  GetAllCategories? getAllCategories;

  Future GetAllCat(String resuserid) async {
    print(
        "################################ GetAllCatController #######GET ALL CATEGORIES RES  ${resuserid}");

    GetAllCatController.g.getAllCategories =
        await CoreApi().GetAllCat(resuserid);

    print("############### my GET ALL CATEGORIES RES  id${resuserid}");

    if (GetAllCatController.g.getAllCategories?.status == 1) {
      print("is_status :${GetAllCatController.g.getAllCategories?.status}");

      update();
    } else {
      print("is_status :${GetAllCatController.g.getAllCategories?.status}");
      update();
    }
  }
}
