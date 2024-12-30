import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:untitled3/commonWidgets/custom_app_bar.dart';
import 'package:untitled3/commonWidgets/custom_form_field.dart';
import 'package:untitled3/commonWidgets/required_label.dart';
import 'package:untitled3/features/projectRequestForm/presentation/widgets/party_widget.dart';
import 'package:untitled3/uiHelpers/app_spacing.dart';
import 'package:untitled3/utils/constant.dart';
import 'package:untitled3/utils/service_enum.dart';

import '../../../../UIHelpers/icons.dart';
import '../../../../commonWidgets/buttons/custom_button.dart';
import '../../../../core/app_states/app_state_handler_widget.dart';
import '../../../../router/routes_constants.dart';
import '../../../../uiHelpers/app_colors.dart';
import '../../../../uiHelpers/font_text_style.dart';
import '../../../../utils/button_enum.dart';
import '../../../../utils/translation_keys.dart';
import '../controller/request_form_controller.dart';

class RequestFormScreen extends StatelessWidget {
  RequestFormScreen({
    super.key,
    this.retry,
  });

  // final OtpController otpController = Get.find<OtpController>();
  final otpFormKey = GlobalKey<FormState>();
  final void Function()? retry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: GetBuilder<RequestFormController>(
          builder: (requestFormController) => AppStateHandlerWidget(
              state: requestFormController.loadingState,
              child: SingleChildScrollView(
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      CustomAppBar(
                        title: requestFormController.screenTitle,
                        showBackBtn: true,
                      ),
                      SizedBox(
                        height: 15.getHeight(),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.getWidth(),
                              vertical: 2.getHeight()),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // CustomFormField(
                              //   controller:
                              //       requestFormController.projectNameController,
                              //   labelText: projectName.tr,
                              //   isRequired: true,
                              // ),
                              // SizedBox(height: AppSpacing.l.getHeight()),
                              // CustomFormField(
                              //   controller: requestFormController
                              //       .projectDurationController,
                              //   labelText: projectDuration.tr,
                              //   isRequired: true,
                              // ),
                              // SizedBox(height: AppSpacing.l.getHeight()),
                              // CustomFormField(
                              //   controller: requestFormController
                              //       .projectOwnerController,
                              //   labelText: projectOwner.tr,
                              //   isRequired: true,
                              // ),
                              // SizedBox(height: AppSpacing.l.getHeight()),
                              // CustomFormField(
                              //   //  controller: loginController.userNameController,
                              //   hintText: enterDateOfBirth.tr,
                              //   readOnly: true,
                              //   onTap: () {
                              //     requestFormController.showProjectImplYears();
                              //   },
                              //   suffix: SvgPicture.asset(AllIcons.downArrowIcon,
                              //       fit: BoxFit.scaleDown),
                              //   isRequired: true,
                              //   labelText: projectImplYear.tr,
                              // ),
                              // SizedBox(height: AppSpacing.l.getHeight()),
                              // CustomFormField(
                              //   //  controller: loginController.userNameController,
                              //   hintText: enterDateOfBirth.tr,
                              //   readOnly: true,
                              //   onTap: () {
                              //     //    forgetPasswordController.openDatePicker(context);
                              //   },
                              //   suffix: SvgPicture.asset(AllIcons.calendarIcon,
                              //       fit: BoxFit.scaleDown),
                              //   labelText: closingDate.tr,
                              //   isRequired: true,
                              // ),
                              // SizedBox(height: AppSpacing.l.getHeight()),
                              // CustomFormField(
                              //   controller:
                              //       requestFormController.valueController,
                              //   labelText: value.tr,
                              //   isRequired: true,
                              // ),
                              // SizedBox(height: AppSpacing.l.getHeight()),
                              // CustomFormField(
                              //   controller: requestFormController
                              //       .approvalAuthorityController,
                              //   labelText: approvalAuth.tr,
                              //   isRequired: true,
                              // ),
                              // SizedBox(height: AppSpacing.l.getHeight()),
                              // CustomFormField(
                              //   controller: requestFormController
                              //       .managementApprovalController,
                              //   labelText: managementApproval.tr,
                              //   isRequired: true,
                              // ),
                              // SizedBox(height: AppSpacing.l.getHeight()),
                              // CustomFormField(
                              //   controller: requestFormController
                              //       .externalApprovalController,
                              //   labelText: externalApproval.tr,
                              //   isRequired: true,
                              // ),
                              // SizedBox(height: AppSpacing.l.getHeight()),
                              // CustomFormField(
                              //   labelText: projectDescription.tr,
                              //   maxLines: 4,
                              //   controller: requestFormController
                              //       .projectDescriptionController,
                              //   maxLength: 300,
                              // ),
                              // SizedBox(height: AppSpacing.l.getHeight()),
                              // CustomFormField(
                              //   controller:
                              //       requestFormController.structureController,
                              //   labelText: structure.tr,
                              //   isRequired: true,
                              // ),
                              // SizedBox(height: AppSpacing.l.getHeight()),
                              // CustomFormField(
                              //   controller: requestFormController
                              //       .paymentStructureController,
                              //   labelText: paymentStructure.tr,
                              //   isRequired: true,
                              // ),
                              // SizedBox(height: AppSpacing.l.getHeight()),
                              requestFormController.constructTopFields(
                                  requestFormController.serviceType),

                              requestFormController.serviceType ==
                                  ServiceType.nonRcu
                                  ? RequiredLabel(
                                isRequired: true,
                                labelText: "Attach file",
                              ):Text(
                                parties.tr,
                                style: FontTextStyle.headingX,
                              ),

                              requestFormController.serviceType ==
                                      ServiceType.nonRcu
                                  ? Column(
                                      children: [
                                        SizedBox(height: AppSpacing.s.getHeight(),),
                                        GestureDetector(
                                          onTap: (){
                                            requestFormController.addUploadFile();
                                          },
                                          child: DottedBorder(
                                            borderType: BorderType.RRect,
                                            strokeWidth: 1,
                                            color: AppColors.neutral500,
                                            dashPattern: [6, 3],
                                            radius: Radius.circular(8),
                                            child: Container(
                                              width: double.infinity,
                                              height: Get.size.height / 4,

                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(AllIcons.uploadIcon),
                                                  SizedBox(height: AppSpacing.m.getHeight(),),
                                                  Text(
                                                    "Drag & Drop or Choose file to upload",
                                                    style: FontTextStyle.paragraphLarge.copyWith(color: AppColors.neutral900) ,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(height: AppSpacing.m.getHeight(),),
                                                  Text(
                                                    "JPG, GIF or PNG. Max size of 800K",
                                                    style: FontTextStyle.paragraphMedium.copyWith(color: AppColors.neutral800),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Obx(() {
                                          return Column(
                                            children: requestFormController.uploadFilesList
                                                .asMap()
                                                .entries
                                                .map((entry) => Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: AppSpacing
                                                                .xs
                                                                .getHeight()),
                                                    child: Container(
                                                      padding: EdgeInsets.symmetric(
                                                          vertical: AppSpacing.m
                                                              .getHeight(),
                                                          horizontal: AppSpacing
                                                              .m
                                                              .getWidth()),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: AppColors
                                                                .neutral500),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "File name.pdf",
                                                                style: FontTextStyle
                                                                    .paragraphLarge
                                                                    .copyWith(
                                                                        color: AppColors
                                                                            .neutral900),
                                                              ),
                                                              SizedBox(
                                                                height: AppSpacing
                                                                    .s
                                                                    .getHeight(),
                                                              ),
                                                              Text(
                                                                "1,2MB",
                                                                style: FontTextStyle
                                                                    .paragraphMedium
                                                                    .copyWith(
                                                                        color: AppColors
                                                                            .neutral800),
                                                              ),
                                                            ],
                                                          ),
                                                          GestureDetector(
                                                            onTap: (){
                                                              requestFormController
                                                                  .uploadFilesList
                                                                  .removeAt(entry.key);
                                                            },
                                                            child: SvgPicture.asset(
                                                                AllIcons
                                                                    .deleteIcon),
                                                          ),
                                                        ],
                                                      ),
                                                    )))
                                                .toList(),
                                          );
                                        })
                                      ],
                                    )
                                  : Obx(() {
                                      return Column(
                                        children: requestFormController
                                            .partiesValues
                                            .asMap()
                                            .entries
                                            .map((entry) => Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: AppSpacing.m
                                                        .getHeight()),
                                                child:
                                                    // PartyWidget(index: entry.key,
                                                    //     controller: requestFormController),
                                                    PartyWidget(
                                                  index: entry.key,
                                                  partyHeaderTitle:
                                                      'Party ${entry.key + 1}',
                                                  partyName: entry.value.name,
                                                  partyType: entry.value.type,
                                                  partyCategory:
                                                      entry.value.category,
                                                  onUpdatePartyType: (type) {
                                                    requestFormController
                                                        .partiesValues[
                                                            entry.key]
                                                        .type = type;
                                                    requestFormController
                                                        .partiesValues
                                                        .refresh();
                                                  },
                                                  onShowPartyTypeName: () {
                                                    requestFormController
                                                        .showPartyTypeName(
                                                            entry.key);
                                                  },
                                                  onShowPartyCategory: () {
                                                    requestFormController
                                                        .showPartyCategory(
                                                            entry.key);
                                                  },
                                                  onDelete: () {
                                                    requestFormController
                                                        .partiesValues
                                                        .removeAt(entry.key);
                                                  },
                                                )))
                                            .toList(),
                                      );
                                    }),
                              SizedBox(
                                height: 10.getHeight(),
                              ),


                              requestFormController.serviceType ==
                                  ServiceType.nonRcu
                                  ? const SizedBox(): CustomButton(
                                key,
                                radius: 100.0,
                                padding: const EdgeInsets.symmetric(vertical: 1.0),
                                onPressed: () {
                                  requestFormController.addParty();
                                },
                                isDisabled: false,
                                buttonType: ButtonType.secondary,
                                child:  Container(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(AllIcons.plusIcon),
                                      const SizedBox(width: 8),
                                      Text(addParty.tr,
                                          textAlign: TextAlign.center,
                                          style: FontTextStyle.labelMedium
                                              .copyWith(
                                                  color: AppColors.primary100)),
                                    ],
                                  ),
                                  width: Get.size.width,
                                ),
                              ),
                              requestFormController.constructBottomFields(
                                  requestFormController.serviceType),
                              const Spacer(),
                              SizedBox(height: AppSpacing.l.getHeight()),
                              SizedBox(
                                  height: 52.getHeight(),
                                  width: double.infinity,
                                  child: CustomButton(
                                    key,
                                    buttonTitle: "submit",
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      Get.toNamed(
                                          RoutesConstants.requestSubmitScreen);
                                    },
                                    isDisabled: false,
                                    buttonType: ButtonType.primary,
                                  )),
                              SizedBox(height: AppSpacing.m.getHeight()),
                              SizedBox(
                                  height: 52.getHeight(),
                                  width: double.infinity,
                                  child: CustomButton(
                                    key,
                                    buttonTitle: "cancel",
                                    padding: EdgeInsets.zero,
                                    onPressed: () {},
                                    isDisabled: false,
                                    buttonType: ButtonType.tertiary,
                                  )),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
