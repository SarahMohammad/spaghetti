import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:untitled3/commonWidgets/bottomSheet/bottom_sheet_action.dart';
import 'package:untitled3/features/forgetPassword/presentation/screens/forget_password_screen.dart';
import 'package:untitled3/utils/constant.dart';

import '../../UIHelpers/icons.dart';
import '../globalServices/ILocalizationService.dart';

class CustomBackButton extends StatelessWidget {
  final Function? onBack;
  final double iconSize;
  final Color? iconColor;
  final bool isDecorated;
  CustomBackButton({
    Key? key,
    this.onBack,
    this.iconColor ,
    this.isDecorated = false,
    this.iconSize = 40,
  }) : super(key: key);
  final localization = Get.find<ILocalizationService>();

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 48.getHeight(),
      width: 48.getWidth(),
      child: Container(
        decoration: isDecorated ? ShapeDecoration(
          color: Colors.white.withOpacity(0.20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
          ),
        ): null,
        child: IconButton(

              onPressed: () {
                onBack == null ? Get.back() : onBack!();
              },
              icon: Transform.scale(
                scaleX: localization.getCurrentLocal() == 'en_US' ? 1 : -1,
                child: SvgPicture.asset(
                  AllIcons.backIcon,
                  color: iconColor ,
                  width: iconSize.getHeight(),
                ),

            ),

        ),
      ),
    );
  }
}


