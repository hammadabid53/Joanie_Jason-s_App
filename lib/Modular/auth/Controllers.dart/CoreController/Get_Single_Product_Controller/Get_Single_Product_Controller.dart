import 'package:get/get.dart';

import '../../../Models/CoreModuleModels/Get_Single_Product/Get_Single_Product_Model.dart';
import '../../../Services/Core_Api.dart';

class GetSingleProductController extends GetxController {
  static GetSingleProductController get sp => Get.find();

  GetSingleProductDetailsModel? singleProductDetailsModel;

  Future GetSingleProduct(String singleproductid) async {
    print(
        "#################### GetSingleProductController##############");

    GetSingleProductController.sp.singleProductDetailsModel =
        await CoreApi().GetSingleProductDetail(singleproductid);

    if (GetSingleProductController.sp.singleProductDetailsModel?.status == 1) {
      print(
          "is_status :${GetSingleProductController.sp.singleProductDetailsModel?.status}");

      update();
    } else {
      print(
          "is_status :${GetSingleProductController.sp.singleProductDetailsModel?.status}");
      update();
    }
  }
}
