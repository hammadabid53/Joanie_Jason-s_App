import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxpractice/Modular/auth/Models/CoreModuleModels/Get_Product/Get_Product_model.dart';

import '../../../Services/Core_Api.dart';
import '../Favorites_Controller/Add_Remove_Fav/Add_Remove_Controller.dart';

class GetProductController extends GetxController {
  static GetProductController get p => Get.find();
  List<Data>? data;

  int selectedindex = 0;

  GetProductModel? getProductModel;

  Future GetProduct(String productid) async {
    print(
        "#######################GetProductController ################## ${productid}");
    update();
    GetProductController.p.getProductModel =
        await CoreApi().GetProduct(productid);

    print("############### MY ALL PRODUCT ID  id${productid}");
    data = GetProductController.p.getProductModel?.data;

    if (GetProductController.p.getProductModel?.status == 1) {
      print("is_status :${GetProductController.p.getProductModel?.status}");

      update();
    } else {
      print("is_status :${GetProductController.p.getProductModel?.status}");
      update();
    }
  }

  List<Color> favSelected = [];

  toogle(int index) async {
    print("######################## toogle ");

    AddRemoveFavoritesController.p.ADDREMOVEFAVORITES(
        GetProductController.p.getProductModel!.data![index].id.toString());

    update();
  }
}
