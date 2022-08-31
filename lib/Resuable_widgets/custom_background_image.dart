import 'package:flutter/material.dart';

import '../utils/app_assets_path.dart';


class BackgroundImage extends StatelessWidget {
  final Widget? child;
  Key? key;
  BackgroundImage({
    this.key,
   this.child,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AssetPaths.APP_BACKGROUND_IMAGE),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: Center(child: child),
      ),
    );
  }
}
