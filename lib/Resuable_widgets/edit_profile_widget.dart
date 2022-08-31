// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// import 'package:getxpractice/Resuable_widgets/custom_text_widget.dart';

// import 'package:getxpractice/utils/app_color.dart';
// import 'package:getxpractice/utils/constant.dart';
// import 'package:getxpractice/view/Screens/registration_module/profile_module/edit_profile_controller/edit_profile_controller.dart';
// import 'package:image_picker/image_picker.dart';

// import '../utils/app_assets_path.dart';

// // File? pickedFile;
// // dynamic imagevalue;
// File? image;

// PickedFile? _imageFile;
// final ImagePicker imagePicker = ImagePicker();

// class EditProfileWidget extends StatefulWidget {
//   String imagePath;

//   bool isEditIconEnable;

//   EditProfileWidget(this.imagePath, this.isEditIconEnable);

//   @override
//   State<EditProfileWidget> createState() => EditProfileWidgetState();
// }

// class EditProfileWidgetState extends State<EditProfileWidget> {
//   EditProfileController editProfileController = Get.find();
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<EditProfileController>(
//         builder: (controller) => Container(
//               height: 100,
//               width: 100,
//               decoration: const BoxDecoration(),
//               child: Stack(
//                 children: [
//                   Align(
//                     alignment: Alignment.center,
//                     child: _imageFile == null
//                         ? Container(
//                             height: 150,
//                             width: 150,
//                             decoration: BoxDecoration(
//                                 color: AppColor.DARK_BROWN_COLOR,
//                                 shape: BoxShape.circle,
//                                 image: DecorationImage(
//                                     fit: BoxFit.cover,
//                                     scale: 3.sp,
//                                     image: _imageFile == null
//                                         ? AssetImage(AssetPaths.BURGER_ICON)
//                                         : (File(_imageFile!.path))
//                                             as ImageProvider

//                                     // editProfileController.isprofilepicpathset ==
//                                     //         true
//                                     //     ? FileImage(File(editProfileController
//                                     //         .profilepicpath.value)) as ImageProvider
//                                     // : AssetImage(AssetPaths.BURGER_ICON),
//                                     )))
//                         : Container(
//                             height: 150,
//                             width: 150,
//                             decoration: BoxDecoration(
//                                 color: AppColor.DARK_BROWN_COLOR,
//                                 shape: BoxShape.circle,
//                                 image: DecorationImage(
//                                   fit: BoxFit.cover,
//                                   scale: 3.sp,
//                                   image: AssetImage(AssetPaths.BURGER_ICON),

//                                   // editProfileController.isprofilepicpathset ==
//                                   //         true
//                                   //     ? FileImage(File(editProfileController
//                                   //         .profilepicpath.value)) as ImageProvider
//                                   // : AssetImage(AssetPaths.BURGER_ICON),
//                                 ))),
//                   ),
//                   widget.isEditIconEnable
//                       ? Align(
//                           alignment: Alignment.bottomRight,
//                           child: GestureDetector(
//                             onTap: () {
//                               print("camera clicked");
//                               showModalBottomSheet(
//                                   context: context,
//                                   builder: (context) => bottomsheet(context));
//                             },
//                             child: Container(
//                               height: 30,
//                               width: 30,
//                               decoration: const BoxDecoration(
//                                 color: AppColor.SECONDARY_COLOR,
//                                 shape: BoxShape.circle,
//                               ),
//                               child: Align(
//                                   alignment: Alignment.center,
//                                   child: Container(
//                                     height: 15,
//                                     width: 15,
//                                     decoration: const BoxDecoration(
//                                       shape: BoxShape.circle,
//                                     ),
//                                     child: Image.asset(AssetPaths.EDIT_PROFILE),
//                                   )),
//                             ),
//                           ),
//                         )
//                       : Container(),
//                 ],
//               ),
//             ).addNeumorphism(
//                 bottomShadowColor: AppColor.GREY_COLOR.withOpacity(0.1)));
//   }

//   bottomsheet(BuildContext context) {
//     return Container(
//       height: 0.30.sh,
//       width: double.infinity,
//       margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
//       child: Column(
//         children: [
//           CustomTextWidget(
//             text: "Choose Profile Photo",
//             fontSize: 2.sp,
//             textColor: AppColor.BLACK_COLOR,
//             fontWeight: FontWeight.bold,
//           ),
//           SizedBox(
//             height: 50.h,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               InkWell(
//                 onTap: () {
//                   print("gallery");
//                   takephoto(ImageSource.gallery);
//                 },
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.image, color: AppColor.SECONDARY_COLOR),
//                     SizedBox(
//                       height: 5.h,
//                     ),
//                     CustomTextWidget(
//                       text: "Image",
//                       fontSize: 2.sp,
//                       textColor: AppColor.BLACK_COLOR,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 width: 50.w,
//               ),
//               InkWell(
//                 onTap: () {
//                   print("camera");
//                   takephoto(ImageSource.camera);
//                 },
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.camera,
//                       color: AppColor.SECONDARY_COLOR,
//                     ),
//                     SizedBox(
//                       height: 5.h,
//                     ),
//                     CustomTextWidget(
//                       text: "Camera",
//                       fontSize: 2.sp,
//                       textColor: AppColor.BLACK_COLOR,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   // void takePhoto(ImageSource source) async {
//   //   final pickedFile = await _picker.getImage(
//   //     source: source,
//   //   );
//   //   setState(() {
//   //     _imageFile = pickedFile!;
//   //   });
//   //   if (_imageFile != null) {
//   //     print("image upload");
//   //     setState(() {
//   //       image = File(_imageFile!.path);
//   //     });
//   //   } else {
//   //     print("No Image Picked..");
//   //   }
//   //   Get.back();
//   // }

//   void takephoto(ImageSource source) async {
//     final pickedImage =
//         await imagePicker.pickImage(source: source, imageQuality: 100);
//     // pickedFile = File(pickedImage!.path);
//     // print("imagepath${pickedFile}");
//     editProfileController.setprofilepath(pickedImage!.path);
//     print("image path #############################:${pickedImage.path}");
//     print("picked image #############################:${pickedImage}");
//     // print(pickedFile);
//     Get.back();
//   }
// }
