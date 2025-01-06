import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled3/features/serviceScreens/projectRequestForm/presentation/widgets/party_radio_button.dart';
import 'package:untitled3/uiHelpers/app_colors.dart';
import 'package:untitled3/uiHelpers/app_spacing.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../../UIHelpers/icons.dart';
import '../../../../../commonWidgets/custom_form_field.dart';
import '../../../../../commonWidgets/required_label.dart';
import '../../../../../uiHelpers/font_text_style.dart';


class PartyWidget extends StatelessWidget {
  final int index;
  final String partyName;
  final String partyHeaderTitle;
  final String partyType;
  final String partyCategory;
  final Function(String type) onUpdatePartyType;
  final VoidCallback onShowPartyTypeName;
  final VoidCallback onShowPartyCategory;
  final VoidCallback onDelete;

  const PartyWidget({
    Key? key,
    required this.index,
    required this.partyName,
    required this.partyHeaderTitle,
    required this.partyType,
    required this.partyCategory,
    required this.onUpdatePartyType,
    required this.onShowPartyTypeName,
    required this.onShowPartyCategory,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: AppColors.neutral200,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: AppColors.neutral500),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with "Party 1" and Delete Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  partyHeaderTitle,
                  style: FontTextStyle.headingLarge,
                ),
                index == 0
                    ? const SizedBox()
                    : InkWell(
                  onTap: onDelete,
                  child: Row(
                    children: [
                      SvgPicture.asset(AllIcons.deleteIcon),
                      Text(
                        "delete",
                        style: FontTextStyle.labelMedium.copyWith(
                          color: AppColors.negative500,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.negative500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: AppSpacing.xl.getHeight()),

            const RequiredLabel(labelText: "Party Type", isRequired: true),

            // Party Type Radio Buttons
            Row(
              children: [
                Flexible(
                  flex: 3,
                  child: PartyRadioButton(
                    label: "company/group",
                    icon: AllIcons.mobileIcon,
                    isSelected: partyType == "company/group",
                    onTap: () => onUpdatePartyType("company/group"),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: PartyRadioButton(
                    label: "person",
                    icon: AllIcons.mobileIcon,
                    isSelected: partyType == "person",
                    onTap: () => onUpdatePartyType("person"),
                  ),
                ),
              ],
            ),

            SizedBox(height: AppSpacing.xl.getHeight()),

            // Party Type Name Field
            CustomFormField(
              controller: null,
              hintText: partyName,
              readOnly: true,
              fill: true,
              onTap: onShowPartyTypeName,
              suffix: SvgPicture.asset(
                AllIcons.searchIcon,
                fit: BoxFit.scaleDown,
              ),
              isRequired: true,
              labelText: "Party type name",
              filledColor: Colors.white,
            ),

            SizedBox(height: AppSpacing.xl.getHeight()),

            // Party Category Field
            CustomFormField(
              controller: null,
              hintText: partyCategory,
              readOnly: true,
              onTap: onShowPartyCategory,
              suffix: SvgPicture.asset(
                AllIcons.downArrowIcon,
                fit: BoxFit.scaleDown,
              ),
              isRequired: true,
              labelText: "category",
              fill: true,
              filledColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
