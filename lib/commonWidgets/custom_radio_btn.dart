import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled3/uiHelpers/app_colors.dart';
import 'package:untitled3/uiHelpers/app_radius.dart';
import 'package:untitled3/uiHelpers/font_text_style.dart';
import 'package:untitled3/utils/constant.dart';

import '../uiHelpers/app_spacing.dart';

class CustomRadioButton extends StatelessWidget {
  final bool isSelected;
  final String icon;
  final String label;
  final VoidCallback onTap;

  const CustomRadioButton({
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
        height:56,
        padding:  EdgeInsets.symmetric(horizontal: AppSpacing.s.getWidth()),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.m),
          border: Border.all(
            color: isSelected ? AppColors.brand500 : AppColors.neutral500,
            width: 1.0,
          ),
           color: isSelected ? AppColors.brand100 : Colors.white
        ),
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
            const SizedBox(width: 8.0),
            Text(
              label,
              style: FontTextStyle.labelLarge.copyWith(
                color: AppColors.neutral900,
              )
            ),
            const Spacer(),
            SvgPicture.asset(
              icon,
              color:  AppColors.neutral900 ,
            ),
          ],
        ),
      ),
    );
  }
}
