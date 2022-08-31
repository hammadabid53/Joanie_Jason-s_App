import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getxpractice/utils/app_assets_path.dart';
import 'package:getxpractice/utils/constant.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../Modular/auth/Controllers.dart/CoreController/GetResturant/GetResController.dart';
import '../../../../Resuable_widgets/appbar.dart/custom_appbar.dart';
import '../../../../Resuable_widgets/bot_toast/loading.dart';
import '../../../../Resuable_widgets/custom_text_widget.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_route_name.dart';
import '../../../../utils/app_strings.dart';
import 'Timings_widget.dart/timings.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  Completer<GoogleMapController> _controller = Completer();
  // static final CameraPosition _kgooglePlex  =
  //     const CameraPosition(target: LatLng(45.521563, -122.677433), zoom: 14);

  Marker _createMarker(LatLng? pinAddress) {
    return Marker(
      markerId: MarkerId('marker_1 ${pinAddress!.latitude.toString()}'),
      position: pinAddress,
    );
  }

  @override
  void initState() {
    for (int i = 0; i < 1; i++) {
      longitude.add(
        GetResController.i.getResModel!.resturant![i].location!.latitude!,
      );
      latitude.add(
          GetResController.i.getResModel!.resturant![i].location!.latitude!);

      markers.add(Marker(
        markerId: MarkerId('Marker1'),
        position: LatLng(24.881731, 67.111659),
      ));
    }
    super.initState();
  }

  List<double> id = [];
  List<Marker> markers = [];
  List<double> longitude = [];
  List<double> latitude = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          onTap: () {
            Get.toNamed(AppRouteName.HOME_PAGES_ROUTE);
          },
          LeadingIconImage: AssetPaths.BACK_ICON,
          headingtitle: AppStrings.CONTACT_US_TEXT,
        ),
        body: Padding(
          padding: EdgeInsets.all(kDefaultPadding),
          child: GetBuilder<GetResController>(
            builder: (controller) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _locationcontainer(),
              ],
            ),
          ),
        ));
  }

  Widget _locationcontainer() {
    return GetResController.i.getResModel == null
        ? Expanded(
            child: Container(
            child: showLoading(),
          ))
        : Expanded(
            child: ListView.builder(
                shrinkWrap: true, //Added
                itemCount: GetResController.i.getResModel!.resturant!.length,
                itemBuilder: (context, index) {
                  print("indexxxxxxxxxxxxxxxx${index}");
                  print(
                      "GetResController.i.getResModel!.resturant!.length : ${GetResController.i.getResModel!.resturant!.length}");

                  return Container(
                      margin: EdgeInsets.only(
                        top: kDefaultPadding,
                      ),
                      // height: 0.60.sh,
                      width: 1.sw,
                      decoration: BoxDecoration(
                        color: AppColor.WHITE_COLOR,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // IconButton(
                          //     onPressed: () {
                          //       print(
                          //           "mere latitue #########${GetResController.i.getResModel!.resturant![0].location!.latitude!}");
                          //       print(
                          //           "mere longitude #########${GetResController.i.getResModel!.resturant![0].location!.longitude!}");
                          //     },
                          //     icon: Icon(Icons.abc_outlined)),
                          Padding(
                            padding: EdgeInsets.only(
                                top: kDefaultPadding, left: kDefaultPadding),
                            child: CustomTextWidget(
                              text: AppStrings.LOCATION_TEXT,

                              /// + '$index',
                              fontSize: 1.5.sp,
                              textColor: AppColor.BLACK_COLOR,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              margin: EdgeInsets.only(
                                top: kDefaultPadding,
                              ),
                              height: 0.20.sh,
                              width: 1.sw,
                              decoration: BoxDecoration(
                                // color: AppColor.GREY_COLOR,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: GoogleMap(
                                initialCameraPosition: CameraPosition(
                                    target: LatLng(
                                        GetResController
                                            .i
                                            .getResModel!
                                            .resturant![index]
                                            .location!
                                            .latitude!,
                                        GetResController
                                            .i
                                            .getResModel!
                                            .resturant![index]
                                            .location!
                                            .longitude!),
                                    zoom: 14),
                                markers: <Marker>{
                                  _createMarker(LatLng(
                                      GetResController
                                          .i
                                          .getResModel!
                                          .resturant![index]
                                          .location!
                                          .latitude!,
                                      GetResController
                                          .i
                                          .getResModel!
                                          .resturant![index]
                                          .location!
                                          .longitude!))
                                },

//                                  Marker(
//   markerId: MarkerId("Child $a"),
//   position: LatLng(
//       double.parse(AuthController.i.childrenLocationModel
//           .value.data!.students![a].home_latitude!),
//       double.parse(AuthController.i.childrenLocationModel
//           .value.data!.students![a].home_longitude!)),
// ),
                                // Set<Marker>.of(markers),
                                mapType: MapType.normal,
                                myLocationButtonEnabled: false,
                                compassEnabled: false,
                                onMapCreated: (GoogleMapController controller) {
                                  _controller.complete(controller);
                                },
                              ),
                            ),
                          ),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(10),
                                width: 0.45.sw,
                                height: 0.20.sh,
                                // color: AppColor.DARK_GREY,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextWidget(
                                      text: AppStrings.TIMINGS_TEXT,
                                      fontSize: 1.5.sp,
                                      textColor: AppColor.BLACK_COLOR,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    TimingsFields(
                                      Day: AppStrings.MONDAY_TIMINGS_TEXT,
                                      TimingText: GetResController
                                          .i
                                          .getResModel!
                                          .resturant![index]
                                          .timings!
                                          .monday!
                                          .mOpenTime
                                          .toString(),
                                      Dayopenclose: GetResController
                                          .i
                                          .getResModel!
                                          .resturant![index]
                                          .timings!
                                          .monday!
                                          .mCloseTime
                                          .toString(),
                                    ),
                                    TimingsFields(
                                      Day: AppStrings.TUESDAY_TIMINGS_TEXT,
                                      TimingText: GetResController
                                          .i
                                          .getResModel!
                                          .resturant![index]
                                          .timings!
                                          .tuesday!
                                          .tOpenTime
                                          .toString(),
                                      Dayopenclose: GetResController
                                          .i
                                          .getResModel!
                                          .resturant![index]
                                          .timings!
                                          .tuesday!
                                          .tCloseTime
                                          .toString(),
                                    ),
                                    TimingsFields(
                                      Day: AppStrings.WEDNESDAY_TIMINGS_TEXT,
                                      TimingText: GetResController
                                          .i
                                          .getResModel!
                                          .resturant![index]
                                          .timings!
                                          .wednesday!
                                          .wOpenTime
                                          .toString(),
                                      Dayopenclose: GetResController
                                          .i
                                          .getResModel!
                                          .resturant![index]
                                          .timings!
                                          .wednesday!
                                          .wCloseTime
                                          .toString(),
                                    ),
                                    TimingsFields(
                                      Day: AppStrings.THURSDAY_TIMINGS_TEXT,
                                      TimingText: GetResController
                                          .i
                                          .getResModel!
                                          .resturant![index]
                                          .timings!
                                          .thursday!
                                          .tHOpenTime
                                          .toString(),
                                      Dayopenclose: GetResController
                                          .i
                                          .getResModel!
                                          .resturant![index]
                                          .timings!
                                          .thursday!
                                          .tHCloseTime
                                          .toString(),
                                    ),
                                    TimingsFields(
                                      Day: AppStrings.FRIDAY_TIMINGS_TEXT,
                                      TimingText: GetResController
                                          .i
                                          .getResModel!
                                          .resturant![index]
                                          .timings!
                                          .friday!
                                          .fOpenTime
                                          .toString(),
                                      Dayopenclose: GetResController
                                          .i
                                          .getResModel!
                                          .resturant![index]
                                          .timings!
                                          .friday!
                                          .fCloseTime
                                          .toString(),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Container(
                                height: 0.15.sh,
                                margin: const EdgeInsets.only(top: 10),
                                // color: AppColor.BLACK_COLOR,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextWidget(
                                      text: AppStrings.CONTACT_TEXT,
                                      fontSize: 1.5.sp,
                                      textColor: AppColor.BLACK_COLOR,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    CustomTextWidget(
                                      text: GetResController.i.getResModel!
                                          .resturant![index].resPhone
                                          .toString(),
                                      fontSize: 1.sp,
                                      textColor: AppColor.DARK_BROWN_COLOR,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    CustomTextWidget(
                                      text: GetResController.i.getResModel!
                                          .resturant![index].resEmail,
                                      fontSize: 1.sp,
                                      textColor: AppColor.DARK_BROWN_COLOR,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ));
                }),
          );
  }
}
