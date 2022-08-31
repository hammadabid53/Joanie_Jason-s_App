import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getxpractice/Modular/auth/Controllers.dart/CoreController/Favorites_Controller/Add_Remove_Fav/Add_Remove_Controller.dart';
import 'package:getxpractice/utils/api.dart';

import 'package:getxpractice/utils/constant.dart';

import '../../../../../../../Modular/auth/Controllers.dart/CoreController/GetSubCategories/Get_Sub_Categories.dart';
import '../../../../../../../Modular/auth/Controllers.dart/CoreController/Get_Product_Controller/Get_Product_Controller.dart';
import '../../../../../../../Resuable_widgets/custom_text_widget.dart';
import '../../../../../../../utils/app_color.dart';
import '../../../../../../../utils/app_strings.dart';


class SubCategoriesWidget extends StatefulWidget {
  const SubCategoriesWidget({Key? key}) : super(key: key);
  @override
  State<SubCategoriesWidget> createState() => _SubCategoriesWidgetState();
}

class _SubCategoriesWidgetState extends State<SubCategoriesWidget> {
  @override
  void initState() {
    super.initState();
  }

  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return GetSubCatController.s.category == null
        ? Expanded(child: Container())
        : Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                height: 100,
                child: ListView.builder(
                    shrinkWrap: true, //Added
                    itemCount: GetSubCatController.s.category?.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      print("indexxxxxxxxxxxxxxxx${index}");
                      return InkWell(
                          onTap: () {
                            print("click");

                            setState(() {
                              GetProductController.p.data = null;
                              AddRemoveFavoritesController.p.subcatindex =
                                  index;
                              selected = index;
                              print(
                                  "############################ subcatindex${AddRemoveFavoritesController.p.subcatindex}");
                            });

                            GetProductController.p.GetProduct(
                                GetSubCatController.s.category![index].id
                                    .toString());

                            print(
                                "indexxxxxxxxxxxxxxxxx${GetSubCatController.s.getSubCategories!.category![index].id}");
                            // box.write(
                            //     "subcatid",
                            //     GetSubCatController
                            //         .s.getSubCategories!.category![index].id);
                          },
                          child: Container(
                            margin:
                                EdgeInsets.only(top: kDefaultPadding, left: 10),
                            height: 0.10.sh,
                            width: 0.46.sw,
                            padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              color: selected == index
                                  ? AppColor.DARK_BROWN_COLOR
                                  : AppColor.WHITE_COLOR.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            child: Row(
                              children: [
                                _horizontalListImage(
                                  SharedApi().imageUrl +
                                      GetSubCatController.s.getSubCategories!
                                          .category![index].catImage!,
                                ),

                                // CircleAvatar(
                                //     radius: 25.r,
                                //     backgroundColor: AppColor.PRIMARY_COLOR,
                                //     child: CircleAvatar(
                                //         radius: 16.r,
                                //         backgroundImage: GetSubCatController
                                //                     .s
                                //                     .getSubCategories!
                                //                     .category![index]
                                //                     .catImage !=
                                //                 null
                                //             ? NetworkImage(
                                //                 SharedApi().imageUrl +
                                //                     GetSubCatController
                                //                         .s
                                //                         .getSubCategories!
                                //                         .category![index]
                                //                         .catImage!,
                                //               )
                                //             : AssetImage(
                                //                     AppStrings.LOADING_TEXT)
                                //                 as ImageProvider)),

                                SizedBox(
                                  width: 5.w,
                                ),
                                Flexible(
                                  child: CustomTextWidget(
                                    text: GetSubCatController
                                                .s
                                                .getSubCategories!
                                                .category![index]
                                                .title !=
                                            null
                                        ? GetSubCatController
                                            .s
                                            .getSubCategories!
                                            .category![index]
                                            .title
                                        : AppStrings.DEFAULT_CARD_TEXT,
                                    fontSize: 1.0.sp,
                                    textColor: selected == index
                                        ? AppColor.WHITE_COLOR
                                        : AppColor.DARK_BROWN_COLOR,
                                    fontWeight: FontWeight.bold,
                                    softWrap: true,
                                  ),
                                ),
                              ],
                            ),
                          ));
                    }),
              )),
            ],
          );
  }

  Widget _horizontalListImage(String backgroundImage) {
    return CachedNetworkImage(
      color: AppColor.DARK_BROWN_COLOR,
      imageUrl: backgroundImage,
      imageBuilder: (context, imageProvider) => CircleAvatar(
        radius: 25.r,
        backgroundColor: AppColor.PRIMARY_COLOR,
        child: CircleAvatar(radius: 16.r, backgroundImage: imageProvider),
      ),
      placeholder: (context, url) => Center(
          child: CircularProgressIndicator(
        color: AppColor.DARK_BROWN_COLOR,
      )),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
