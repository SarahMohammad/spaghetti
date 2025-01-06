import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:untitled3/UIHelpers/icons.dart';
import 'package:untitled3/uiHelpers/app_spacing.dart';
import 'package:untitled3/uiHelpers/font_text_style.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../../UIHelpers/images.dart';
import '../../../../../utils/translation_keys.dart';
import 'label_value_row.dart';


class ProjectRequestSummery extends StatelessWidget {
  final bool isCard;
  final bool isHeaderVisibile;
   const ProjectRequestSummery({Key? key,  this.isCard = true, this.isHeaderVisibile =true}) : super(key: key);

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
          isHeaderVisibile ?Text(
            summary.tr,
            style: FontTextStyle.headingLarge,
          ) :  const SizedBox.shrink() ,
          isHeaderVisibile ? SizedBox(height: AppSpacing.xl.getHeight()):const SizedBox(),

          Row(
            children: [
              Expanded(
                child: LabelValueRow(
                  label: requestFor.tr,
                  value: 'Ali Al Ghafli',
                  prefix: Image.asset(Images.avatar,height: 20,),
                ),
              ),
              const SizedBox(width: 40),

              // Second Row
              Expanded(
                child: LabelValueRow(
                  label: pendingOn.tr,
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
                  InkWell(
                    onTap: (){
                      Clipboard.setData(ClipboardData(text: "REQ 122821"));

                    },
                      child: SvgPicture.asset(AllIcons.copyIcon),
                  )
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

