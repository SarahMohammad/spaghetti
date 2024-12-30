import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled3/utils/constant.dart';
import 'package:flutter/material.dart';
import '../../../../UIHelpers/icons.dart';
import '../../../../commonWidgets/bottomSheet/bottom_sheet_action.dart';
import '../../../../commonWidgets/custom_form_field.dart';
import '../../../../uiHelpers/app_colors.dart';
import '../../../../uiHelpers/app_spacing.dart';
import '../../../../uiHelpers/font_text_style.dart';
import '../../../../utils/service_enum.dart';
import '../../../../utils/translation_keys.dart';
import '../widgets/details_widget.dart';
import '../widgets/label_value_row.dart';

class FormFieldHandler {
  Widget callTopProjectRequestFormFields() {
    TextEditingController projectNameController = TextEditingController();
    TextEditingController projectDurationController = TextEditingController();
    TextEditingController projectOwnerController = TextEditingController();
    TextEditingController valueController = TextEditingController();
    TextEditingController approvalAuthorityController = TextEditingController();
    TextEditingController managementApprovalController = TextEditingController();
    TextEditingController externalApprovalController = TextEditingController();
    TextEditingController projectDescriptionController = TextEditingController();
    TextEditingController structureController = TextEditingController();
    TextEditingController paymentStructureController = TextEditingController();
    return Column(children: [
      CustomFormField(
        controller:
        projectNameController,
        labelText: projectName.tr,
        isRequired: true,
      ),
      SizedBox(height: AppSpacing.l.getHeight()),
      CustomFormField(
        controller: projectDurationController,
        labelText: projectDuration.tr,
        isRequired: true,
      ),
      SizedBox(height: AppSpacing.l.getHeight()),
      CustomFormField(
        controller: projectOwnerController,
        labelText: projectOwner.tr,
        isRequired: true,
      ),
      SizedBox(height: AppSpacing.l.getHeight()),
      CustomFormField(
        //  controller: loginController.userNameController,
       //hintText: enterDateOfBirth.tr,
        readOnly: true,
        onTap: () {
          showProjectImplYears();
        },
        suffix: SvgPicture.asset(AllIcons.downArrowIcon,
            fit: BoxFit.scaleDown),
        isRequired: true,
        labelText: projectImplYear.tr,
      ),
      SizedBox(height: AppSpacing.l.getHeight()),
      CustomFormField(
        //  controller: loginController.userNameController,
        // hintText: enterDateOfBirth.tr,
        readOnly: true,
        onTap: () {
             openDatePicker(Get.context as BuildContext);
        },
        suffix: SvgPicture.asset(AllIcons.calendarIcon,
            fit: BoxFit.scaleDown),
        labelText: closingDate.tr,
        isRequired: true,
      ),
      SizedBox(height: AppSpacing.l.getHeight()),
      CustomFormField(
        controller: valueController,
        labelText: value.tr,
        isRequired: true,
      ),
      SizedBox(height: AppSpacing.l.getHeight()),
      CustomFormField(
        controller: approvalAuthorityController,
        labelText: approvalAuth.tr,
        isRequired: true,
      ),
      SizedBox(height: AppSpacing.l.getHeight()),
      CustomFormField(
        controller: managementApprovalController,
        labelText: managementApproval.tr,
        isRequired: true,
      ),
      SizedBox(height: AppSpacing.l.getHeight()),
      CustomFormField(
        controller: externalApprovalController,
        labelText: externalApproval.tr,
        isRequired: true,
      ),
      SizedBox(height: AppSpacing.l.getHeight()),
      CustomFormField(
        labelText: projectDescription.tr,
        maxLines: 4,
        controller: projectDescriptionController,
        maxLength: 300,
      ),
      SizedBox(height: AppSpacing.l.getHeight()),
      CustomFormField(
        controller: structureController,
        labelText: structure.tr,
        isRequired: true,
      ),
      SizedBox(height: AppSpacing.l.getHeight()),
      CustomFormField(
        controller: paymentStructureController,
        labelText: paymentStructure.tr,
        isRequired: true,
      ),
      SizedBox(height: AppSpacing.l.getHeight()),
    ],);
  }

