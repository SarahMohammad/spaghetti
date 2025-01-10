import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/uiHelpers/app_spacing.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../../UIHelpers/images.dart';
import '../../../../../commonWidgets/buttons/custom_button.dart';
import '../../../../../uiHelpers/app_colors.dart';
import '../../../../../uiHelpers/font_text_style.dart';
import '../../../../../utils/button_enum.dart';
import '../../../../../utils/translation_keys.dart';


class ProjectStatusWidget extends StatelessWidget {
  final String pendingOn;
  final String role;
  final String status;

  const ProjectStatusWidget({Key? key,  required this.pendingOn ,
    required this.role,
    required this.status
  }) : super(key: key);


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
             Image.asset(Images.avatar , height: 48, width: 48,fit: BoxFit.fill, ),
              SizedBox(width : AppSpacing.m.getWidth()),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pendingOn,
                    style: FontTextStyle.labelLarge.copyWith(color: AppColors.neutral900),
                  ),
                  Text(role,
                      style: FontTextStyle.paragraphMedium)
                ],
              ),
              const Spacer(),
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
                    status,
                    style: FontTextStyle.labelMedium.copyWith(color: AppColors.warning500),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height : AppSpacing.l.getHeight()),

          CustomButton(key,
              buttonType: ButtonType.tertiary,
              buttonTitle: viewApprovalLine.tr,
              isDisabled: false,
              padding: EdgeInsets.zero,
            ),


        ],
      ),
    );
  }
}
