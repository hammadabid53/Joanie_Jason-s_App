import 'package:get/get.dart';
import 'package:getxpractice/Modular/auth/Models/PastOrderModel/PastOrderModel.dart';
import 'package:intl/intl.dart';

import '../../../Services/Core_Api.dart';

class PastOrderController extends GetxController {
  static PastOrderController get p => Get.find();
  List<Orders>? orders;
  PastOrderModel? pastOrderModel;
  var dateList = [];
  Future Pastorderapi(String id) async {
    print("##################PastOrderController###################");

    PastOrderController.p.pastOrderModel = await CoreApi().PastOrderApi(id);

    orders = PastOrderController.p.pastOrderModel?.orders!;
    if (PastOrderController.p.pastOrderModel?.status == 1) {
  for (int i = 0; i <PastOrderController.p.pastOrderModel!.orders!.length ; i++) {
        String? timestamp = PastOrderController.p.orders?[i].createdAt;
        var tlist = timestamp?.split('T');
        var time = tlist?[1].substring(0, 5);
        var parsedDate = DateTime.parse(tlist![0]);
        final DateFormat formatter = DateFormat('dd MMM');
        final date = formatter.format(parsedDate);
        dateList.add('$date $time');
      }
      print("is_status :${PastOrderController.p.pastOrderModel?.status}");
      // print("message :${PastOrderController.p.pastOrderController?.message}");

      update();
    } else {
      print("is_status :${PastOrderController.p.pastOrderModel?.status}");
      // print("message :${PastOrderController.p.pastOrderController?.message}");

      update();
    }
  }

}
