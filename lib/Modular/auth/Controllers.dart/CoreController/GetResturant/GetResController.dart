import 'package:get/get.dart';

import '../../../Models/CoreModuleModels/GetRestuarant/GetResModel.dart';
import '../../../Services/Core_Api.dart';

class GetResController extends GetxController {
  static GetResController get i => Get.find();

  GetResModel? getResModel;

  Future GetRes() async {
    print("###############GetResController###########");

    GetResController.i.getResModel = await CoreApi().GetResAPI();

    if (GetResController.i.getResModel?.status == 1) {
      print("is_status :${GetResController.i.getResModel?.status}");

      update();
    } else {
      print("is_status :${GetResController.i.getResModel?.status}");
      update();
    }
  }
}
