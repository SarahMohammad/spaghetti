import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled3/commonWidgets/required_label.dart';
import 'package:untitled3/uiHelpers/app_spacing.dart';
import 'package:untitled3/uiHelpers/font_text_style.dart';
import 'package:untitled3/utils/constant.dart';

import '../uiHelpers/app_colors.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    // this.label,
    this.initialValue,
    this.isMandatory = false,
    this.inputFormatter,
    this.onTap,
    this.controller,
    this.suffix,
    this.maxLines = 1,
    this.hintText,
    this.focusBorderColor,
    this.focusNode,
    this.readOnly = false,
    this.onSaved,
    this.onChanged,
    this.obscureText = false,
    this.validator,
    this.keyboardType,
    this.prefixIcon,
    this.filledColor = Colors.white,
    this.fill = false,
    this.onFieldSubmitted,
    this.isPickerAndHasData = false,
    this.dataReview = false,
    this.enabled = true,
    this.maxLength,
    this.onEditingComplete,
    this.labelText,
    this.isRequired = true,
  }) : super(key: key);
  // final String? label;
  final String? initialValue;
  final bool isMandatory;
  final List<TextInputFormatter>? inputFormatter;
  final void Function()? onTap;
  final TextEditingController? controller;
  final Widget? suffix;
  final Widget? prefixIcon;
  final int? maxLines;
  final bool readOnly;
  final String? hintText;
  final Color? focusBorderColor;
  final FocusNode? focusNode;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String?)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Color? filledColor;
  final bool fill;
  final bool isPickerAndHasData;
  final bool? dataReview;
  final bool? enabled;
  final int? maxLength;
  final String? labelText;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RequiredLabel(labelText: labelText, isRequired: isRequired,),
        SizedBox(height: AppSpacing.s.getHeight(),),
        TextFormField(
          style: FontTextStyle.paragraphLarge.copyWith(color: AppColors.neutral700),
          maxLength: maxLength,
          onFieldSubmitted: onFieldSubmitted,
          readOnly: readOnly,
          initialValue: initialValue,
          maxLines: maxLines,
          controller: controller,
          enabled: enabled,
          onTap: onTap,
          onSaved: onSaved,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          validator: validator ??
              (String? value) {
                return null;
              },
          obscureText: obscureText,
          inputFormatters: inputFormatter ?? [],
          cursorColor: AppColors.primaryColor,
          keyboardType: keyboardType,
          focusNode: focusNode,
          decoration: InputDecoration(
            errorMaxLines: 2,
            suffixIcon: suffix,
            hintText: hintText,
            filled: fill ? true :false ,
            fillColor: filledColor,
            prefixIcon: prefixIcon,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.neutral500,
              ),
              borderRadius: BorderRadius.circular(
                12.0,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: AppColors.neutral500),
              borderRadius: BorderRadius.circular(
                12.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: readOnly
                    ? AppColors.neutral500
                    : AppColors.brand500,
              ),
              borderRadius: BorderRadius.circular(
                12.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.errorColor,
              ),
              borderRadius: BorderRadius.circular(
                12.0,
              ),
            ),
            hintStyle: FontTextStyle.paragraphLarge.copyWith(color: AppColors.neutral800)
          ),
        ),
      ],
    );
  }
}
