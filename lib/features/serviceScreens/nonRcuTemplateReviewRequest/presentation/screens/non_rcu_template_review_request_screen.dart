import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
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
import '../../../projectRequestForm/presentation/widgets/attachment_list_tile.dart';
import '../controller/non_rcu_template_review_request_controller.dart';

class NonRcuTemplateReviewRequestScreen extends StatelessWidget {
  const NonRcuTemplateReviewRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: GetBuilder<NonRcuTemplateReviewRequestController>(
          builder: (controller) =>
              AppStateHandlerWidget(
                state: controller.loadingState,
                child: SingleChildScrollView(
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        CustomAppBar(
                          title: "Non-Rcu Template Review Request",
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
                              children: [
                                CustomFormField(
                                  controller: controller.projectNameController,
                                  labelText: projectName.tr,
                                  isRequired: true,
                                ),
                                SizedBox(height: AppSpacing.l.getHeight()),
                                CustomFormField(
                                  labelText: projectDescription.tr,
                                  maxLines: 4,
                                  controller: controller
                                      .projectDescriptionController,
                                  maxLength: 300,
                                ),
                                SizedBox(height: AppSpacing.l.getHeight()),
                                SizedBox(
                                  height: AppSpacing.s.getHeight(),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.addUploadFile();
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
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          SvgPicture.asset(AllIcons.uploadIcon),
                                          SizedBox(
                                            height: AppSpacing.m.getHeight(),
                                          ),
                                          Text(
                                            "Drag & Drop or Choose file to upload",
                                            style: FontTextStyle.paragraphLarge
                                                .copyWith(
                                                color: AppColors.neutral900),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            height: AppSpacing.m.getHeight(),
                                          ),
                                          Text(
                                            "JPG, GIF or PNG. Max size of 800K",
                                            style: FontTextStyle.paragraphMedium
                                                .copyWith(
                                                color: AppColors.neutral800),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                               if(controller.uploadFilesList.isNotEmpty)
                                Obx(() {
                                  return Column(
                                    children: controller.uploadFilesList
                                        .asMap()
                                        .entries
                                        .map((entry) =>
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: AppSpacing.xs
                                                    .getHeight()),
                                            child: AttachmentListTile(
                                              isMarginRemoved: true,
                                              prefixIcon: SvgPicture.asset(
                                                  AllIcons.deleteIcon),
                                              fileName: entry.value.name,
                                              fileSize: entry.value.size,
                                            )
                                        ),)
                                        .toList(),
                                  );
                                }),
                                const Spacer(),
                                SizedBox(height: AppSpacing.l.getHeight()),
                                Obx(() => CustomButton(
                                  key,
                                  buttonTitle: submit.tr,
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    Get.toNamed(
                                        RoutesConstants.requestSubmitScreen);
                                  },
                                  isDisabled: !controller
                                      .isSubmitEnabled.value,
                                  buttonType: ButtonType.primary,
                                )),
                                SizedBox(height: AppSpacing.m.getHeight()),
                                CustomButton(
                                  key,
                                  buttonTitle: cancel.tr,
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  isDisabled: false,
                                  buttonType: ButtonType.tertiary,
                                ),
                                SizedBox(height: AppSpacing.m.getHeight()),
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
      ),
    );
  }
}
