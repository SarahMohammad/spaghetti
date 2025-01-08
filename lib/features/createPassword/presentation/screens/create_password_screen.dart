import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/core/app_states/app_state_handler_widget.dart';
import 'package:untitled3/uiHelpers/app_spacing.dart';
import 'package:untitled3/uiHelpers/font_text_style.dart';
import 'package:untitled3/utils/button_enum.dart';
import 'package:untitled3/utils/constant.dart';
import 'package:untitled3/utils/translation_keys.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../commonWidgets/back_button.dart';
import '../../../../commonWidgets/buttons/custom_button.dart';
import '../../../../commonWidgets/custom_form_field.dart';
import '../../../../commonWidgets/error_msg_view.dart';
import '../../../../router/routes_constants.dart';
import '../../../../uiHelpers/app_colors.dart';
import '../../../../uiHelpers/icons.dart';
import '../controllers/create_password_controller.dart';

class CreatePasswordScreen  extends StatelessWidget {
  CreatePasswordScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: GetBuilder<CreatePasswordController>(
          builder: (createPasswordController) => AppStateHandlerWidget(
            state: createPasswordController.loadingState,
            child: SafeArea(
              child: Form(
                key: loginFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: IntrinsicHeight(
                          child: Column(children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.getWidth(), vertical: 2.getHeight()),
                              child: IntrinsicHeight(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomBackButton(),
                                    SizedBox(height: 20.getHeight(),),
                                    Text(
                                      createNewPassword.tr,
                                      style: FontTextStyle.heading2X ,
                                    ),

                                    SizedBox(height: 10.getHeight()),
                                    Visibility(
                                      visible: createPasswordController.errorSnackBarVisibility,
                                      child: ErrorMsgView(title: incorrectUserNameOrPass.tr ),
                                    ),
                                    SizedBox(height: 7.getHeight()),
                                    CustomFormField(
                                      controller: createPasswordController.newPasswordController,
                                      hintText: enterUserName.tr,
                                      obscureText: createPasswordController.hidePassword,
                                      suffix: InkWell(
                                        onTap: () => createPasswordController.showPassword(),
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.symmetric(horizontal: 16),
                                          child: SvgPicture.asset(
                                            createPasswordController.hidePassword
                                                ? AllIcons.hidePassword
                                                : AllIcons.eye,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      isRequired: true,
                                      labelText: newPassword.tr,

                                    ),
                                    SizedBox(height: AppSpacing.l.getHeight()),
                                    CustomFormField(
                                      controller: createPasswordController.confirmNewPasswordController,
                                      hintText: enterPassword.tr,
                                      obscureText: createPasswordController.hidePassword,
                                      suffix: InkWell(
                                        onTap: () => createPasswordController.showPassword(),
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.symmetric(horizontal: 16),
                                          child: SvgPicture.asset(
                                            createPasswordController.hidePassword
                                                ? AllIcons.hidePassword
                                                : AllIcons.eye,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      labelText: confirmNewPassword.tr,
                                      isRequired: true,
                                    ),
                                  ],
                                ),

                              ),
                            ),
                            const Spacer(),
                          ],),
                        ),
                      ),
                    ),

                    Column(
                      children: [

                        Divider(height: 1.getHeight(),color: AppColors.neutral500,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: AppSpacing.l.getWidth(), vertical: AppSpacing.m.getHeight()),
                          child: Obx(() =>CustomButton(
                            key,
                            radius: 40,
                            buttonTitle: resetPassword.tr,
                            padding: EdgeInsets.zero,
                            // backgroundColor: createPasswordController.isLoginButtonActive.value?
                            // AppColors.primary100 :
                            // AppColors.neutral500,
                            onPressed: () {
                              createPasswordController.isLoginButtonActive.value?
                              Get.toNamed(
                                  RoutesConstants.requestSentScreen):
                              createPasswordController.toggleSnackBarVisibility() ;
                            },
                            buttonType: ButtonType.primary,
                            isDisabled:createPasswordController.isLoginButtonActive.value? false:true,
                          )
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
