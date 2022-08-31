import 'package:get/get.dart';

import '../../../Models/CoreModuleModels/Get_Sub_Categories/Get_sub_Categories.dart';
import '../../../Services/Core_Api.dart';
import '../Get_Product_Controller/Get_Product_Controller.dart';

class GetSubCatController extends GetxController {
  static GetSubCatController get s => Get.find();
  List<Category>? category;

  GetSubCategoriesModel? getSubCategories;

  Future GetSubRes(String catsubid) async {
    print("###################GetSubCatController #####################  ");

    GetSubCatController.s.getSubCategories =
        await CoreApi().GetSubCat(catsubid);
    category = GetSubCatController.s.getSubCategories?.category;
    if (GetSubCatController.s.getSubCategories?.status == 1) {
      GetProductController.p.GetProduct(GetSubCatController.s.category![0].id!);
      print("is_status :${GetSubCatController.s.getSubCategories?.status}");

      update();
    } else {
      print("is_status :${GetSubCatController.s.getSubCategories?.status}");

      update();
    }
  }
}
