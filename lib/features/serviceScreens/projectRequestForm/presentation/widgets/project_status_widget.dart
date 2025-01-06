import 'package:flutter/material.dart';
import 'package:untitled3/uiHelpers/app_spacing.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../../UIHelpers/images.dart';
import '../../../../../commonWidgets/buttons/custom_button.dart';
import '../../../../../uiHelpers/app_colors.dart';
import '../../../../../uiHelpers/font_text_style.dart';
import '../../../../../utils/button_enum.dart';


class ProjectStatusWidget extends StatelessWidget {
  const ProjectStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: AppSpacing.l.getHeight(),
      horizontal: AppSpacing.l.getWidth()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Approval Pending On',
              style: FontTextStyle.headingLarge),
          SizedBox(height : AppSpacing.l.getHeight()),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             Image.asset(Images.avatar ),
              SizedBox(width : AppSpacing.m.getWidth()),

              Column(
                children: [
                  Text(
                    'Ali Al Ghafli',
                    style: FontTextStyle.labelLarge,
                  ),
                  Text('HR Manager',
                      style: FontTextStyle.paragraphMedium)
                ],
              ),
              Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: ShapeDecoration(
                  color: AppColors.warning100,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: AppSpacing.xs.getWidth(),
                  vertical: AppSpacing.xs.getHeight()),
                  child: Text(
                    'Pending',
                    style: FontTextStyle.labelMedium.copyWith(color: AppColors.warning500),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height : AppSpacing.l.getHeight()),

          SizedBox(
            height: 52.getHeight(),
            width: double.infinity,
            child: CustomButton(key,
              buttonType: ButtonType.tertiary,
              buttonTitle: "view approval line",
              isDisabled: false,
              padding: EdgeInsets.zero,
            ),
          ),

        ],
      ),
    );
  }
}
