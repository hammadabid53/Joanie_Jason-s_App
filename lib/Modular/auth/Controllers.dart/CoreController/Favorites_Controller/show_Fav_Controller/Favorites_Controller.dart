import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxpractice/Modular/auth/Models/CoreModuleModels/Favorites_Model/Show_Fav_Model/Favoraites_model.dart';

import '../../../../Services/Core_Api.dart';
import '../Add_Remove_Fav/Add_Remove_Controller.dart';

class ShowFavoritesController extends GetxController {
  static ShowFavoritesController get p => Get.find();

  FavoritesModel? favoritesModel;

  Future GetFAVORITESList() async {
    print("#################### GetFAVORITESList##############");
    update();
    ShowFavoritesController.p.favoritesModel =
        await CoreApi().GetALLFAVORITES();

    if (ShowFavoritesController.p.favoritesModel?.status == 1) {
      print("is_status :${ShowFavoritesController.p.favoritesModel?.status}");

      update();
    } else {
      print("is_status :${ShowFavoritesController.p.favoritesModel?.status}");
      update();
    }
  }

  del(int index) {
    AddRemoveFavoritesController.p.ADDREMOVEFAVORITES(ShowFavoritesController
        .p.favoritesModel!.favourites![index].productId!.id
        .toString());

    update();
  }

  List<Favourites> SearchList = [];

  TextEditingController searchtext = TextEditingController();

  void searchfavourite(String searchtxt) {
    SearchList.clear();
    print(
        "lenghttttt: show fav length${ShowFavoritesController.p.favoritesModel!.favourites!.length}");
    print("query search ${searchtxt}");
    for (int i = 0;
        i <= ShowFavoritesController.p.favoritesModel!.favourites!.length;
        i++) {
      print("length: ######################${i}");
      var data = ShowFavoritesController
          .p.favoritesModel!.favourites![i].productId!.title;
      print("data: ######################${data}");

      print("query: ######################${searchtxt}");

      if (data!.toUpperCase().contains(searchtext.text.toUpperCase())) {
        print("if work ");
        SearchList.addAll(
            [ShowFavoritesController.p.favoritesModel!.favourites![i]]);

        update();
        print("searych l;isajtgn ${SearchList.length}");
      } else {
        print("elseeeeeeeee");
      }
    }
  }
}
