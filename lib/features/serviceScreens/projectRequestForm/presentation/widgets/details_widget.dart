import 'package:flutter/material.dart';
import 'package:untitled3/commonWidgets/bottomSheet/bottom_sheet_action.dart';
import 'package:untitled3/commonWidgets/custom_form_field.dart';
import 'package:untitled3/utils/constant.dart';

import 'label_value_row.dart';


class DetailsWidget extends StatelessWidget {
  // final bool isSelected;
  // final String icon;
  final String? projectLabel;
  final String? projectValue;
  final Widget? columnDetails;
  // final VoidCallback onTap;

  const DetailsWidget({
    Key? key,
     this.projectLabel,
     this.projectValue,
    this.columnDetails

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.getWidth() , vertical: 16.getHeight()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          projectLabel==null ? SizedBox():LabelValueRow(label: projectLabel!, value: projectValue!),
          columnDetails ?? SizedBox(),

        ],
      ),
    );
  }
}




