import 'package:get/get.dart';

import 'package:getxpractice/Modular/auth/Models/PaymentModels/Get_Card_Model.dart';

import '../../Services/Core_Api.dart';

class GetCardController extends GetxController {
  static GetCardController get g => Get.find();

  GetCardModel? getCardModel;

  Future GetCard() async {
    print("################GetCard##################");

    GetCardController.g.getCardModel = await CoreApi().GETCARD();

    if (GetCardController.g.getCardModel!.status == 1) {
      print("is_status :${GetCardController.g.getCardModel?.message}");
      update();
    } else {
      print("is_status :${GetCardController.g.getCardModel?.message}");
      update();
    }
  }
}
