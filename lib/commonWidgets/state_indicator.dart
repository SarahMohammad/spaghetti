import 'package:flutter/material.dart';
import 'package:untitled3/uiHelpers/app_colors.dart';
import 'package:untitled3/uiHelpers/app_spacing.dart';
import 'package:untitled3/uiHelpers/font_text_style.dart';
import 'package:untitled3/utils/constant.dart';


class StateIndicator extends StatelessWidget {
  final Color? fillColor;
  final Color? borderColor;
  final Widget? middleIcon;
  final String? title;
  final String? description;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final Widget? child;


  const StateIndicator({
    Key? key,
    this.title,
    this.borderColor,
    this.child,
    this.description,
    this.fillColor,
    this.middleIcon,
    this.descriptionStyle,
    this.titleStyle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 120.getWidth(),
          height: 120.getWidth(),
          padding:  EdgeInsets.all(30.getWidth()),
          decoration: ShapeDecoration(
            color: fillColor ?? AppColors.primary100,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 8.getWidth(),
                  color: borderColor ?? AppColors.brand200),
              borderRadius: BorderRadius.circular(999),
            ),
          ),
          child: middleIcon ?? Icon(Icons.search),
        ),
        SizedBox(
          child: Text(
            title ?? "",
            textAlign: TextAlign.center,
            style: titleStyle ?? FontTextStyle.heading2X,
          ),
        ),
        SizedBox(height:AppSpacing.l.getHeight() ,),
        SizedBox(
          child: Text(
            description ?? "",
            textAlign:  TextAlign.center,
            style: descriptionStyle ?? FontTextStyle.paragraphLarge,
          ),
        ),
      ],
    );
  }
}
