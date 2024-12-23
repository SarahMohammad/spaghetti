import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../UIHelpers/icons.dart';
import '../../../UIHelpers/images.dart';
import '../../../core/app_states/app_state_handler_widget.dart';
import '../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GetBuilder<HomeController>(
        //NOTE => AppStateHandlerWidget must be placed inside GetBuilder to get updated
        builder: (homeController) => AppStateHandlerWidget(
          state: homeController.loadingState,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                Images.headerImg,
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 25.getWidth(),
                                  top: 60.getHeight(),
                                  right: 28.getHeight(),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "kk"
                                    ),

                                      GestureDetector(
                                        onTap: () {
                                          // Get.toNamed(RoutesConstants
                                          //     .notificationScreen);
                                        },
                                        child: Container(
                                          width: 40.getWidth(),
                                          height: 40.getHeight(),
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,

                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: SvgPicture.asset(
                                              AllIcons.palmTreeIcon,
                                              //   AllIcons.notification
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      )
                                  ],
                                ),
                              ),
                              SizedBox(height: 35.getHeight()),

                              SizedBox(height: 60.getHeight()),
                            ],
                          ),
                        ),
                        SizedBox(height: Get.height + 50),
                      ],
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}