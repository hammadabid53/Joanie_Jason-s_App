import 'package:get/get.dart';
import 'package:getxpractice/Modular/auth/Controllers.dart/PaymentController/Get_Card_Controller.dart';
import 'package:getxpractice/Modular/auth/Models/PaymentModels/Add_Card_Model.dart';

import '../../Services/Core_Api.dart';

class AddCardController extends GetxController {
  static AddCardController get c => Get.find();

  AddCardModel? addCardModel;

  Future AddCard(
      String CardNo, String expMonth, String expYear, String cvv) async {
    print("########### AddCardController#########");

    AddCardController.c.addCardModel =
        await CoreApi().ADDCARD(CardNo, expMonth, expYear, cvv);

    if (AddCardController.c.addCardModel?.status == 1) {
      print("is_status :${AddCardController.c.addCardModel?.status}");
      GetCardController.g.GetCard();
      update();
    } else {
      print("is_status :${AddCardController.c.addCardModel?.status}");
      update();
    }
  }
}
