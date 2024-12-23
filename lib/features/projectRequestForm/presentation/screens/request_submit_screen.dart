import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:untitled3/commonWidgets/state_indicator.dart';
import 'package:untitled3/features/projectRequestForm/presentation/controller/request_form_controller.dart';
import 'package:untitled3/router/routes_constants.dart';
import 'package:untitled3/uiHelpers/app_spacing.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../commonWidgets/back_button.dart';
import '../../../../commonWidgets/buttons/custom_button.dart';
import '../../../../core/app_states/app_state_handler_widget.dart';
import '../../../../uiHelpers/app_colors.dart';
import '../../../../uiHelpers/icons.dart';
import '../../../../utils/button_enum.dart';
import '../widgets/project_request_summery.dart';

class RequestSubmitScreen extends StatelessWidget {
  RequestSubmitScreen({super.key});

  // final RequestFormController requestFormController =
  //     Get.find<RequestFormController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkWhite,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: GetBuilder<RequestFormController>(
          builder: (requestFormController) => AppStateHandlerWidget(
            state: requestFormController.loadingState,
            child: SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomBackButton(),
                  Container(
                    height:
                        MediaQuery.of(context).size.height - 140.getHeight(),
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
                          title: 'Request sent',
                        ),
                        Spacer(),
                        ProjectRequestSummery(),
                        Spacer(),
                        SizedBox(
                          height: 52.getHeight(),
                          width: double.infinity,
                          child: CustomButton(
                            key,
                            buttonTitle: "track request",
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              Get.toNamed(RoutesConstants.projectRequestFormDetails);
                            },
                            isDisabled: false,
                            buttonType: ButtonType.primary,
                          ),
                        ),
                        SizedBox(height: AppSpacing.m.getHeight(),),
                        SizedBox(
                          height: 52.getHeight(),
                          width: double.infinity,
                          child: CustomButton(
                            key,
                            buttonTitle: "go to home",
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            isDisabled: false,
                            buttonType: ButtonType.secondary,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }
}
