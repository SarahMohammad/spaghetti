import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/uiHelpers/font_text_style.dart';
import 'package:untitled3/utils/constant.dart';

import '../UIHelpers/images.dart';
import '../uiHelpers/app_spacing.dart';
import '../utils/constant_keywords.dart';
import 'back_button.dart';

class CustomAppBar extends StatelessWidget {
  final double? appBarHeight;
  final String? title;
  final bool showBackBtn;
  final void Function()? onBack;
  final Widget? child;
  const CustomAppBar({
    Key? key,
    this.appBarHeight,
    this.title,
    this.showBackBtn = false,
    this.onBack,
    this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: appBarHeight ?? 116.getHeight(),
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Images.headerImg),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          left: 10.getWidth(),
          right: 10.getWidth(),
        ),
        child: child ??
            Row(
              children: [
                showBackBtn == true
                    ? Align(
                  alignment:
                  Get.locale.toString() == ConstantKeys.englishLang
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: CustomBackButton(
                    onBack: onBack,
                    iconColor: Colors.white,
                    isDecorated: true,
                  ),
                )
                    : const SizedBox(),
                SizedBox(width: AppSpacing.xs.getWidth(),),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: Get.size.width*0.8,
                    child: Text(
                        title ?? "",
                        style: FontTextStyle.headingX.copyWith(color: Colors.white)
                    ),
                  ),
                ),

              ],
            ),
      ),
    );
  }
}