  Widget callTopTemplateRequestFromFormFields() {
    TextEditingController projectNameController = TextEditingController();
    TextEditingController projectDurationController = TextEditingController();
    TextEditingController projectOwnerController = TextEditingController();
    return Column(children: [
      CustomFormField(
        controller:
        projectNameController,
        labelText: projectName.tr,
        isRequired: true,
      ),
      SizedBox(height: AppSpacing.l.getHeight()),
      CustomFormField(
        controller: projectDurationController,
        labelText: projectDuration.tr,
        isRequired: true,
      ),
      SizedBox(height: AppSpacing.l.getHeight()),
      CustomFormField(
        controller: projectOwnerController,
        labelText: projectOwner.tr,
        isRequired: true,
      ),
      SizedBox(height: AppSpacing.l.getHeight()),
    ]);
  }

  Widget callTopNonRcuFromFormFields() {
    TextEditingController projectNameController = TextEditingController();
    TextEditingController projectDescriptionController = TextEditingController();
    return Column(children: [
      CustomFormField(
        controller:
        projectNameController,
        labelText: projectName.tr,
        isRequired: true,
      ),
      SizedBox(height: AppSpacing.l.getHeight()),
      CustomFormField(
        labelText: projectDescription.tr,
        maxLines: 4,
        controller: projectDescriptionController,
        maxLength: 300,
      ),
      SizedBox(height: AppSpacing.l.getHeight()),

    ]);
  }

  Widget callBottomProjectRequestFormFields() {

    TextEditingController authorizedPersonnelController = TextEditingController();
    TextEditingController similarProjectsController = TextEditingController();
    return Column(children: [
      CustomFormField(
        controller: authorizedPersonnelController,
        isRequired: true,
        labelText: authorizedPersonnel.tr,
      ),
      SizedBox(height: AppSpacing.l.getHeight()),
      CustomFormField(
        controller: similarProjectsController,
        labelText: similarProjects.tr,
        isRequired: true,
      ),
      SizedBox(height: AppSpacing.l.getHeight()),
    ],);
  }
  Widget callBottomTemplateRequesFormFields() {

    TextEditingController valueController = TextEditingController();
    TextEditingController paymentStructureController = TextEditingController();
    TextEditingController authorizedPersonnelController = TextEditingController();
    TextEditingController similarProjectsController = TextEditingController();
    return Column(children: [
      CustomFormField(
        controller: valueController,
        labelText: value.tr,
        isRequired: true,
      ),
      SizedBox(height: AppSpacing.l.getHeight()),
      CustomFormField(
        controller: paymentStructureController,
        labelText: paymentStructure.tr,
        isRequired: true,
      ),
      SizedBox(height: AppSpacing.l.getHeight()),
      CustomFormField(
        controller: authorizedPersonnelController,
        isRequired: true,
        labelText: authorizedPersonnel.tr,
      ),
      SizedBox(height: AppSpacing.l.getHeight()),
      CustomFormField(
        controller: similarProjectsController,
        labelText: similarProjects.tr,
        isRequired: true,
      ),
      SizedBox(height: AppSpacing.l.getHeight()),

    ],);
  }


