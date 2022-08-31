import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getxpractice/Resuable_widgets/custom_textfield_container.dart';
import 'package:getxpractice/utils/app_assets_path.dart';
import 'package:getxpractice/utils/app_strings.dart';

import '../Modular/auth/Controllers.dart/CoreController/Favorites_Controller/show_Fav_Controller/Favorites_Controller.dart';

// List<Favourites> SearchList = [];
// TextEditingController searchtext = TextEditingController();

class SearchField extends StatefulWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: Row(
        children: [
          Expanded(
              child: TextFieldContainer(
            controller: ShowFavoritesController.p.searchtext,
            obsecureText: false,
            onChanged: (text) {
              ShowFavoritesController.p
                  .searchfavourite(ShowFavoritesController.p.searchtext.text);

              print("cliekcl?#####################################");
            },
            suffixiconscalesize: 2.sp,
            hinttext: AppStrings.SEARCH_TEXT,
            issufixImageEnable: true,
            issufiximage: AssetPaths.SEARCH_ICON,
          )),
        ],
      ),
    );
  }
}
