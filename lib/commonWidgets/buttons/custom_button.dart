import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled3/commonWidgets/bottomSheet/bottom_sheet_action.dart';
import 'package:untitled3/uiHelpers/app_spacing.dart';
import 'package:untitled3/utils/constant.dart';

import '../../uiHelpers/app_colors.dart';
import '../../uiHelpers/font_text_style.dart';
import '../../utils/button_enum.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final double? borderWidth;
  final double? radius;
  final String? buttonTitle;
  final ButtonType buttonType;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final bool isDisabled;
  final bool? showSuffixIcon;
  final SvgPicture? suffixIcon;

  const CustomButton(Key? key,
      {this.onPressed,
      this.borderWidth,
      this.buttonTitle,
      this.radius,
      this.child,
      this.padding,
      this.showSuffixIcon = false,
      this.suffixIcon,
      this.isDisabled = false,
      required this.buttonType })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      color: buttonType == ButtonType.primary && !isDisabled
          ? AppColors.brand500
          : buttonType == ButtonType.primary && isDisabled
          ? AppColors.neutral500
          : Colors.white,
      disabledColor: buttonType == ButtonType.primary
          ? AppColors.neutral500
          : Colors.white,
      shape: OutlineInputBorder(
        borderSide: BorderSide(
          width: buttonType == ButtonType.primary ? 0 : 1,
          color: buttonType == ButtonType.primary && isDisabled
              ? Colors.transparent
              : buttonType != ButtonType.primary && isDisabled
              ? AppColors.neutral500
              : buttonType == ButtonType.secondary && !isDisabled
              ? AppColors.brand500
              : AppColors.neutral500,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(radius ?? 40),
        ),
      ),
      padding: padding ?? const EdgeInsets.all(16),
      onPressed: onPressed ?? () {},
      splashColor: !isDisabled
          ? buttonType == ButtonType.primary
          ? AppColors.brand700
          : buttonType == ButtonType.secondary
          ? AppColors.brand200
          : AppColors.neutral200
          : Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min, // Ensure the Row only takes the necessary space
        children: [
          Flexible(
            child: child ??
                Text(
                  buttonTitle ?? "",
                  style: FontTextStyle.labelMedium.copyWith(
                    color: isDisabled
                        ? AppColors.neutral700
                        : buttonType == ButtonType.primary
                        ? Colors.white
                        : buttonType == ButtonType.secondary
                        ? AppColors.brand500
                        : AppColors.neutral900,
                    overflow: TextOverflow.ellipsis, // Prevent text overflow
                  ),
                  maxLines: 1, // Restrict to a single line
                ),
          ),
          if (showSuffixIcon!)
            SizedBox(width: AppSpacing.xs.getWidth()),
          if (showSuffixIcon!)
            Flexible(
              child: suffixIcon!,
            ),
        ],
      ),
    );
  }

}
