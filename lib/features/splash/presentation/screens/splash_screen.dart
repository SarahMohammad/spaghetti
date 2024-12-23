import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:untitled3/UIHelpers/icons.dart';
import 'package:untitled3/commonWidgets/bottomSheet/bottom_sheet_action.dart';
import 'package:untitled3/features/splash/presentation/controller/splash_controller.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../uiHelpers/images.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final SplashController splashController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image:AssetImage(Images.splashBackground),
                fit: BoxFit.cover,
              ),
            ),
          ),



          Center(
            child: Image.asset(Images.logoVertical,
              width: Get.size.width-28.getWidth(),
            ),
          ),
          // Bottom image
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                Images.splashBottom,
                width: Get.size.width-10.getWidth(),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
