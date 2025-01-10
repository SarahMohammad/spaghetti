import 'package:flutter/material.dart';
import 'package:untitled3/uiHelpers/app_colors.dart';
import 'package:untitled3/uiHelpers/font_text_style.dart';
import 'package:untitled3/utils/constant.dart';

import 'label_value_row.dart';


class PartyDetailsCard extends StatelessWidget {
  final String name;
  final String type;
  final String category;
  const PartyDetailsCard({Key? key,
    required this.name,
    required this.type,
    required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.neutral500),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            name,
            style: FontTextStyle.headingMedium,
          ),
           SizedBox(height: 16.getHeight()),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Expanded(
                child: LabelValueRow(label: "Party Type 2", value: type),
              ),
              SizedBox(width: 24.getWidth()),
              const Expanded(
                child: LabelValueRow(
                    label: "Party Type 2 Name", value: "Khalid Elhawari"),
              ),
            ],
          ),
           SizedBox(height: 16.getHeight()),
          LabelValueRow(label: "Category 2", value: category),
        ],
      ),
    );
  }
}

