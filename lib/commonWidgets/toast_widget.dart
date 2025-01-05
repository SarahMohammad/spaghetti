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

import 'package:flutter/material.dart';

class ToastWidget extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final SvgPicture icon;

  const ToastWidget._({
    Key? key,
    required this.title,
    required this.backgroundColor,
    required this.icon,
  }) : super(key: key);

  /// positive Toast
  factory ToastWidget.positive({required String title}) {
    return ToastWidget._(
      title: title,
      backgroundColor: AppColors.darkGreen,
      icon: SvgPicture.asset(AllIcons.checkIcon ,  width: 24, height: 24,),
    );
  }

  /// neutral Toast
  factory ToastWidget.neutral({required String title}) {
    return ToastWidget._(
      title: title,
      backgroundColor: AppColors.neutral900,
      icon: SvgPicture.asset(AllIcons.checkIcon , width: 24, height: 24,),
    );
  }

  /// negative Toast
  factory ToastWidget.negative({required String title}) {
    return ToastWidget._(
      title: title,
      backgroundColor:AppColors.darkRed,
      icon: SvgPicture.asset(AllIcons.errorIcon ,
        colorFilter: const ColorFilter.mode(Colors.white,
            BlendMode.srcIn),
        width: 24, height: 24,),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: AppSpacing.m.getWidth(),
        vertical:  AppSpacing.m.getHeight()),
        decoration: ShapeDecoration(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.m),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            SizedBox(width: AppSpacing.xs.getWidth()),
            Expanded(
              child: Text(
                title,
                style: FontTextStyle.headingMedium.copyWith(color: Colors.white)
              ),
            ),
          ],
        ),
      ),
    );
  }
}




