import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled3/uiHelpers/app_colors.dart';
import 'package:untitled3/utils/constant.dart';

import '../UIHelpers/icons.dart';
import '../uiHelpers/font_text_style.dart';

class SearchBox extends StatelessWidget {
  final void Function(String)? onChanged;
  final void Function()? onSuffixClick;
  final String? title;
  final double? height;
  final TextEditingController? controller;
  final bool? suffixIconExist;
  final bool? prefixIconExist;
  final bool isPrefixIconVisible;
  final IconData? suffixIcon;
  final double? suffixIconSize;
  final Color? suffixColor;
  final Color? prefixIconColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final TextStyle? titleStyle;
  final void Function()? onTap;
  final void Function(String?)? onSearch;

  const SearchBox({
    Key? key,
    required this.onChanged,
    this.onSuffixClick,
    this.backgroundColor,
    this.titleStyle,
    this.prefixIconColor,
    this.height,
    this.title,
    this.controller,
    this.suffixIconSize,
    this.suffixIcon,
    this.suffixColor,
    this.borderColor,
    this.onSearch,
    this.isPrefixIconVisible = true,
    this.suffixIconExist = false,
    this.prefixIconExist = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: height ?? 48.getHeight(),
      padding: prefixIconExist! ? null :EdgeInsets.symmetric(horizontal: 20.getWidth()) ,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        border: Border.all(
          color: borderColor ?? AppColors.brand500,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: TextFormField(
          // controller: searchController
            style: FontTextStyle.labelMedium.copyWith(color: Colors.white),
            controller: controller,
            textAlignVertical: TextAlignVertical.center,
            onTap: onTap,
            onChanged: onChanged,
            decoration: InputDecoration(
              suffixIcon: suffixIconExist!
                  ? InkWell(
                onTap:
                // () {controller!.clear();
                onSuffixClick,
                //},
                child:  Icon(
                  suffixIcon ?? Icons.clear,
                  color: suffixColor ?? AppColors.neutral900,
                  size: suffixIconSize ?? 24,
                ),
              )
                  : null,
              border: InputBorder.none,
              prefixIcon:
              prefixIconExist! ?
              SizedBox(

                child: isPrefixIconVisible?
                SvgPicture.asset(
                  AllIcons.searchBoxIcon,
                  fit: BoxFit.scaleDown,
                  color: prefixIconColor ?? Colors.white,
                ) :const SizedBox(),
              ):null,
              // alignLabelWithHint: true,
              hintText: title ??"",
              // contentPadding: EdgeInsets.only(bottom: 5.getHeight()),
              hintStyle: titleStyle ?? FontTextStyle.labelMedium.copyWith(fontSize: 14.getFontSize()),
            ),
            onFieldSubmitted: onSearch
        ),
      ),
    );
  }
}
