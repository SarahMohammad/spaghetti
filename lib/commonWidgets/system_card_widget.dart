import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:untitled3/uiHelpers/app_colors.dart';
import 'package:untitled3/uiHelpers/app_radius.dart';
import 'package:untitled3/uiHelpers/app_spacing.dart';
import 'package:untitled3/uiHelpers/font_text_style.dart';
import 'package:untitled3/utils/constant.dart';

import '../UIHelpers/icons.dart';
import '../utils/translation_keys.dart';


class SystemCardWidget extends StatelessWidget {
  final String? title;
  final Function()? onReadMorePress;

  const SystemCardWidget({Key? key, this.title,
  this.onReadMorePress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding:  EdgeInsets.all(AppSpacing.m.getHeight()),
        decoration: ShapeDecoration(
          color: AppColors.brand100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.l),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
             SvgPicture.asset(
               AllIcons.userIcon,
               fit: BoxFit.contain,
             ),
             SvgPicture.asset(
               AllIcons.favIcon,
               fit: BoxFit.contain,
             ),
           ],),
           SizedBox(height: AppSpacing.m.getHeight(),),
           Row(
             children: [
               Text(title ??"SAP Arabia",
               style: FontTextStyle.labelLarge
                   .copyWith(color: AppColors.neutral900),),
               SizedBox(width : AppSpacing.xs.getWidth()),
               SvgPicture.asset(
                 AllIcons.systemSmallIcon,
                 fit: BoxFit.contain,
               ),
           ],),
            SizedBox(height: AppSpacing.s.getHeight(),),
            Text("Lorem ipsum dolor sit amet consectetur. Ridiculus orci gravida adipiscing venenatis accumsan enim.",
            style: FontTextStyle.paragraphMedium,),
           InkWell(
             onTap: onReadMorePress,
             child: Text(readMore.tr ,
             style:
               FontTextStyle.labelMedium.copyWith(
                 color: AppColors.neutral800,
                 decoration: TextDecoration.underline,
                 decorationColor: AppColors.neutral800,),),
           ),
          ],
        ),
      );
  }
}





