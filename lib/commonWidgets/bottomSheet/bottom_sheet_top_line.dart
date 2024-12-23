import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/uiHelpers/app_colors.dart';
import 'package:untitled3/utils/constant.dart';


class BottomSheetTopLine extends StatelessWidget {
  const BottomSheetTopLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.back(),
      child: Container(
        height: 5,
        margin: EdgeInsets.only(
          left: 150.getWidth(),
          right: 150.getWidth(),
        ),
        decoration: BoxDecoration(
          color: AppColors.neutral500,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
