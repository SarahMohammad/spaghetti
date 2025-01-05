import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled3/UIHelpers/icons.dart';
import 'package:untitled3/uiHelpers/app_colors.dart';


class CustomCloseButton extends StatelessWidget {
  final void Function()? onClose;
  const CustomCloseButton({Key? key, this.onClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClose ??
          () {
            Get.back();
          },
      child:  SvgPicture.asset(AllIcons.closeBsIcon ,
        colorFilter: const ColorFilter.mode( AppColors.neutral900, BlendMode.srcIn)
        ),
    );
  }
}
