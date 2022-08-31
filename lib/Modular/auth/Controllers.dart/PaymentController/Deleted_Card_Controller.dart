import 'package:get/get.dart';

import '../../Models/PaymentModels/Delete_Card_Model.dart';
import '../../Services/Core_Api.dart';

class DeleteCardController extends GetxController {
  static DeleteCardController get d => Get.find();

  DeleteCardModel? deleteCardModel;

  Future DeleteCard(String CardNo) async {
    print("###################DELETE CARD ###############");

    DeleteCardController.d.deleteCardModel = await CoreApi().DeleteCard(CardNo);

    if (DeleteCardController.d.deleteCardModel?.status == 1) {
      print("is_status :${DeleteCardController.d.deleteCardModel?.status}");

      update();
    } else {
      print("is_status :${DeleteCardController.d.deleteCardModel?.status}");
      update();
    }
  }
}
