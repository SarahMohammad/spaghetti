import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled3/UIHelpers/icons.dart';
import 'package:untitled3/features/projectRequestForm/presentation/widgets/label_value_row.dart';
import 'package:untitled3/uiHelpers/app_colors.dart';
import 'package:untitled3/uiHelpers/app_spacing.dart';
import 'package:untitled3/uiHelpers/font_text_style.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../UIHelpers/images.dart';

class ProjectRequestSummery extends StatelessWidget {
  final bool isCard;
   const ProjectRequestSummery({Key? key,  this.isCard = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Container(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.l.getHeight(),
          horizontal: AppSpacing.l.getWidth()),
      width: MediaQuery.of(context).size.width * 0.9,

      decoration: isCard ? ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ): null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text('Request Details',
          //     style: FontTextStyle.headingLarge),
          // Header
          Text(
            'Summary',
            style: FontTextStyle.headingLarge,
          ),
           SizedBox(height: AppSpacing.xl.getHeight()),

          Row(
            children: [
              Expanded(
                child: LabelValueRow(
                  label: 'Request for',
                  value: 'Ali Al Ghafli',
                  prefix: Image.asset(Images.avatar,height: 20,),
                ),
              ),
              const SizedBox(width: 40),

              // Second Row
              Expanded(
                child: LabelValueRow(
                  label: 'Pending on',
                  value: 'Ali Al Ghafli',
                  prefix: Image.asset(Images.avatar,height: 20,),
                ),
              ),
            ],
          ),
          // First Row

          const SizedBox(height: 24),

          // Third Row (Request ID and ETA)
          Row(
            children: [
              Expanded(
                child: LabelValueRow(
                  label: 'Request ID',
                  value: 'REQ 122821',
                  suffix:
                  SvgPicture.asset(AllIcons.copyIcon)
                ),
              ),
               SizedBox(width: AppSpacing.xl.getWidth()),
              Expanded(
                child: LabelValueRow(
                  label: 'ETA Working days',
                  value: '4 business days',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