  showProjectImplYears() {
    List<String> years = List.generate(7, (index) => (2024 + index).toString());

    showBottomActionModelSheet(
      Get.context!,
      showCloseIcon: true,
      content: ListView.separated(
        shrinkWrap: true,
        itemCount: years.length,
        itemBuilder: (context, index) {
          // Display each year
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Center(
              child: Text(
                years[index].toString(),
                style: FontTextStyle.labelLarge.copyWith(
                    color: AppColors.neutral900),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          // Add a horizontal line between items
          return const Divider(
            color: AppColors.neutral500,
            thickness: 1,
          );
        },
      ),
      title: "Project implementation year",

    );
  }



  // nonRcu
  Widget topNonRCUDetails(){
    return DetailsWidget(
        projectLabel: "Name",
        projectValue: "Emp digital exp",
        columnDetails: Column(
          children: [
            SizedBox(height: AppSpacing.l.getHeight()),
            LabelValueRow(label: "Description", value: "This service allows business domains to"),
            SizedBox(height: AppSpacing.l.getHeight()),

          ],
        )
    );
  }

  //newTemplateRequestFrom
  Widget topNTRFDetails(){
    return DetailsWidget(
        projectLabel: "Project name",
        projectValue: "Emp digital exp",
        columnDetails: Column(
          children: [
            SizedBox(height: AppSpacing.l.getHeight()),
            SizedBox(height: AppSpacing.l.getHeight()),
            Row(
              children: [
                Expanded(
                  child: LabelValueRow(label: "Project Duration", value: "1-3 months"),
                ),
                SizedBox(width: AppSpacing.l.getWidth()),
                Expanded(
                  child: LabelValueRow(
                      label: "Project Owner", value: "Ahmed hassan"),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.l.getHeight()),
          ],
        )
    );

  }

  //projectRequestForm
  Widget topPRFDetails() {
    return DetailsWidget(
        projectLabel: "Project name",
        projectValue: "Emp digital exp",
        columnDetails: Column(
          children: [
            SizedBox(height: AppSpacing.l.getHeight()),
            const Row(
              children: [
                Expanded(
                  child: LabelValueRow(
                      label: "Project Implementation Year", value: "2025"),
                ),
                SizedBox(width: 24),
                Expanded(
                  child: LabelValueRow(
                      label: "Expected Closing Date", value: "11/12/2026"),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.l.getHeight()),
            Row(
              children: [
                Expanded(
                  child: LabelValueRow(label: "Value", value: "Typed text"),
                ),
                SizedBox(width: 24),
                Expanded(
                  child: LabelValueRow(
                      label: "Approval Authority", value: "Typed text"),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.l.getHeight()),
            Row(
              children: [
                Expanded(
                  child: LabelValueRow(
                      label: "Management Approval", value: "Typed text"),
                ),
                SizedBox(width: 24),
                Expanded(
                  child: LabelValueRow(
                      label: "External Approval", value: "Typed text"),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.l.getHeight()),
          ],
        )
    );
  }

  Widget bottomPRFDetails() {
    return DetailsWidget(
    
      columnDetails: Column(
        children: [
         Row(children: [
           Expanded(child: LabelValueRow(label: "Authorized Personnel", value: "Typed text")),
           SizedBox(width: AppSpacing.l.getWidth()),
           Expanded(child: LabelValueRow(label: "Similar Projects", value: "Typed text")),
         ],)


        ],
      )
  );}

  Widget bottomNTRFDetails() {
    return DetailsWidget(

        columnDetails: Column(
          children: [
            SizedBox(height: AppSpacing.l.getHeight()),
            Row(
              children: [
                Expanded(child: LabelValueRow(label: "value", value: "Typed text")),
                SizedBox(width: AppSpacing.l.getWidth()),
                Expanded(child: LabelValueRow(label: "payment structure", value: "Typed text")),


              ],
            ),
            SizedBox(height: AppSpacing.l.getHeight()),

            Row(
              children: [
                Expanded(child: LabelValueRow(label: "similar projects", value: "Typed text")),
                SizedBox(width: AppSpacing.l.getWidth()),
                Expanded(child: LabelValueRow(label: "Authorized personnel", value: "Typed text")),

              ],
            ),

          ],
        )
    );
  }

  Future<void> openDatePicker(BuildContext context) async {
    await showDatePickerDialog(
      context: context,
      initialDate: DateTime(2024, 12, 4),
      minDate: DateTime(2020, 10, 10),
      maxDate: DateTime(2025, 10, 30),
      selectedDate: DateTime(2024, 12, 20),
      selectedCellTextStyle: TextStyle(color: Color(0xFF007AFF)),
      selectedCellDecoration: BoxDecoration(shape: BoxShape.circle,
          color: Color(0x2F007AFF)),
      currentDateTextStyle: TextStyle(color: Color(0xFF007AFF)),
      currentDateDecoration: BoxDecoration(shape: BoxShape.circle,
          border: Border.all(color: Color(0xFFFFFF))),
      enabledCellsTextStyle: const TextStyle(color: Colors.black),
      leadingDateTextStyle:  TextStyle(color: Colors.black,
        fontSize: 17,),
      slidersColor: Colors.black,


    );
  }

}



