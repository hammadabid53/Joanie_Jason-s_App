import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getxpractice/Resuable_widgets/custom_text_widget.dart';
import 'package:getxpractice/utils/app_color.dart';
import 'package:getxpractice/utils/app_strings.dart';
import 'package:getxpractice/view/Screens/core_module/bottom_navibar_pages/Get_All_Restaurant/Get_All_Restaurant_screen.dart';
import 'package:getxpractice/view/Screens/core_module/bottom_navibar_pages/Shopping_Cart/shopping_cart.dart';
import 'package:getxpractice/view/Screens/core_module/bottom_navibar_pages/add_to_favourite/favoriate.dart';
import 'package:getxpractice/view/Screens/core_module/bottom_navibar_pages/ProfileScreen/profile_screen.dart';
import 'package:getxpractice/view/Screens/registration_module/splash_screen_module/splash_screen.dart';

import '../../../../Resuable_widgets/appbar.dart/custom_appbar.dart';
import '../../../../utils/app_assets_path.dart';
import '../../../../Resuable_widgets/app_drawer/app_drawer.dart';

class HOME_MENU_PAGES extends StatefulWidget {
  String? title;
  void Function()? onTap;

  HOME_MENU_PAGES({this.onTap, this.title, Key? key}) : super(key: key);

  @override
  State<HOME_MENU_PAGES> createState() => _HOME_MENU_PAGESState();
}

class _HOME_MENU_PAGESState extends State<HOME_MENU_PAGES> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> titleList = ['Home', 'Favorites', 'Shopping Cart', 'Profile'];
    final List<Widget> PagesList = [
      GetAllRestaurant(resturant: box.read("GetRes")),
      const ShowFavoriateList(),
      ShoppingCart(
        isshow: false,
      ),
      ProfileScreen(),
    ];

    void onTabTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    return WillPopScope(
        onWillPop: () async {
          final shouldPop = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: AppColor.BGAPPCOLOR,
                title: CustomTextWidget(
                  text: AppStrings.DO_YOU_WANT_TO_GO_BACK_TEXT,
                  fontSize: 1.sp,
                  fontWeight: FontWeight.bold,
                  textColor: AppColor.DARK_BROWN_COLOR,
                ),
                actionsAlignment: MainAxisAlignment.spaceBetween,
                actions: [
                  TextButton(
                    onPressed: () {
                      // SystemNavigator.pop();
                      Navigator.pop(context, true);

                      exit(0);
                    },
                    child: CustomTextWidget(
                      text: AppStrings.YES_TEXT,
                      fontSize: 1.sp,
                      fontWeight: FontWeight.bold,
                      textColor: AppColor.DARK_BROWN_COLOR,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: CustomTextWidget(
                        text: AppStrings.N0_TEXT,
                        fontSize: 1.sp,
                        fontWeight: FontWeight.bold,
                        textColor: AppColor.DARK_BROWN_COLOR,
                      )),
                ],
              );
            },
          );
          return shouldPop!;
        },
        child: Scaffold(
          key: _key,
          drawer: AppDrawer(),
          appBar: CustomAppBar(
            LeadingIconImage: AssetPaths.MENU_ICON,
            headingtitle: titleList[selectedIndex],
            onTap: (() {
              _key.currentState?.openDrawer(); // this
            }),
          ),
          body: PagesList[selectedIndex],
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedLabelStyle: const TextStyle(fontSize: 0),
              unselectedLabelStyle: const TextStyle(fontSize: 0),
              unselectedItemColor: AppColor.BGAPPCOLOR,
              backgroundColor: AppColor.DARK_BROWN_COLOR,
              onTap: onTabTapped,
              currentIndex: selectedIndex,
              selectedItemColor: Theme.of(context).primaryColor,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                            height: 20, width: 20, AssetPaths.HOME_ICON),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          height: 5.h,
                          decoration: BoxDecoration(
                              color: selectedIndex == 0
                                  ? AppColor.BGAPPCOLOR
                                  : Colors.transparent,
                              shape: BoxShape.circle),
                        )
                      ],
                    ),
                    // : Image.asset(height: 20, width: 20, AssetPaths.HOME_ICON),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(height: 20, width: 20, AssetPaths.FAV_ICON),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          height: 5.h,
                          decoration: BoxDecoration(
                              color: selectedIndex == 1
                                  ? AppColor.BGAPPCOLOR
                                  : Colors.transparent,
                              shape: BoxShape.circle),
                        )
                      ],
                    ),
                    // : Image.asset(height: 20, width: 20, AssetPaths.FAV_ICON),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(height: 20, width: 20, AssetPaths.BAG_ICON),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          height: 5.h,
                          decoration: BoxDecoration(
                              color: selectedIndex == 2
                                  ? AppColor.BGAPPCOLOR
                                  : Colors.transparent,
                              shape: BoxShape.circle),
                        )
                      ],
                    ),
                    // : Image.asset(height: 20, width: 20, AssetPaths.BAG_ICON),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                            height: 20, width: 20, AssetPaths.USER_ICON),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          height: 5.h,
                          decoration: BoxDecoration(
                              color: selectedIndex == 3
                                  ? AppColor.BGAPPCOLOR
                                  : Colors.transparent,
                              shape: BoxShape.circle),
                        )
                      ],
                    ),
                    // : Image.asset(height: 20, width: 20, AssetPaths.USER_ICON),
                    label: ""),
              ],
            ),
          ),
        ));
  }
}
