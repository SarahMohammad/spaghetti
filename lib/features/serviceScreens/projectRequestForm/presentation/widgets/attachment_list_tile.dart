import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../../UIHelpers/icons.dart';
import '../../../../../uiHelpers/app_colors.dart';
import '../../../../../uiHelpers/app_spacing.dart';
import '../../../../../uiHelpers/font_text_style.dart';

class AttachmentListTile extends StatelessWidget {
  bool isMarginRemoved;
  SvgPicture prefixIcon;
  String fileName;
  String fileSize;

  AttachmentListTile(
      {super.key,
      this.isMarginRemoved = false,
      required this.prefixIcon,
      required this.fileName,
      required this.fileSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isMarginRemoved
          ? EdgeInsets.zero
          : EdgeInsets.symmetric(
              vertical: AppSpacing.m.getHeight(),
              horizontal: AppSpacing.m.getWidth()),
      padding: EdgeInsets.symmetric(
          vertical: AppSpacing.m.getHeight(),
          horizontal: AppSpacing.m.getWidth()),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.neutral500),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fileName,
                style: FontTextStyle.paragraphLarge
                    .copyWith(color: AppColors.neutral900),
              ),
              SizedBox(
                height: AppSpacing.s.getHeight(),
              ),
              Text(
                fileSize,
                style: FontTextStyle.paragraphMedium
                    .copyWith(color: AppColors.neutral800),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: prefixIcon,
          ),
        ],
      ),
    );
  }
}
