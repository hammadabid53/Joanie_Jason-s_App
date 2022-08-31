// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// import 'package:getxpractice/Resuable_widgets/custom_text_widget.dart';
// import 'package:getxpractice/utils/app_assets_path.dart';
// import 'package:getxpractice/utils/app_color.dart';
// import 'package:getxpractice/utils/app_strings.dart';
// import 'package:getxpractice/utils/constant.dart';

// import '../../../../Resuable_widgets/appbar.dart/custom_appbar.dart';
// import '../../../../Resuable_widgets/custom_app_button.dart';
// import '../../../../utils/app_route_name.dart';


// class ProductQuantity extends StatelessWidget {
//   const ProductQuantity({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
       
//         appBar: CustomAppBar(
//           onTap: () {
//             Get.toNamed(AppRouteName.HOME_PAGES_ROUTE);
//           },
//           LeadingIconImage: AssetPaths.BACK_ICON,
//           headingtitle: AppStrings.PRODUCT_DETAILS_TEXT,
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.all(kDefaultPadding),
//             child: Column(
//               children: [
//                 _centerimage(),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 _bottompart(),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 _ordernowBtn(),
//               ],
//             ),
//           ),
//         ));
//   }

//   Widget _centerimage() {
//     return Stack(
//       alignment: Alignment.topCenter,
//       children: [
//         CircleAvatar(
//           backgroundColor: AppColor.PRIMARY_COLOR,
//           radius: 100.r,
//         ),
//         Padding(
//           padding: EdgeInsets.all(kDefaultPadding),
//           child: Image.asset(scale: 1.sp, AssetPaths.BURGER_ICON),
//         )
//       ],
//     );
//   }

//   Widget _bottompart() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         CustomTextWidget(
//           text: AppStrings.PRODUCT_DETAILS_TEXT,
//           fontWeight: FontWeight.bold,
//           textColor: AppColor.BLACK_COLOR,
//           fontSize: 2.sp,
//         ),
//         SizedBox(
//           height: 10.h,
//         ),
//         CustomTextWidget(
//           text: AppStrings.LOREM_IPSUM,
//           textColor: AppColor.BLACK_COLOR,
//           fontSize: 1.sp,
//         ),
//         SizedBox(
//           height: 10.h,
//         ),
//         CustomTextWidget(
//           text: "\$2.75",
//           textColor: AppColor.BLACK_COLOR,
//           fontWeight: FontWeight.bold,
//           fontSize: 1.5.sp,
//         ),
//         SizedBox(
//           height: 10.h,
//         ),
//         Container(
//           height: 0.05.sh,
//           width: 0.25.sw,
//           padding: EdgeInsets.only(left: 5, right: 5),
//           decoration: BoxDecoration(
//               color: AppColor.DARK_BROWN_COLOR,
//               borderRadius: BorderRadius.circular(30)),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Image.asset(scale: 3.sp, AssetPaths.MINUS_ICON),
//               Center(
//                 child: CustomTextWidget(
//                   text: "1",
//                   textColor: AppColor.WHITE_COLOR,
//                   fontSize: 1.8.sp,
//                 ),
//               ),
//               Image.asset(scale: 3.sp, AssetPaths.PLUS_ICON)
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 5.h,
//         ),
//         CustomTextWidget(
//           text: AppStrings.QUANTITY_TEXT,
//           textColor: AppColor.BLACK_COLOR,
//           fontWeight: FontWeight.bold,
//           fontSize: 1.5.sp,
//         ),
//       ],
//     );
//   }

//   Widget _ordernowBtn() {
//     return CustomAppBtn(
//         onclickPressed: () {
//           Get.toNamed(AppRouteName.SHOPPING_CART_ROUTE);
//         },
//         title: AppStrings.ORDER_NOW_TEXT);
//   }
// }
