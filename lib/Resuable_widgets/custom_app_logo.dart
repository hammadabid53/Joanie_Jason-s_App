import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:getxpractice/utils/app_assets_path.dart';

class CustomAppLogo extends StatelessWidget {
  double height;
  double width;
  CustomAppLogo({required this.height, required this.width, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Entry.scale(
          delay: Duration.zero,
          curve: Curves.bounceOut,
          duration: const Duration(seconds: 4),
          child: Entry.scale(
            delay: Duration.zero,
            curve: Curves.fastOutSlowIn,
            duration: const Duration(seconds: 2),
            child: SizedBox(
                height: height,
                width: width,
                child: Image.asset(AssetPaths.JOANIE_LOGO)),
          ),
        )
      ],
    );
  }
}
