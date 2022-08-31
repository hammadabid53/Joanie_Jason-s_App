import 'package:get/get.dart';

import '../../../../Models/CoreModuleModels/Favorites_Model/Add_Remove_Favoraites/Add_Remove_Favoraites.dart';
import '../../../../Services/Core_Api.dart';

class AddRemoveFavoritesController extends GetxController {
  int subcatindex = 0;
  static AddRemoveFavoritesController get p => Get.find();

  AddRemoveFavoritesModel? addRemoveFavoritesModel;

  Future ADDREMOVEFAVORITES(String FavId) async {
    print("################## ADDREMOVEFAVORITES ##############");
    AddRemoveFavoritesController.p.addRemoveFavoritesModel =
        await CoreApi().ADDREMOVEFAVORITES(FavId);

    print(
        "############### Add Remove FAVORITES ID  id${AddRemoveFavoritesController.p.addRemoveFavoritesModel?.message}");

    if (AddRemoveFavoritesController.p.addRemoveFavoritesModel?.status == 1) {
      print(
          "is_status :${AddRemoveFavoritesController.p.addRemoveFavoritesModel?.message}");

      update();
    } else {
      print(
          "is_status :${AddRemoveFavoritesController.p.addRemoveFavoritesModel?.message}");
      update();
    }
  }
}
