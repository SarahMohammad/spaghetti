import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';import 'package:untitled3/features/serviceScreens/newTemplateRequestForm/presentation/controller/new_template_request_form_controller.dart';
import 'package:untitled3/utils/constant.dart';
import '../../../../../UIHelpers/icons.dart';
import '../../../../../commonWidgets/buttons/custom_button.dart';
import '../../../../../commonWidgets/custom_app_bar.dart';
import '../../../../../commonWidgets/custom_form_field.dart';
import '../../../../../core/app_states/app_state_handler_widget.dart';
import '../../../../../router/routes_constants.dart';
import '../../../../../uiHelpers/app_colors.dart';
import '../../../../../uiHelpers/app_spacing.dart';
import '../../../../../uiHelpers/font_text_style.dart';
import '../../../../../utils/button_enum.dart';
import '../../../../../utils/translation_keys.dart';
import '../../../projectRequestForm/presentation/widgets/party_widget.dart';


class NewTemplateRequestFormScreen extends StatelessWidget {
  NewTemplateRequestFormScreen({
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
        child: GetBuilder<NewTemplateRequestFormController>(
          builder: (controller) => AppStateHandlerWidget(
              state: controller.loadingState,
              child:SingleChildScrollView(
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      CustomAppBar(
                        title: "New template request form",
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
                                  controller.projectNameController,
                                  labelText: projectName.tr,
                                  isRequired: true,
                                ),
                                SizedBox(height: AppSpacing.l.getHeight()),
                                CustomFormField(
                                  controller: controller.projectDurationController,
                                  labelText: projectDuration.tr,
                                  isRequired: true,
                                ),
                                SizedBox(height: AppSpacing.l.getHeight()),
                                CustomFormField(
                                  controller: controller.projectOwnerController,
                                  labelText: projectOwner.tr,
                                  isRequired: true,
                                ),
                                SizedBox(height: AppSpacing.l.getHeight()),

                              Text(
                                parties.tr,
                                style: FontTextStyle.headingX,
                              ),
                              Obx(() {
                                return Column(
                                  children: controller
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
                                          controller
                                              .partiesValues[
                                          entry.key]
                                              .type = type;
                                          controller
                                              .partiesValues
                                              .refresh();
                                        },
                                        onShowPartyTypeName: () {
                                          controller
                                              .showPartyTypeName(
                                              entry.key);
                                        },
                                        onShowPartyCategory: () {
                                          controller
                                              .showPartyCategory(
                                              entry.key);
                                        },
                                        onDelete: () {
                                          controller
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
                                  controller.addParty();
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
                                controller: controller.valueController,
                                labelText: value.tr,
                                isRequired: true,
                              ),
                              SizedBox(height: AppSpacing.l.getHeight()),
                              CustomFormField(
                                controller: controller.paymentStructureController,
                                labelText: paymentStructure.tr,
                                isRequired: true,
                              ),
                              SizedBox(height: AppSpacing.l.getHeight()),
                              CustomFormField(
                                controller: controller.authorizedPersonnelController,
                                isRequired: true,
                                labelText: authorizedPersonnel.tr,
                              ),
                              SizedBox(height: AppSpacing.l.getHeight()),
                              CustomFormField(
                                controller: controller.similarProjectsController,
                                labelText: similarProjects.tr,
                                isRequired: true,
                              ),
                              SizedBox(height: AppSpacing.l.getHeight()),
                              const Spacer(),
                              SizedBox(height: AppSpacing.l.getHeight()),
                              SizedBox(
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
                                    isDisabled: false,
                                    buttonType: ButtonType.primary,
                                  )),
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
              ),
          ),
        ),
      ),
    );
  }
}
