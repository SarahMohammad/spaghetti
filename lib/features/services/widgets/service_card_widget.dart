import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:untitled3/uiHelpers/app_colors.dart';
import 'package:untitled3/uiHelpers/app_spacing.dart';
import 'package:untitled3/uiHelpers/font_text_style.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../UIHelpers/icons.dart';

class ServiceCardWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPress;

  const ServiceCardWidget({
    Key? key,
    required this.title,
    required this.onPress,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: onPress,
        child: Container(
          height: Get.size.height/5.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black.withOpacity(0.15)),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpacing.l.getHeight(),  horizontal:AppSpacing.m.getWidth() ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.size.width/1.5,
                      // height: ,
                      child: Text(
                        title,
                        style: FontTextStyle.labelX.copyWith(color: AppColors.neutral900),
                      ),
                    ),
                    SvgPicture.asset(AllIcons.favIcon),

                  ]),
                // SizedBox(height: AppSpacing.l.getHeight(),),
                const Spacer(),
                Row(
                  children: [

                    SvgPicture.asset(AllIcons.infoIcon),
                    SizedBox(width:AppSpacing.xxs.getWidth()),
                    Text(
                      'Show Description',
                      style: FontTextStyle.labelMedium.copyWith(
                          color: AppColors.neutral800,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.neutral800
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
  }
}





