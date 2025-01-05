import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/commonWidgets/buttons/custom_button.dart';
import 'package:untitled3/core/app_states/app_state_handler_widget.dart';
import 'package:untitled3/features/login/presentation/controllers/login_controller.dart';
import 'package:untitled3/uiHelpers/app_spacing.dart';
import 'package:untitled3/uiHelpers/font_text_style.dart';
import 'package:untitled3/utils/button_enum.dart';
import 'package:untitled3/utils/constant.dart';
import 'package:untitled3/utils/translation_keys.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../commonWidgets/change_lang_btn.dart';
import '../../../../commonWidgets/custom_form_field.dart';
import '../../../../commonWidgets/error_msg_view.dart';
import '../../../../router/routes_constants.dart';
import '../../../../uiHelpers/app_colors.dart';
import '../../../../uiHelpers/icons.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: GetBuilder<LoginController>(
          builder: (loginController) => AppStateHandlerWidget(
            state: loginController.loadingState,
            child: SafeArea(
              child: Form(
                key: loginFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child:
                Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                          child: IntrinsicHeight(
                            child: Container(
                              height: Get.size.height*0.65,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 25.getWidth(), vertical: 2.getHeight()),
                                    child: IntrinsicHeight(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 15.getHeight(),),
                                          Row(
                                            children: [
                                              SvgPicture.asset(AllIcons.palmTreeIcon),
                                              SizedBox(width: 3.getWidth(),),
                                              SvgPicture.asset(AllIcons.rcfa),
                                              const Spacer(),
                                              CustomLangButton(),
                                            ],
                                          ),
                                          SizedBox(height: 20.getHeight(),),
                                          Text(
                                            employeePortal.tr,
                                            style: FontTextStyle.heading2X ,
                                          ),
                                          SizedBox(height: AppSpacing.xs.getHeight(),),
                                          Text(
                                            loginToContinue.tr,
                                            style: FontTextStyle.paragraphLarge.copyWith(color: AppColors.neutral800) ,
                                          ),
                                          loginController.errorSnackBarVisibility? Column(children: [
                                            SizedBox(height: 10.getHeight()),
                                            Visibility(
                                              visible: loginController.errorSnackBarVisibility,
                                              child: ErrorMsgView(title: incorrectUserNameOrPass.tr ),
                                            ),
                                            SizedBox(height: 7.getHeight()),

                                          ],):SizedBox(height: AppSpacing.xl.getHeight(),),

                                          CustomFormField(
                                            controller: loginController.userNameController,
                                            labelText: userName.tr,
                                            isRequired: true,
                                          ),
                                          SizedBox(height: AppSpacing.l.getHeight()),
                                          CustomFormField(
                                            controller: loginController.passwordController,
                                            obscureText: loginController.hidePassword,
                                            suffix: InkWell(
                                              onTap: () => loginController.showPassword(),
                                                    child: Padding(
                                            padding:
                                            const EdgeInsets.symmetric(horizontal: 16),
                                            child: SvgPicture.asset(
                                              loginController.hidePassword
                                                  ? AllIcons.hidePassword
                                                  : AllIcons.eye,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                            isRequired: true,
                                            labelText: password.tr,
                                          ),

                                          SizedBox(height: 18.getHeight()),
                                          GestureDetector(
                                            onTap: () =>  Get.toNamed(
                                                RoutesConstants.forgetPasswordScreen),
                                            child: Align(
                                              alignment: Alignment.centerRight,

                                              child:
                                              Text(
                                                forgetPassword.tr,
                                                style: FontTextStyle.labelMedium.copyWith(
                                                    color: AppColors.primary100 ,
                                                    decoration: TextDecoration.underline,
                                                    decorationColor: AppColors.primary100
                                                )
                                              ),
                                              // ],
                                            ),
                                          ),

                                          // GestureDetector(
                                          //   onTap: (){
                                          //     Get.toNamed(
                                          //         RoutesConstants.verifyIdentityScreen);
                                          //   },
                                          //   child: Align(
                                          //     alignment: Alignment.centerRight,
                                          //
                                          //     child:
                                          //     Text(
                                          //         "verify Identity",
                                          //         style: FontTextStyle.labelMedium.copyWith(
                                          //             color: AppColors.primary100 ,
                                          //             decoration: TextDecoration.underline,
                                          //             decorationColor: AppColors.primary100
                                          //         )
                                          //     ),
                                          //     // ],
                                          //   ),
                                          // ),


                                        ],
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                    ),
                    // const Spacer(),
                    Column(children: [
                      Divider(height: 1.getHeight(),color: AppColors.neutral500,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppSpacing.l.getWidth(), vertical: AppSpacing.m.getHeight()),
                        child: SizedBox(
                          height: 52.getHeight(),
                          width: double.infinity,
                          child:  Obx(() =>CustomButton(
                            key,
                            buttonTitle: login.tr,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              loginController.isLoginButtonActive.value?
                              Get.toNamed(
                                  RoutesConstants.verifyIdentityScreen):
                              loginController.toggleSnackBarVisibility() ;
                            },
                            buttonType: ButtonType.primary,
                            isDisabled: loginController.isLoginButtonActive.value? false : true,
                          )
                          ),
                        ),
                      ),
                    ],)
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
