import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/uiHelpers/font_text_style.dart';
import 'package:untitled3/utils/constant.dart';

import '../../core/localstorage_manager.dart';
import '../../utils/constant_keywords.dart';
import '../globalServices/ILocalizationService.dart';
import '../uiHelpers/app_colors.dart';
import '../uiHelpers/fonts.dart';

class CustomLangButton extends StatelessWidget {
  String? currentLang;

  CustomLangButton({
    Key? key,
  }) : super(key: key);
  final localization = Get.find<ILocalizationService>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 17.getWidth(), vertical: 4.0),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: AppColors.neutral500),
            borderRadius: BorderRadius.circular(999),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
                Get.locale.toString() == ConstantKeys.arabicLang
                    ? " English"
                    : "العربية ",
                style: FontTextStyle.labelMedium
                    .copyWith(color: AppColors.neutral900 ,
                fontFamily:Get.locale.toString() == ConstantKeys.arabicLang
                    ? Fonts.DINNextLTArabic
                    :Fonts.SalmaArabic
                    ),
            ),
            const Icon(
              Icons.language,
              color: AppColors.neutral900,
              size: 16,
            ),
          ],
        ),
      ),
      onTap: () {
        Get.locale.toString() ==
            ConstantKeys.arabicLang
            ?changeLangToEnglish():changeLangToArabic();
      },
    );
  }

  void saveLanguageToDisk(String lang) {
    LocalStorageManager.saveLanguageToDisk(lang);
  }

  void changeLangToEnglish() {
    saveLanguageToDisk(ConstantKeys.english);
    localization.changeLocale(ConstantKeys.english);
    Get.updateLocale(const Locale('en', 'US'));
    currentLang = localization.getCurrentLocal();
  }

  void changeLangToArabic() {
    saveLanguageToDisk(ConstantKeys.arabic);
    localization.changeLocale(ConstantKeys.arabic);
    Get.updateLocale(const Locale('ar', 'AR'));
    currentLang = localization.getCurrentLocal();
  }
}
