import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled3/UIHelpers/icons.dart';
import 'package:untitled3/uiHelpers/app_radius.dart';
import 'package:untitled3/uiHelpers/font_text_style.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../uiHelpers/app_colors.dart';
import '../../../uiHelpers/app_spacing.dart';

class CategoryGridTile extends StatelessWidget {
  final bool isSelected;
  final String title;
  final VoidCallback onPressed;

  const CategoryGridTile({
    super.key,
    required this.isSelected,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: onPressed,
      splashColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.s),
          border: Border.all(color: isSelected ? AppColors.brand100 :
          AppColors.neutral500),
          color: isSelected ? AppColors.brand100 : Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical  : AppSpacing.m.getHeight(),
              horizontal: AppSpacing.m.getWidth()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(AllIcons.userIcon,
              colorFilter:  ColorFilter.mode( isSelected ? AppColors.primary100 :
              AppColors.neutral800, BlendMode.srcIn),
              ),
              Spacer(),
              Text(
                title,
                style: FontTextStyle.labelLarge.
                copyWith(color: isSelected ?  AppColors.primary100:AppColors.neutral800 ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
