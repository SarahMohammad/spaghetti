import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled3/UIHelpers/icons.dart';
import 'package:untitled3/utils/constant.dart';

import '../commonWidgets/bottomSheet/bottom_sheet_action.dart';
import '../commonWidgets/buttons/custom_button.dart';
import '../features/home/data/models/service.dart';
import '../uiHelpers/app_colors.dart';
import '../uiHelpers/app_spacing.dart';
import '../uiHelpers/font_text_style.dart';
import '../utils/button_enum.dart';
import '../utils/translation_keys.dart';

class BottomSheetManager {

/// Bottom sheet for show service/system description
   static showServiceSystemDescriptionBottomSheet({required ServiceSystem serviceSystem , Key? key}) {
    showBottomActionModelSheet(
      Get.context!,
      showCloseIcon: true,
      content:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: AppSpacing.l.getHeight(),),
          Text(serviceSystem.description ,
            style: FontTextStyle.paragraphMedium.copyWith(color: AppColors.neutral800),),
          SizedBox(height: AppSpacing.xl.getHeight(),),
          SizedBox(
            height:52.getHeight(),
            width: Get.size.width,
            child: CustomButton(
              key,
              //radius: 40,
              buttonTitle: requestService.tr,
              padding: EdgeInsets.zero,
              onPressed: () {
              },
              buttonType: ButtonType.primary,
              isDisabled: false,
              showSuffixIcon: serviceSystem.isSystem != null &&
                  serviceSystem.isSystem! ? true :false,
              suffixIcon: serviceSystem.isSystem != null &&
                  serviceSystem.isSystem! ? SvgPicture.asset(AllIcons.systemIcon , colorFilter: const ColorFilter.mode( Colors.white, BlendMode.srcIn)
                ,): null,
            ),
          )
        ],),
      title: serviceSystem.title,
      titleAlignment: TextAlign.start,
      showPrefixIcon: serviceSystem.isSystem != null && serviceSystem.isSystem! ? true :false,
      titleStyle: FontTextStyle.labelX.
      copyWith(color: AppColors.neutral900),
      isScrollControlled: true,

      // bottomSheetHeight: Get.size.height / 3,
      // contentHeight: Get.size.height / 5.5,

    );
  }

}
