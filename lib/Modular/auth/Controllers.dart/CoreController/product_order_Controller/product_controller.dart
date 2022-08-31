import 'package:get/get.dart';
import 'package:getxpractice/Modular/auth/Models/CoreModuleModels/product_order/product_order_model.dart';
import 'package:getxpractice/utils/app_route_name.dart';

import '../../../Services/Core_Api.dart';

class ProductOrderController extends GetxController {
  static ProductOrderController get po => Get.find();

  ProductOrderModel? productOrderModel;

  Future ProductOrder() async {
    print("##################ProductOrderController###################");

    ProductOrderController.po.productOrderModel =
        await CoreApi().ProductOrder();

    if (ProductOrderController.po.productOrderModel?.status == 1) {
      print(
          "is_status :${ProductOrderController.po.productOrderModel?.status}");
      print("message :${ProductOrderController.po.productOrderModel?.message}");

      Get.toNamed(AppRouteName.HOME_PAGES_ROUTE);

      update();
    } else {
      print(
          "is_status :${ProductOrderController.po.productOrderModel?.status}");
      print("message :${ProductOrderController.po.productOrderModel?.message}");

      update();
    }
  }
}
