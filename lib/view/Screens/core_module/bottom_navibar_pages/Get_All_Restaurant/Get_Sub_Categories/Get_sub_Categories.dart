import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getxpractice/Resuable_widgets/appbar.dart/custom_appbar.dart';
import 'package:getxpractice/utils/app_assets_path.dart';

import '../../../../../../../utils/app_strings.dart';
import '../../../../../../Modular/auth/Controllers.dart/CoreController/GetSubCategories/Get_Sub_Categories.dart';
import '../../../../../../Modular/auth/Controllers.dart/CoreController/Get_Product_Controller/Get_Product_Controller.dart';

import '../../../../../../Modular/auth/Models/CoreModuleModels/GetAllCategories/GetAllCat.dart';

import 'Get_Sub_Categories_widget/GetProductListWidget.dart';
import 'Get_Sub_Categories_widget/SubCategoriesWidget.dart';

class GetSubCategories extends StatefulWidget {
  Category categories;

  GetSubCategories(this.categories);

  @override
  State<GetSubCategories> createState() => _GetSubCategoriesState();
}

class _GetSubCategoriesState extends State<GetSubCategories> {
  @override
  void initState() {
    GetSubCatController.s.GetSubRes(widget.categories.id!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          onTap: () {
            Get.back();
          },
          LeadingIconImage: AssetPaths.BACK_ICON,
          headingtitle:
              widget.categories.title ?? AppStrings.DEFAULT_CARD_TEXT),
      body: Column(
        children: [
          GetBuilder<GetSubCatController>(
            builder: (controller) => SubCategoriesWidget(),
          ),
          Padding(padding: EdgeInsets.fromLTRB(20, 20, 20, 0)),
          GetBuilder<GetProductController>(
              builder: (controller) =>
                  GetProductController.p.getProductModel == null
                      ? Center(child: Container())
                      : GetProductListWidget())
        ],
      ),
    );
  }
}
