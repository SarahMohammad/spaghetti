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
  bool inProgress;
  String category;
  String status;
  String date;
  String? statusTime;
  String title;
  String? requestId;
  String? pendingOn;

  RequestCard({super.key,  this.onSettingsClick ,
  this.inProgress = false, required  this.category,
    required this.title, required this.status,
    this.statusTime, required  this.date,
     this.requestId, this.pendingOn ,
  });

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
                  category,
                  style: FontTextStyle.paragraphLarge.copyWith(color: AppColors.primary100),
                ),
                GestureDetector(child: SvgPicture.asset(AllIcons.settingsIcon),
                onTap: onSettingsClick,),
              ],
            ),
             SizedBox(height: AppSpacing.m.getHeight()),
            Text(
              title,
              style: FontTextStyle.labelX.copyWith(color: AppColors.neutral900),
            ),
            SizedBox(height: AppSpacing.m.getHeight()),
            Text(
              date,
              style: FontTextStyle.paragraphMedium.copyWith(color: AppColors.neutral800),
            ),
            SizedBox(height: AppSpacing.l.getHeight()),

            inProgress ? Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
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
                                requestId!,
                                style:FontTextStyle.paragraphMedium.copyWith(color: AppColors.neutral900),
                              ),
                             SvgPicture.asset(AllIcons.systemSmallIcon)
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: AppSpacing.xl.getWidth()),
                    Expanded(
                      child: Column(
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
                                pendingOn!,
                                style: FontTextStyle.paragraphMedium.copyWith(color: AppColors.neutral900),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSpacing.l.getHeight()),
              ],
            ) : SizedBox.shrink(),

            Container(
              padding:  EdgeInsets.symmetric(horizontal: AppSpacing.xs.getWidth(),
              vertical:AppSpacing.xs.getHeight() ),
              decoration: ShapeDecoration(
                color: _getStatusBackgroundColor(status),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      '${status}${statusTime != null ? ": $statusTime" : ""}',
                      style: FontTextStyle.labelMedium.copyWith(color: _getStatusTextColor(status))
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
  Color _getStatusBackgroundColor(String status) {
    switch (status.toLowerCase()) {
      case "in progress":
        return AppColors.lightOrange;
      case "approved on":
        return AppColors.lightGreenShade;
      case "rejected on":
        return AppColors.lightRed;
      case "cancelled on":
        return AppColors.darkWhite;
      default:
        return AppColors.neutral500;
    }
  }

  Color _getStatusTextColor(String status) {
    switch (status.toLowerCase()) {
      case "in progress":
        return AppColors.warning500;
      case "approved on":
        return AppColors.darkGreen;
      case "rejected on":
        return AppColors.darkRed;
      case "cancelled on":
        return AppColors.neutral900;
      default:
        return AppColors.neutral900;
    }
  }

}
