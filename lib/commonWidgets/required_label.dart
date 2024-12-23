import 'package:flutter/material.dart';
import 'package:untitled3/uiHelpers/font_text_style.dart';

import '../uiHelpers/app_colors.dart';

class RequiredLabel extends StatelessWidget {
  const RequiredLabel({
    Key? key,
    this.labelText,
    this.isRequired = true,
  }) : super(key: key);

  final String? labelText;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          labelText ?? "",
          style: FontTextStyle.labelLarge.copyWith(color: AppColors.neutral800),
        ),
        isRequired ? Text("*" , style: FontTextStyle.paragraphMedium.copyWith(color: AppColors.negative500)
        ): const SizedBox()
      ],
    );
  }
}
