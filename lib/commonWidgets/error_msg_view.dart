import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled3/uiHelpers/app_radius.dart';
import 'package:untitled3/uiHelpers/app_spacing.dart';
import 'package:untitled3/uiHelpers/font_text_style.dart';
import 'package:untitled3/utils/constant.dart';

import '../uiHelpers/app_colors.dart';
import '../uiHelpers/icons.dart';

class ErrorMsgView extends StatelessWidget {
  const ErrorMsgView({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60.getHeight(),
      padding: EdgeInsets.symmetric(horizontal: 16.getWidth(),
      vertical: 16.getHeight()),
      decoration: ShapeDecoration(
        color: AppColors.errorMsgViewColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.m),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Baseline(
            baseline: 25.getHeight(),
            baselineType: TextBaseline.alphabetic,
            child: SvgPicture.asset(
              AllIcons.errorIcon,
            ),
          ),
          SizedBox(
            width: AppSpacing.xs.getWidth(),
          ),
          Text(title,
              style: FontTextStyle.headingMedium.copyWith(
                color: AppColors.errorMsgTextColor,
              )),
        ],
      ),
    );
  }
}
