import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/commonWidgets/buttons/custom_button.dart';
import 'package:untitled3/features/verifyIdentity/presentation/controller/verify_identity_controller.dart';
import 'package:untitled3/uiHelpers/app_spacing.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../commonWidgets/back_button.dart';
import '../../../../commonWidgets/custom_radio_btn.dart';
import '../../../../core/app_states/app_state_handler_widget.dart';
import '../../../../router/routes_constants.dart';
import '../../../../uiHelpers/app_colors.dart';
import '../../../../uiHelpers/font_text_style.dart';
import '../../../../uiHelpers/icons.dart';
import '../../../../utils/button_enum.dart';
import '../../../../utils/constant_keywords.dart';
import '../../../../utils/translation_keys.dart';


class VerifyIdentityScreen extends StatelessWidget {
  VerifyIdentityScreen({Key? key}) : super(key: key);

  final VerifyIdentityController verifyIdentityController = Get.find<VerifyIdentityController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: GetBuilder<VerifyIdentityController>(
          builder: (verifyIdentityController) => AppStateHandlerWidget(
            state: verifyIdentityController.loadingState,
            child:
            SafeArea(
              child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding:  EdgeInsets.symmetric(
                            horizontal:  AppSpacing.l.getWidth(),
                            vertical: AppSpacing.xs.getHeight()),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomBackButton(),
                            SizedBox(height: 20.getHeight()),
                            Text(
                              verifyIdentity.tr,
                              style: FontTextStyle.heading2X ,

                            ),
                            SizedBox(height: 5.getHeight()),
                            Text(
                              otpSelectionMethod.tr,
                              style: FontTextStyle.paragraphLarge.copyWith(color: AppColors.neutral800),
                            ),


                            SizedBox(height: 25.getHeight()),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                CustomRadioButton(
                                    label: sendMobile.tr,
                                    icon: AllIcons.mobileIcon
                                        ,
                                    isSelected:
                                    verifyIdentityController.selectedOption == ConstantKeys.sendMobileOption ,
                                    onTap: () {
                                      verifyIdentityController.clickMobileBtn();
                                    }
                                ),
                                SizedBox(height: 15.getHeight(),),
                                CustomRadioButton(
                                    label: sendEmail.tr,
                                    icon: AllIcons.emailIcon,
                                    isSelected:
                                    verifyIdentityController.selectedOption == ConstantKeys.sendEmailOption,
                                    onTap: () {
                                      verifyIdentityController.clickEmailBtn();
                                    }
                                ),
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                    Column(children: [
                      Divider(height: 1.getHeight(),color: AppColors.neutral500,),
                      Padding(
                        padding:  EdgeInsets.symmetric(
                            horizontal:  AppSpacing.l.getWidth(),
                            vertical: AppSpacing.m.getHeight()),
                        child:  Obx(() =>CustomButton(
                            key,
                            buttonTitle: sendCode.tr,
                            padding: EdgeInsets.zero,

                            onPressed: () {
                              verifyIdentityController.selectedOption != 0 ? Get.toNamed(
                                  RoutesConstants.otpScreen , arguments: verifyIdentityController.selectedOption  ) : null;
                            },
                            isDisabled:verifyIdentityController.isSendButtonActive.value? false: true,
                            buttonType: ButtonType.primary,

                          ),
                        ),
                      ),
                    ],)

                  ],
                ),
              ),
            )

          ),
        ),

    );
  }
}
