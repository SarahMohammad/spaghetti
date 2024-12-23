import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled3/uiHelpers/app_colors.dart';
import 'package:untitled3/uiHelpers/font_text_style.dart';

class CustomRadioButton extends StatelessWidget {
  final bool isSelected;
  final String icon;
  final String label;
  final VoidCallback onTap;

  const CustomRadioButton({
    Key? key,
    required this.isSelected,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: isSelected ? AppColors.brand500 : AppColors.neutral500,
            width: 1.0,
          ),
           color: isSelected ? AppColors.brand100 : Colors.white
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [

            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: 2.0),
              ),
              child: isSelected
                  ? Center(
                child: Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.brand500,
                  ),
                ),
              )
                  : null,
            ),
            const SizedBox(width: 8.0),
            Text(
              label,
              style: FontTextStyle.labelLarge.copyWith(
                fontWeight: FontWeight.normal,
                color: AppColors.neutral900,
              )
            ),
            const Spacer(),
            SvgPicture.asset(
              icon,
              color:  AppColors.neutral900 ,
            ),
          ],
        ),
      ),
    );
  }
}
