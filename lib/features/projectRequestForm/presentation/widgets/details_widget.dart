import 'package:flutter/material.dart';
import 'package:untitled3/features/projectRequestForm/presentation/widgets/label_value_row.dart';


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
      padding: EdgeInsets.all(16.0),
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




