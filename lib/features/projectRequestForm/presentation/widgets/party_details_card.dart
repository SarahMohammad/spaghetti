import 'package:flutter/material.dart';
import 'package:untitled3/uiHelpers/app_colors.dart';
import 'package:untitled3/uiHelpers/font_text_style.dart';

import 'label_value_row.dart';


class PartyDetailsCard extends StatelessWidget {
  const PartyDetailsCard({Key? key}) : super(key: key);

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
            "Party 2",
            style: FontTextStyle.headingMedium,
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Expanded(
                child: LabelValueRow(label: "Party Type 2", value: "Person"),
              ),
              SizedBox(width: 24),
              Expanded(
                child: LabelValueRow(
                    label: "Party Type 2 Name", value: "Khalid Elhawari"),
              ),
            ],
          ),
          const SizedBox(height: 16),
          LabelValueRow(label: "Category 2", value: "Tenant"),
        ],
      ),
    );
  }
}

