import 'package:get/get.dart';
import 'package:getxpractice/Modular/auth/Controllers.dart/PaymentController/Get_Card_Controller.dart';
import 'package:getxpractice/Modular/auth/Models/PaymentModels/Default_Card.dart';

import '../../Services/Core_Api.dart';

class DefaultCardController extends GetxController {
  static DefaultCardController get c => Get.find();

  DefaultCardModel? defaultCardModel;

  Future DefaultCard(String CardNo) async {
    print("###########Default Card Api##########");
   
    DefaultCardController.c.defaultCardModel =
        await CoreApi().DefaultCARD(CardNo);

    if (DefaultCardController.c.defaultCardModel?.status == 1) {
      print("is_status :${DefaultCardController.c.defaultCardModel?.status}");
      
      update();
    } else {
      print("is_status :${DefaultCardController.c.defaultCardModel?.status}");
      update();
    }
  }
}
