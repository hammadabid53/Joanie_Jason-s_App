import 'package:flutter/material.dart';

import 'package:getxpractice/utils/app_assets_path.dart';

import 'package:getxpractice/utils/app_color.dart';
import 'package:getxpractice/utils/app_strings.dart';

class CustomAuthBackgroundWidget extends StatefulWidget {
  final bool backIconEnable;
  final bool isnavibarEnable;

  const CustomAuthBackgroundWidget({
    this.isnavibarEnable = true,
    this.backIconEnable = true,
  });

  @override
  State<CustomAuthBackgroundWidget> createState() =>
      _CustomAuthBackgroundWidgetState();
}

class _CustomAuthBackgroundWidgetState
    extends State<CustomAuthBackgroundWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.BGAPPCOLOR,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.black,
              )
            ],
          ),
        ));
  }
}
