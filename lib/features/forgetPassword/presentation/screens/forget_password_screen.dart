import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:untitled3/features/forgetPassword/presentation/controller/forget_password_controller.dart';
import 'package:untitled3/utils/button_enum.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../commonWidgets/back_button.dart';
import '../../../../commonWidgets/buttons/custom_button.dart';
import '../../../../commonWidgets/custom_form_field.dart';
import '../../../../core/app_states/app_state_handler_widget.dart';
import '../../../../router/routes_constants.dart';
import '../../../../uiHelpers/app_colors.dart';
import '../../../../uiHelpers/app_spacing.dart';
import '../../../../uiHelpers/font_text_style.dart';
import '../../../../uiHelpers/icons.dart';
import '../../../../utils/translation_keys.dart';


class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final ForgetPasswordController forgetPasswordController = Get.find<ForgetPasswordController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: GetBuilder<ForgetPasswordController>(
          builder: (forgetPasswordController) => AppStateHandlerWidget(
            state: forgetPasswordController.loadingState,
            child:
            SafeArea(
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: IntrinsicHeight(
                          child: Container(
                            height: Get.size.height*0.7,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 25.getWidth(), vertical: 2.getHeight()),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomBackButton(),
                                      SizedBox(height: 20.getHeight(),),
                                      Text(
                                        forgetPass.tr,
                                        style: FontTextStyle.heading2X ,
                                      ),

                                      SizedBox(height: 20.getHeight()),

                                      CustomFormField(
                                       controller: forgetPasswordController.userNameController,
                                        isRequired: true,
                                        labelText: userName.tr,
                                      ),
                                      SizedBox(height: AppSpacing.l.getHeight()),

                                      CustomFormField(
                                         controller: forgetPasswordController.userTypeController,
                                        isRequired: true,
                                        labelText: userTypeValues.tr,
                                      ),
                                      SizedBox(height: AppSpacing.l.getHeight()),

                                      CustomFormField(
                                         controller: forgetPasswordController.birthDateController,
                                        readOnly: true,
                                        onTap: (){
                                          forgetPasswordController.openDatePicker(context);
                                          },
                                        suffix: SvgPicture.asset(AllIcons.calendarIcon ,
                                            fit: BoxFit.scaleDown),

                                        isRequired: true,
                                        labelText: dateOfBirth.tr,
                                      ),

                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(children: [

                      // InkWell(
                      //   child: Text("create new pass"),
                      //   onTap: (){
                      //
                      //   },
                      // ),
                      Divider(height: 1.getHeight(),color: AppColors.neutral500,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppSpacing.l.getWidth(), vertical: AppSpacing.m.getHeight()),
                        child: SizedBox(
                          height: 52.getHeight(),
                          width: double.infinity,
                          child:  Obx(() =>CustomButton(
                            key,
                            buttonTitle: sendRequest.tr,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              // forgetPasswordController.isSendRequestButtonActive.value?

                              Get.toNamed(
                                  RoutesConstants.createPasswordScreen);
                              // loginController.toggleSnackBarVisibility() ;
                            },
                            isDisabled: forgetPasswordController.isSendRequestButtonActive.value?false:true,
                            buttonType: ButtonType.primary,
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
