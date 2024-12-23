import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled3/uiHelpers/app_colors.dart';
import 'package:untitled3/uiHelpers/font_text_style.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../UIHelpers/icons.dart';
import '../../../uiHelpers/app_spacing.dart';

class ServiceCategoryWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const ServiceCategoryWidget({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.m.getHeight(),
          horizontal:AppSpacing.m.getWidth()),

      // margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: AppColors.brand100, // Light cream color
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: AppColors.brand200, // Subtle border color
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(AllIcons.userIcon),
              const SizedBox(width: 12.0),
              Text(
                title,
                style: FontTextStyle.labelX.copyWith(color: AppColors.primary100),
              ),
            ],
          ),
          GestureDetector(
            onTap: onTap,
            child:
            SvgPicture.asset(AllIcons.downArrowIcon ,
              colorFilter: ColorFilter.mode(AppColors.primary100, BlendMode.srcIn) ,),
            // const Icon(
            //   Icons.keyboard_arrow_down, // Down arrow icon
            //   color: Color(0xFF9B7E4D), // Arrow color
            //   size: 24,
            // ),
          ),
        ],
      ),
    );
  }
}
