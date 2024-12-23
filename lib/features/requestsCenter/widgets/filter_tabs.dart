import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:untitled3/UIHelpers/icons.dart';
import 'package:untitled3/commonWidgets/bottomSheet/bottom_sheet_top_line.dart';
import 'package:untitled3/uiHelpers/app_colors.dart';
import 'package:untitled3/uiHelpers/app_spacing.dart';
import 'package:untitled3/uiHelpers/font_text_style.dart';
import 'package:untitled3/utils/constant.dart';

class FilterTabs extends StatelessWidget {
  final String selectedChoice;
  final Function(String) onSelected;

  const FilterTabs({
    super.key,
    required this.selectedChoice,
    required this.onSelected,
  });


  @override
  Widget build(BuildContext context) {

    List<MapEntry<String, String>> tabOptions = [
      MapEntry("", AllIcons.filterIcon),
      MapEntry("All", AllIcons.requestIcon),
      MapEntry("InProgress", AllIcons.timeIcon),
      MapEntry("Approved", AllIcons.checkCircleIcon),
      MapEntry("Rejected", AllIcons.closeCircleIcon),
      MapEntry("Cancelled", AllIcons.cancelIcon),
    ];

    return Container(
      height: Get.size.height/14,
      child: ListView.builder(
          itemCount: tabOptions.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ChoiceChip(
                shadowColor: Colors.transparent,
                selectedShadowColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(tabOptions[index].value , colorFilter: ColorFilter.mode(
                        selectedChoice == tabOptions[index].key
                            ? AppColors.primary100
                            : AppColors.neutral800, BlendMode.srcIn),),
                    if (tabOptions[index].key.isNotEmpty)  SizedBox(width: AppSpacing.xs.getWidth()),
                    if (tabOptions[index].key.isNotEmpty)
                      Text(tabOptions[index].key),
                  ],
                ),
                selected: selectedChoice == tabOptions[index].key,
                onSelected: (selected) {
                  onSelected(tabOptions[index].key);
                },
                selectedColor: AppColors.brand100,
                backgroundColor: Colors.white,
                shape: index == 0 ? const CircleBorder() : null,
                labelStyle: FontTextStyle.paragraphLarge.copyWith(
                  color: selectedChoice == tabOptions[index].key
                      ? AppColors.primary100
                      : AppColors.neutral800,
                ),
                showCheckmark: false,
                side: BorderSide(
                  color: selectedChoice == tabOptions[index].key
                      ? AppColors.brand100
                      : AppColors.neutral500,
                  width: 1,
                ),

              ),
            );
          },
      ),
    );
  }
}
