import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:untitled3/commonWidgets/custom_app_bar.dart';
import 'package:untitled3/commonWidgets/custom_form_field.dart';
import 'package:untitled3/uiHelpers/app_spacing.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../../UIHelpers/icons.dart';
import '../../../../../commonWidgets/buttons/custom_button.dart';
import '../../../../../core/app_states/app_state_handler_widget.dart';
import '../../../../../router/routes_constants.dart';
import '../../../../../uiHelpers/app_colors.dart';
import '../../../../../uiHelpers/font_text_style.dart';
import '../../../../../utils/button_enum.dart';
import '../../../../../utils/translation_keys.dart';
import '../controller/request_form_controller.dart';
import '../widgets/party_widget.dart';

class RequestFormScreen extends StatelessWidget {
  RequestFormScreen({
    super.key,
    this.retry,
  });

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
                        title: "Project request form",
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
                              CustomFormField(
                                controller:
                                requestFormController.projectNameController,
                                labelText: projectName.tr,
                                isRequired: true,
                              ),
                              SizedBox(height: AppSpacing.l.getHeight()),
                              CustomFormField(
                                controller: requestFormController.projectDurationController,
                                labelText: projectDuration.tr,
                                isRequired: true,
                              ),
                              SizedBox(height: AppSpacing.l.getHeight()),
                              CustomFormField(
                                controller: requestFormController.projectOwnerController,
                                labelText: projectOwner.tr,
                                isRequired: true,
                              ),
                              SizedBox(height: AppSpacing.l.getHeight()),
                              CustomFormField(
                                 controller: requestFormController.projectImplYearController,
                                readOnly: true,
                                onTap: () {
                                  requestFormController.showProjectImplYearsBottomSheet();
                                },
                                suffix: SvgPicture.asset(AllIcons.downArrowIcon,
                                    fit: BoxFit.scaleDown),
                                isRequired: true,
                                labelText: projectImplYear.tr,
                              ),
                              SizedBox(height: AppSpacing.l.getHeight()),
                              CustomFormField(
                                 controller: requestFormController.closingDateController,
                                // hintText: enterDateOfBirth.tr,
                                readOnly: true,
                                onTap: () {
                                  requestFormController.openDatePicker(Get.context as BuildContext);
                                },
                                suffix: SvgPicture.asset(AllIcons.calendarIcon,
                                    fit: BoxFit.scaleDown),
                                labelText: closingDate.tr,
                                isRequired: true,
                              ),
                              SizedBox(height: AppSpacing.l.getHeight()),
                              CustomFormField(
                                controller: requestFormController.valueController,
                                labelText: value.tr,
                                isRequired: true,
                              ),
                              SizedBox(height: AppSpacing.l.getHeight()),
                              CustomFormField(
                                controller: requestFormController.approvalAuthorityController,
                                labelText: approvalAuth.tr,
                                isRequired: true,
                              ),
                              SizedBox(height: AppSpacing.l.getHeight()),
                              CustomFormField(
                                controller: requestFormController.managementApprovalController,
                                labelText: managementApproval.tr,
                                isRequired: true,
                              ),
                              SizedBox(height: AppSpacing.l.getHeight()),
                              CustomFormField(
                                controller: requestFormController.externalApprovalController,
                                labelText: externalApproval.tr,
                                isRequired: true,
                              ),
                              SizedBox(height: AppSpacing.l.getHeight()),
                              CustomFormField(
                                labelText: projectDescription.tr,
                                maxLines: 4,
                                controller: requestFormController.projectDescriptionController,
                                maxLength: 300,
                              ),
                              SizedBox(height: AppSpacing.l.getHeight()),
                              CustomFormField(
                                controller: requestFormController.structureController,
                                labelText: structure.tr,
                                isRequired: true,
                              ),
                              SizedBox(height: AppSpacing.l.getHeight()),
                              CustomFormField(
                                controller: requestFormController.paymentStructureController,
                                labelText: paymentStructure.tr,
                                isRequired: true,
                              ),
                              SizedBox(height: AppSpacing.l.getHeight()),

                              // requestFormController.serviceType ==
                              //     ServiceType.nonRcu
                              //     ? RequiredLabel(
                              //   isRequired: true,
                              //   labelText: "Attach file",
                              // ):
                              Text(
                                parties.tr,
                                style: FontTextStyle.headingX,
                              ),

                              Obx(() {
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


                               CustomButton(
                                key,
                                radius: 100.0,
                                padding: const EdgeInsets.symmetric(vertical: 1.0),
                                onPressed: () {
                                  requestFormController.addParty();
                                },
                                isDisabled: false,
                                buttonType: ButtonType.secondary,
                                child:  Container(
                                  width: Get.size.width,
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
                                ),
                                                             ),
                              CustomFormField(
                                controller: requestFormController.authorizedPersonnelController,
                                isRequired: true,
                                labelText: authorizedPersonnel.tr,
                              ),
                              SizedBox(height: AppSpacing.l.getHeight()),
                              CustomFormField(
                                controller: requestFormController.similarProjectsController,
                                labelText: similarProjects.tr,
                                isRequired: true,
                              ),
                              SizedBox(height: AppSpacing.l.getHeight()),
                              const Spacer(),
                              SizedBox(height: AppSpacing.l.getHeight()),
                              Obx (()=> SizedBox(
                                  height: 52.getHeight(),
                                  width: double.infinity,
                                  child: CustomButton(
                                    key,
                                    buttonTitle: submit.tr,
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      Get.toNamed(
                                          RoutesConstants.requestSubmitScreen);
                                    },
                                    isDisabled: !requestFormController.isSubmitEnabled.value,
                                    buttonType: ButtonType.primary,
                                  ),
                              ),),
                              SizedBox(height: AppSpacing.m.getHeight()),
                              SizedBox(
                                  height: 52.getHeight(),
                                  width: double.infinity,
                                  child: CustomButton(
                                    key,
                                    buttonTitle: cancel.tr,
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
