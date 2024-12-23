import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:untitled3/commonWidgets/buttons/custom_button.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../commonWidgets/back_button.dart';
import '../../../../commonWidgets/count_down_timer.dart';
import '../../../../core/app_enums.dart';
import '../../../../core/app_states/app_state_handler_widget.dart';
import '../../../../uiHelpers/app_colors.dart';
import '../../../../uiHelpers/font_text_style.dart';
import '../../../../utils/button_enum.dart';
import '../../../../utils/translation_keys.dart';
import '../controller/otp_controller.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({
    super.key,
    this.retry,
  });

  final OtpController otpController = Get.find<OtpController>();
  final otpFormKey = GlobalKey<FormState>();
  final void Function()? retry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: GetBuilder<OtpController>(
          builder: (otpController) => AppStateHandlerWidget(
              state: otpController.loadingState,
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomBackButton(),
                      SizedBox(height: 20.getHeight()),
                      Text(
                        verifyIdentity.tr,
                        style: FontTextStyle.heading2X,
                      ),
                      SizedBox(height: 5.getHeight()),
                      Text(
                        '${codeSentTo.tr} +966 4094 55 9049',
                        style: FontTextStyle.paragraphLarge
                            .copyWith(color: AppColors.neutral800),
                      ),
                      SizedBox(height: 30.getHeight()),

                      Form(
                        key: otpFormKey,
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Directionality(
                              textDirection: TextDirection.ltr,
                              child: PinCodeTextField(
                                appContext: context,
                                autoDisposeControllers: false,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                //textStyle:
                                //  FontTextStyle.title32MuseoSans_700,
                                length: 4,
                                obscureText: false,
                                blinkWhenObscuring: true,
                                animationType: AnimationType.fade,
                                enablePinAutofill: true,
                                validator: (String? val) {
                                  // return ValidationUtils
                                  //     .otpNumberValidation(val);
                                },
                                // errorTextDirection: Get.locale.toString() ==
                                //     ConstantKeys.englishLang
                                //     ? TextDirection.ltr
                                //     : TextDirection.rtl,
                                controller: otpController.pinCodeController,
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  // inactiveColor: oTPController.isValid.value
                                  //     ? DefaultThemeColors.greyColor
                                  //     : Colors.red,
                                  // activeColor: oTPController.isValid.value
                                  //     ? DefaultThemeColors.greyColor
                                  //     : Colors.red,

                                  inactiveColor: AppColors.neutral500,
                                  activeFillColor: Colors.white,
                                  inactiveFillColor: Colors.white,
                                  selectedFillColor: Colors.white,
                                  errorBorderColor: AppColors.negative500,
                                  disabledColor: AppColors.neutral500,
                                  activeColor: AppColors.brand500,

                                  // disabledColor: oTPController.isValid.value
                                  //     ? DefaultThemeColors.blueGrey
                                  //     : Colors.red,
                                  borderWidth: 2,
                                  borderRadius: BorderRadius.circular(8),
                                  fieldHeight: 62,
                                  fieldWidth: 48,
                                ),
                                errorTextSpace: 24.getHeight(),
                                cursorColor: Colors.black,
                                animationDuration: const Duration(
                                  milliseconds: 300,
                                ),
                                enableActiveFill: true,
                                keyboardType: TextInputType.number,
                                onCompleted: (v) {},
                                onChanged: (value) {},
                                beforeTextPaste: (text) {
                                  return true;
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      otpController.isValidRetrySendOtp &&
                              otpController.retrySendCounter <= 3
                          ? Align(
                              alignment: Alignment.topLeft,
                              child:  InkWell(
                                child: Text(
                                     resendCode.tr,
                                  style: FontTextStyle.labelMedium.copyWith(
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.primary100,
                                    color: AppColors.primary100,
                                  ),
                                ),
                                onTap: (){
                                  retry!();
                                },
                              ),
                        // RichText(
                              //   text: TextSpan(
                              //     children: [
                              //       TextSpan(
                              //           text: resendCode.tr,
                              //           style: FontTextStyle.labelLarge
                              //               .copyWith(
                              //                   color: AppColors.neutral900),
                              //           recognizer: TapGestureRecognizer()
                              //             ..onTap = () {
                              //               retry!();
                              //             }),
                              //     ],
                              //   ),
                              // ),
                            )
                          : otpController.loadingState != AppState.loading &&
                                  otpController.retrySendCounter <= 3
                              ? Obx(
                                  () => Align(
                                    alignment: Alignment.topLeft,
                                    child: CountDownTimerWidget(
                                      isValid: otpController.isValid.value,
                                      seconds: otpController.otpDurationSec,
                                      onEnd: otpController.otpDurationSec == 0
                                          ? null
                                          : () => otpController.onEnd(),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                      Row(
                        children: [
                           SvgPicture.asset(
                            otpController.getVerificationMethodIcon(), // Prefix Icon
                            color: AppColors.primary100, // Customize icon color
                          ),
                          const SizedBox(width: 8),
                          // Add space between icon and text
                          Text(
                            otpController.getVerificationMethod(),
                            style: FontTextStyle.labelMedium.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primary100,
                              color: AppColors.primary100,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25.getHeight()),
                      const Spacer(),
                      SizedBox(
                        height: 52.getHeight(),
                        width: double.infinity,
                        child: Obx(() => CustomButton(
                              key,
                              buttonTitle: verify.tr,
                              padding: EdgeInsets.zero,

                              onPressed: () {
                                // VerifyIdentityController.selectedOption != 0 ? Get.toNamed(
                                //     RoutesConstants.loginScreen) : null;
                              },
                          isDisabled:otpController.isSendButtonActive.value? false: true,
                          buttonType: ButtonType.primary,
                            )),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
