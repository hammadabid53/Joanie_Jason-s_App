import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getxpractice/Modular/auth/Controllers.dart/PaymentController/Add_Card_Controller.dart';
import 'package:getxpractice/Modular/auth/Controllers.dart/PaymentController/Default_Card_Controller.dart';
import 'package:getxpractice/Modular/auth/Controllers.dart/PaymentController/Get_Card_Controller.dart';
import 'package:getxpractice/utils/app_assets_path.dart';
import 'package:getxpractice/utils/app_color.dart';
import 'package:getxpractice/utils/constant.dart';
import 'package:getxpractice/utils/validations/card_validation/card_validation.dart';
import 'package:getxpractice/view/Screens/core_module/payment_screens/Card_widget/card_field_widget.dart';
import 'package:getxpractice/view/Screens/core_module/payment_screens/checkout.dart';

import '../../../../Modular/auth/Controllers.dart/PaymentController/Deleted_Card_Controller.dart';
import '../../../../Resuable_widgets/appbar.dart/custom_appbar.dart';
import '../../../../Resuable_widgets/custom_app_button.dart';
import '../../../../Resuable_widgets/custom_text_widget.dart';
import '../../../../utils/app_route_name.dart';
import '../../../../utils/app_strings.dart';

TextEditingController id = TextEditingController();
TextEditingController expMonth = TextEditingController();
TextEditingController expYear = TextEditingController();
TextEditingController cvv = TextEditingController();

class CardDetails extends StatefulWidget {
  CardDetails({Key? key}) : super(key: key);

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

bool checkbox = false;

class _CardDetailsState extends State<CardDetails> {
  @override
  void initState() {
    GetCardController.g.GetCard();
    super.initState();
  }

  int? _value = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.BGAPPCOLOR,
      appBar: CustomAppBar(
        onTap: () {
          Get.toNamed(AppRouteName.HOME_PAGES_ROUTE);
        },
        LeadingIconImage: AssetPaths.BACK_ICON,
        headingtitle: AppStrings.CARD_DETAILS_TEXT,
      ),
      body: Padding(
        padding: EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            CardFieldWidget(
              controller: id,
              titlename: AppStrings.CARD_NUMBER_TEXT,
            ),
            Row(
              children: [
                Container(
                  width: 0.40.sw,
                  child: CardFieldWidget(
                    controller: expMonth,
                    titlename: AppStrings.EXP_MONTH_TEXT,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                  width: 0.45.sw,
                  child: CardFieldWidget(
                    controller: expYear,
                    titlename: AppStrings.EXP_YEAR_TEXT,
                  ),
                ),
              ],
            ),
            CardFieldWidget(
              controller: cvv,
              titlename: AppStrings.CVV_TEXT,
            ),
            _addcardbtn(),
            _Divider(),
            GetBuilder<GetCardController>(
                builder: (controller) => _stripepaymentmethod())
          ],
        ),
      ),
    );
  }

  Widget _stripepaymentmethod() {
    return GetCardController.g.getCardModel == null
        ? Expanded(
            child: Center(
            child: CustomTextWidget(
              text: "Sorry! No list Found please Add Card First",
              textColor: AppColor.RED_COLOR,
              fontWeight: FontWeight.bold,
              fontSize: 1.5.sp,
            ),
          ))
        : Expanded(
            child: ListView.builder(
                itemCount: GetCardController.g.getCardModel!.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                      background: Container(
                        color: AppColor.RED_COLOR,
                        child: Center(
                          child: Icon(
                            Icons.delete,
                          ),
                        ),
                      ),
                      direction: DismissDirection.endToStart,
                      key: Key(GetCardController.g.getCardModel!.data!.length
                          .toString()),
                      onDismissed: (direction) {
                        DeleteCardController.d.DeleteCard(GetCardController
                            .g.getCardModel!.data![index].id
                            .toString());

                        setState(() {
                          GetCardController.g.getCardModel?.data!
                              .removeAt(index);
                        });
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: (() {
                                print(
                                    "clickedddddddddddddd yaha se checkout page pr jayega");
                                Get.to(CheckOut(
                                    data: GetCardController
                                        .g.getCardModel!.data![index]));
                              }),
                              child: Container(
                                  height: 0.05.sh,
                                  width: 0.75.sw,
                                  decoration: BoxDecoration(
                                      color: AppColor.WHITE_COLOR,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          scale: 1.8.sp,
                                          AssetPaths.STRIPE_ICON,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      CustomTextWidget(
                                        text: GetCardController.g.getCardModel!
                                            .data![index].cardNumber!
                                            .toString(),
                                        textColor: AppColor.BLACK_COLOR,
                                        fontSize: 1.2.sp,
                                      ),
                                    ],
                                  )),
                            ),
                            GetBuilder<DefaultCardController>(
                                builder: (controller) => Radio(
                                      value: index,
                                      groupValue: _value,
                                      activeColor: GetCardController
                                                  .g
                                                  .getCardModel
                                                  ?.data?[index]
                                                  .cardNumber ==
                                              1
                                          ? Color(0xFF6200EE)
                                          : AppColor.DARK_BROWN_COLOR,
                                      onChanged: (int? value) {
                                        print("valuesssssssss:${value}");
                                        print(
                                            "is status  phele ka: ############################${GetCardController.g.getCardModel!.data![index].isActive}");
                                        setState(() {
                                          _value = value;
                                        });
                                        DefaultCardController.c.DefaultCard(
                                            GetCardController.g.getCardModel!
                                                .data![index].cardNumber!
                                                .toString());

                                        GetCardController.g.refresh();

                                        print(
                                            "is status badd jka: ############################${GetCardController.g.getCardModel!.data![index].isActive}");
                                      },
                                    ))
                          ]));
                }));
  }

  Widget _Divider() {
    return const Divider(
      color: AppColor.BLACK_COLOR,
    );
  }

  Widget _addcardbtn() {
    return GetBuilder<AddCardController>(
        builder: (controller) => CustomAppBtn(
            onclickPressed: () async {
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
              bool val = Cardvalidation.CardVaidation(
                cardNumber: id,
                expMonth: expMonth,
                expYear: expYear,
                Cvv: cvv,
              );

              if (val) {
                await AddCardController.c
                    .AddCard(id.text, expMonth.text, expYear.text, cvv.text);
                GetCardController.g.refresh();
              }
            },
            title: AppStrings.ADDCARD_BTN));
  }
}
