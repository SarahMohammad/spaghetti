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
  double? height,
  double? bottomSheetHeight,
  double? contentHeight,
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
  TextStyle? titleStyle,
}) {
  return showModalBottomSheet(
    context: context,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    isScrollControlled: true,
    // Allow the bottom sheet to take flexible height
    backgroundColor: backgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          left: 24.getWidth(),
          right: 24.getWidth(),
          top: 15.getHeight(),
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
        child: Wrap(
          children: [
            // Optional top line
            showTopLine ? const BottomSheetTopLine() : const SizedBox(),
            SizedBox(height: 20.getHeight()),
            // Title Section
            if (title != null)
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: titleStyle ??
                          FontTextStyle.labelX
                              .copyWith(color: AppColors.neutral800),
                    ),
                  ),
                  if (showCloseIcon)
                    CustomCloseButton(
                      onClose: () {
                        onClose != null ? onClose() : Get.back();
                      },
                    ),
                ],
              ),
            const SizedBox(height: 12),
            // Content Section
            content,
            // Button Section
            buttonSection,
          ],
        ),
      );
    },
  );
}
