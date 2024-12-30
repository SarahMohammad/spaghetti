import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled3/UIHelpers/icons.dart';
import 'package:untitled3/uiHelpers/app_colors.dart';
import 'package:untitled3/uiHelpers/app_spacing.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../UIHelpers/images.dart';
import '../../../uiHelpers/font_text_style.dart';

class RequestCard extends StatelessWidget {
  final Function()? onSettingsClick;
  const RequestCard({super.key,  this.onSettingsClick ,});

  @override
  Widget build(BuildContext context) {
    return  Container(
      //height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.neutral500),
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: AppSpacing.m.getWidth(), vertical: AppSpacing.l.getHeight()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Administrative Services',
                  style: FontTextStyle.paragraphLarge.copyWith(color: AppColors.primary100),
                ),
                GestureDetector(child: SvgPicture.asset(AllIcons.settingsIcon),
                onTap: onSettingsClick,),
              ],
            ),
             SizedBox(height: AppSpacing.m.getHeight()),
            Text(
              'Source For Real Estate / Committee Evaluation',
              style: FontTextStyle.labelX.copyWith(color: AppColors.neutral900),
            ),
            SizedBox(height: AppSpacing.m.getHeight()),
            Text(
              '29 Sep, 12:30 PM',
              style: FontTextStyle.paragraphMedium.copyWith(color: AppColors.neutral800),
            ),
            SizedBox(height: AppSpacing.xl.getHeight()),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Request ID',
                      style: FontTextStyle.paragraphLarge.copyWith(color: AppColors.neutral800),
                    ),
                    SizedBox(height: AppSpacing.s.getHeight()),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Req 1218421',
                          style:FontTextStyle.paragraphMedium.copyWith(color: AppColors.neutral900),
                        ),
                       SvgPicture.asset(AllIcons.systemSmallIcon)
                      ],
                    ),
                  ],
                ),
                SizedBox(width: AppSpacing.xl.getWidth()),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pending On',
                      style: FontTextStyle.paragraphLarge.copyWith(color: AppColors.neutral800),
                    ),
                    SizedBox(height: AppSpacing.s.getHeight()),
                    Row(
                      children: [
                        Center(child: Image.asset(Images.avatar,height: 35,)),
                        Text(
                          'Ahmed Elhawari',
                          style: FontTextStyle.paragraphMedium.copyWith(color: AppColors.neutral900),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
