import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../../UIHelpers/icons.dart';
import '../../../../../uiHelpers/app_colors.dart';
import '../../../../../uiHelpers/app_spacing.dart';
import '../../../../../uiHelpers/font_text_style.dart';


class AttachmentListTile extends StatelessWidget {
  const AttachmentListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(
          vertical: AppSpacing.m
              .getHeight(),
          horizontal: AppSpacing
              .m
              .getWidth()),
      padding: EdgeInsets.symmetric(
          vertical: AppSpacing.m
              .getHeight(),
          horizontal: AppSpacing
              .m
              .getWidth()),
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColors
                .neutral500),
        borderRadius:
        BorderRadius
            .circular(8),
      ),
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment
            .spaceBetween,
        children: [
          Column(
            crossAxisAlignment:
            CrossAxisAlignment
                .start,
            children: [
              Text(
                "File name.pdf",
                style: FontTextStyle
                    .paragraphLarge
                    .copyWith(
                    color: AppColors
                        .neutral900),
              ),
              SizedBox(
                height: AppSpacing
                    .s
                    .getHeight(),
              ),
              Text(
                "1,2MB",
                style: FontTextStyle
                    .paragraphMedium
                    .copyWith(
                    color: AppColors
                        .neutral800),
              ),
            ],
          ),
          GestureDetector(
            onTap: (){
            },
            child: SvgPicture.asset(
                AllIcons
                    .downloadIcon),
          ),
        ],
      ),
    );
  }
}
