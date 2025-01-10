import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:untitled3/commonWidgets/state_indicator.dart';
import 'package:untitled3/features/services/presentation/controller/services_route_mapping.dart';
import 'package:untitled3/router/routes_constants.dart';
import 'package:untitled3/uiHelpers/app_spacing.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../../UIHelpers/icons.dart';
import '../../../../../UIHelpers/images.dart';
import '../../../../../commonWidgets/back_button.dart';
import '../../../../../commonWidgets/buttons/custom_button.dart';
import '../../../../../core/app_states/app_state_handler_widget.dart';
import '../../../../../uiHelpers/app_colors.dart';
import '../../../../../utils/button_enum.dart';
import '../../../../../utils/translation_keys.dart';
import '../controller/request_form_controller.dart';
import '../widgets/project_request_summery.dart';

class RequestSubmitScreen extends StatelessWidget {
  RequestSubmitScreen({super.key});

  // final RequestFormController requestFormController =
  //     Get.find<RequestFormController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkWhite,
      body: Stack(
        children: [
          Positioned.fill(
            top: -MediaQuery.of(context).size.height * 0.5,
            child: Image.asset(
              Images.patterns,
            ),
          ),
          GetBuilder<RequestFormController>(
            builder: (requestFormController) => AppStateHandlerWidget(
              state: requestFormController.loadingState,
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // CustomBackButton(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height -
                            140.getHeight(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            StateIndicator(
                              middleIcon: SvgPicture.asset(AllIcons.checkIcon),
                              fillColor: AppColors.darkGreen,
                              description: 'If your information is validated, '
                                  'a reset link will be sent to your RCU email and phone. '
                                  'Use it to reset your password.',
                              borderColor: AppColors.lightGreen,
                              title: requestSent.tr,
                            ),
                            Spacer(),
                            ProjectRequestSummery(
                                requestForVal: 'Ali Al Ghafli',
                                pendingOnVal: 'Ali Al Ghafli',
                                requestId: "REQ 122812",
                                workingDays: "4 business days"),
                            const Spacer(),
                            CustomButton(
                              key,
                              buttonTitle: trackRequest.tr,
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                ServicesRouteMapping.navigateToDetailsScreen();
                                // Get.toNamed(RoutesConstants.projectRequestFormDetails , );
                              },
                              isDisabled: false,
                              buttonType: ButtonType.primary,
                            ),
                            SizedBox(
                              height: AppSpacing.m.getHeight(),
                            ),
                            CustomButton(
                              key,
                              buttonTitle: goToHome.tr,
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              isDisabled: false,
                              buttonType: ButtonType.secondary,
                            ),
                            // SizedBox(height: AppSpacing.m.getHeight(),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
