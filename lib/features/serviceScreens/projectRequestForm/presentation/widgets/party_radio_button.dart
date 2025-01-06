import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled3/commonWidgets/bottomSheet/bottom_sheet_action.dart';
import 'package:untitled3/uiHelpers/app_colors.dart';
import 'package:untitled3/uiHelpers/font_text_style.dart';
import 'package:untitled3/utils/constant.dart';

class PartyRadioButton extends StatelessWidget {
  final bool isSelected;
  final String icon;
  final String label;
  final VoidCallback onTap;

  const PartyRadioButton({
    Key? key,
    required this.isSelected,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),

        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [

            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.neutral500, width: 1.0),
                color: Colors.white,
              ),
              child: isSelected
                  ? Center(
                child: Container(
                  // height: 12,
                  // width: 12,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.brand500,
                  ),
                  child: Center(
                    child: Container(
                      height: 8.getHeight(),
                      width: 8.getWidth(),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
                  : null,
            ),
            const SizedBox(width: 3.0),
            Text(
                label,
                style: FontTextStyle.labelLarge.copyWith(
                  color: AppColors.neutral900,
                )
            ),

          ],
        ),
      ),
    );
  }
}
