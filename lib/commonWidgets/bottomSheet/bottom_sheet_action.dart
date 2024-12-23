import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/uiHelpers/app_colors.dart';
import 'package:untitled3/utils/constant.dart';

import '../../uiHelpers/font_text_style.dart';
import '../../utils/constant_keywords.dart';
import 'bottom_sheet_top_line.dart';
import 'close_button.dart';

showBottomActionModelSheet(
    BuildContext context, {
      String? title,
      Color? titleColor,
      required Widget content,
      Widget buttonSection = const SizedBox(),
      bool showTopLine = true,
      Function? onClose,
      bool hasScrolling = true,
      bool isScrollControlled = false,
      bool isDismissible = true,
      bool enableDrag = true,
      bool showCloseIcon = false,
      Color backgroundColor = Colors.white,
      double? height,
      double? bottomSheetHeight,
      double? contentHeight,
      TextStyle? titleStyle,
      //    String? headerImage,
    }) {
  return showModalBottomSheet(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
      builder: (context) {
        return Container(
          height : bottomSheetHeight ?? Get.size.height - 60.getHeight(),
          child: Padding(
            padding: EdgeInsets.only(
                left: 24.getWidth(),
                right: 24.getWidth(),
                top: 15.getHeight(),
                bottom: MediaQuery.of(context).viewInsets.bottom + 10),
            child: Wrap(
              children: [
                showTopLine ? const BottomSheetTopLine() : const SizedBox(),
                SizedBox(height: 20.getHeight()),
                Container(
                  margin:  EdgeInsets.only(
                    top: 1.getHeight(),
                    bottom: 7.getHeight(),
                  ),
                  child: title != null
                      ? Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          title,
                          style: titleStyle ??
                              FontTextStyle.labelX.copyWith(color: AppColors.neutral800),
                        ),
                      ),
                      showCloseIcon
                          ? Align(
                        alignment: Get.locale.toString() ==
                            ConstantKeys.arabicLang
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        child: CustomCloseButton(
                          onClose: () {
                            onClose ?? Get.back();
                          },
                        ),
                      )
                          : const SizedBox(),
                    ],
                  )
                      : const SizedBox(),
                ),
                // hasScrolling
                //     ?
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: height ?? Get.height * 0.60,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 9.getWidth(),
                            right: 9.getWidth(),
                            top: 9.getHeight(),
                            bottom: MediaQuery.of(Get.context!).viewInsets.bottom + 10),
                        child: Wrap(
                          children: [
                            const SizedBox(),
                            SizedBox(height: 25.getHeight()),
                            Container(
                                width: Get.width,
                                height: contentHeight ?? Get.size.height/3,
                                margin:  EdgeInsets.only(
                                  top: 12.getHeight(),
                                  bottom: 25.getHeight(),
                                ),
                                child: content
                            ),
                          ],
                        ),
                      ),
                    ),
                    buttonSection,
                  ],
                ),
                    // : content,
                hasScrolling ? const SizedBox() : buttonSection,
              ],
            ),
          ),
        );
      });
}
