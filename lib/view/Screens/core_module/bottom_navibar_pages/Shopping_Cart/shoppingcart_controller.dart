import 'package:get/get.dart';
import 'package:getxpractice/Modular/auth/Models/CoreModuleModels/Get_Single_Product/Get_Single_Product_Model.dart';
import 'package:getxpractice/view/Screens/core_module/bottom_navibar_pages/Get_All_Restaurant/Get_Sub_Categories/Get_Sub_Categories_widget/Get_Single_Product_Detail/Get_Single_Product_Detail.dart';

import '../../../../../Modular/auth/Controllers.dart/CoreController/Get_Single_Product_Controller/Get_Single_Product_Controller.dart';

class AddToCartVM extends GetxController {
  static AddToCartVM get sp => Get.find();
  List<Product> lst = <Product>[];
  double sub = 0;
  double total = 0;

  add(String title, String productImage, double productPrice, String id,
      int quantity, ) {
    lst.add(Product(
        prodImage: productImage,
        price: productPrice,
        id: id,
        title: title,
        quantity: quantity));
    update();
  }

  subtotal() {
    for (int i = 0; i < lst.length; i++)
      sub += (quantity) *
          (GetSingleProductController
              .sp.singleProductDetailsModel!.product![i].price!);

    print("sub ye h:#############################${sub}");
    total = sub;
    print("total ye h:#############################${total}");
    update();
  }

  // calculateprice(double price, double quantity) {
  //   return price * quantity;
  // }

  del(int index) {
    lst.removeAt(index);

    AddToCartVM.sp.refresh();
    if (lst.length == null) {
      sub = 0;
    }

    print("sub del k function  h:#############################${sub}");

    update();
  }
}
