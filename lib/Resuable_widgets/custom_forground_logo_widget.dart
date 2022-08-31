import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_assets_path.dart';

class CustomForegroundLogoWidget extends StatelessWidget {
  final double? logoWidth, logoHeight;
  final bool animation;

  const CustomForegroundLogoWidget(
      {this.logoWidth, this.logoHeight, this.animation = false});

  @override
  Widget build(BuildContext context) {
    return animation == true
        ? Entry.scale(
            delay: Duration.zero,
            curve: Curves.bounceOut,
            duration: const Duration(seconds: 4),
            child: Entry.scale(
                curve: Curves.fastOutSlowIn,
                duration: const Duration(seconds: 2),
                child: _LogoWidget()))
        : _LogoWidget();
  }

  Widget _LogoWidget() {
    return Container(
      width: logoWidth ?? 0.29.sw,
      height: logoHeight ?? 0.18.sh,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetPaths.JOANIE_LOGO), fit: BoxFit.contain)),
    );
  }
}
