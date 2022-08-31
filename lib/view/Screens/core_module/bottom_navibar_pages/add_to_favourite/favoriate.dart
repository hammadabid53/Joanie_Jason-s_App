import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:getxpractice/Resuable_widgets/custom_text_widget.dart';
import 'package:getxpractice/utils/app_color.dart';
import 'package:getxpractice/utils/app_strings.dart';
import 'package:getxpractice/utils/constant.dart';

import '../../../../../Modular/auth/Controllers.dart/CoreController/Favorites_Controller/show_Fav_Controller/Favorites_Controller.dart';
import '../../../../../Resuable_widgets/custom_searchfield.dart';
import 'favorite_widget/favoriate_widget.dart';

class ShowFavoriateList extends StatefulWidget {
  const ShowFavoriateList({Key? key}) : super(key: key);

  @override
  State<ShowFavoriateList> createState() => _ShowFavoriateListState();
}

class _ShowFavoriateListState extends State<ShowFavoriateList> {
  @override
  void initState() {
    ShowFavoritesController.p.GetFAVORITESList();
    super.initState();
  }

  bool iselected = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShowFavoritesController>(
        builder: (controller) => Padding(
            padding: EdgeInsets.all(kDefaultPadding),
            child: Column(children: [_searchField(), _productcontainer()])));
  }

  Widget _searchField() {
    return const SearchField();
  }

  Widget _productcontainer() {
    return ShowFavoritesController.p.favoritesModel == null
        ? Expanded(
            child: Center(
                child: CustomTextWidget(
            text: "No favorite List Found",
            fontSize: 1.sp,
            fontWeight: FontWeight.bold,
            textColor: AppColor.DARK_BROWN_COLOR,
          )))
        : Expanded(
            child: ShowFavoritesController.p.searchtext.text.isNotEmpty &&
                    ShowFavoritesController.p.SearchList.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true, //Added
                    itemCount: ShowFavoritesController.p.SearchList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          child: FavoriateListContainer(
                        image: ShowFavoritesController.p.favoritesModel!
                                .favourites![index].productId!.prodImage ??
                            AppStrings.LOADING_TEXT,
                        title: ShowFavoritesController
                            .p.SearchList[index].productId?.title,
                        discription: ShowFavoritesController
                                .p.SearchList[index].productId!.description ??
                            AppStrings.LOADING_TEXT,
                        id: ShowFavoritesController
                            .p.SearchList[index].productId?.price
                            .toString(),
                      ));
                    })
                : ListView.builder(
                    shrinkWrap: true, //Added
                    itemCount: ShowFavoritesController
                        .p.favoritesModel!.favourites?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return FavoriateListContainer(
                        title: ShowFavoritesController.p.favoritesModel!
                                .favourites![index].productId!.title ??
                            AppStrings.LOADING_TEXT,
                        image: ShowFavoritesController.p.favoritesModel!
                                .favourites![index].productId!.prodImage ??
                            AppStrings.LOADING_TEXT,
                        discription: ShowFavoritesController.p.favoritesModel!
                                .favourites![index].productId!.description ??
                            AppStrings.LOADING_TEXT,
                        id: ShowFavoritesController.p.favoritesModel!
                            .favourites![index].productId!.price
                            .toString(),
                        onTap: () {
                          // ShowFavoritesController.p.toogle(index);

                          ShowFavoritesController.p.del(index);

                          ShowFavoritesController.p.favoritesModel?.favourites
                              ?.removeAt(index);
                        },
                      ).addNeumorphism(
                          blurRadius: 0.5,
                          spreadradius: 0.1,
                          offset: Offset(0, 15),
                          bottomShadowColor:
                              AppColor.GREY_COLOR.withOpacity(0.02));
                    }));
  }
}
