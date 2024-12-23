import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:untitled3/commonWidgets/state_indicator.dart';
import 'package:untitled3/features/forgetPassword/presentation/controller/forget_password_controller.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../commonWidgets/back_button.dart';
import '../../../../commonWidgets/buttons/custom_button.dart';
import '../../../../core/app_states/app_state_handler_widget.dart';
import '../../../../uiHelpers/app_colors.dart';
import '../../../../uiHelpers/font_text_style.dart';
import '../../../../uiHelpers/icons.dart';
import '../../../../utils/button_enum.dart';
import '../../../../utils/translation_keys.dart';

class RequestSentScreen extends StatelessWidget {
  RequestSentScreen({super.key});

  final ForgetPasswordController forgetPasswordController =
      Get.find<ForgetPasswordController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: GetBuilder<ForgetPasswordController>(
          builder: (forgetPasswordController) => AppStateHandlerWidget(
            state: forgetPasswordController.loadingState,
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
                        SizedBox(height: 140.getHeight()),
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
                        SizedBox(
                          height: 52.getHeight(),
                          width: double.infinity,
                          child: Obx(() => CustomButton(
                                key,
                                buttonTitle: sendRequest.tr,
                                padding: EdgeInsets.zero,
                                isDisabled: forgetPasswordController
                                        .isSendRequestButtonActive.value
                                    ? false
                                    : true,
                                buttonType: ButtonType.primary,
                                onPressed: () {
                                  // forgetPasswordController.isSendRequestButtonActive.value?
                                  // Get.toNamed(
                                  //     RoutesConstants.verifyIdentityScreen):
                                  // loginController.toggleSnackBarVisibility() ;
                                },

                              )),
                        ),
                        SizedBox(height: 15.getHeight()),
                        Text(
                          'Didn’t get the link? Check your spam or ',
                          style: FontTextStyle.paragraphLarge
                              .copyWith(color: AppColors.neutral800),
                        ),
                        SizedBox(height: 15.getHeight()),
                        Text('Resend email',
                            style: FontTextStyle.labelLarge.copyWith(
                                color: AppColors.primary100,
                                decorationColor: AppColors.primary100,
                                decoration: TextDecoration.underline),
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
