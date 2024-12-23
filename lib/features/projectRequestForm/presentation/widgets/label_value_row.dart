import 'package:flutter/material.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../uiHelpers/app_colors.dart';
import '../../../../uiHelpers/app_spacing.dart';
import '../../../../uiHelpers/font_text_style.dart';

class LabelValueRow extends StatelessWidget {
  final String label;
  final String value;
  final Widget? prefix;
  final Widget? suffix;

  const LabelValueRow({
    required this.label,
    required this.value,
    this.prefix,
    this.suffix,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: FontTextStyle.paragraphMedium.copyWith(color:AppColors.neutral800)),
              SizedBox(height: AppSpacing.m.getHeight() ),
              Row(
                children: [
                  prefix ?? SizedBox(),
                  prefix!=null ?SizedBox(width: AppSpacing.xs.getWidth()) : SizedBox(),
                  Text(value, style: FontTextStyle.paragraphLarge.copyWith(color: AppColors.neutral900)),
                  suffix!=null ?SizedBox(width: AppSpacing.xxs.getWidth()) : SizedBox(),
                  suffix ?? SizedBox()
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
