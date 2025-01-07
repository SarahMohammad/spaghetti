import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../../UIHelpers/icons.dart';
import '../../../../../commonWidgets/buttons/custom_button.dart';
import '../../../../../commonWidgets/custom_form_field.dart';
import '../../../../../uiHelpers/app_colors.dart';
import '../../../../../uiHelpers/app_spacing.dart';
import '../../../../../uiHelpers/font_text_style.dart';
import '../../../../../utils/button_enum.dart';
import '../../../../../utils/translation_keys.dart';


class FeedbackWidget extends StatelessWidget {
  const FeedbackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
          vertical: 16.getHeight(),
      horizontal: 16.getWidth()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Feedback',
            style: FontTextStyle.headingLarge.copyWith(
                color: AppColors.neutral900),
          ),
          SizedBox(height: AppSpacing.l.getHeight()),
          Text(
            'How would you rate our service?',
            style: FontTextStyle.headingMedium.copyWith(
                color: AppColors.neutral900),
          ),
          SizedBox(height: AppSpacing.l.getHeight()),

          Center(
            child: RatingBar(
              ratingWidget: RatingWidget(
                full: SvgPicture.asset(AllIcons.filledStarIcon),
                half: SvgPicture.asset(AllIcons.filledStarIcon),
                empty: SvgPicture.asset(AllIcons.emptyStarIcon),
              ),
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 12.getWidth()),
              // itemBuilder: (context, _) =>
              //     Icon(
              //       Icons.star,
              //       color: Colors.amber,
              //     ),
              onRatingUpdate: (rating) {
                //print(rating);
              },

            ),
          ),


          SizedBox(height: AppSpacing.l.getHeight()),
          CustomFormField(
            maxLines: 3,
            maxLength: 300,
            labelText: addReview.tr,
            isRequired: false,
          ),
          // TextField(
          //   maxLines: 3,
          //   maxLength: 300,
          //   decoration: InputDecoration(
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(8.0),
          //     ),
          //   ),
          // ),
          const SizedBox(height: 16.0),
          Container(
            height: 52.getHeight(),
            width: double.infinity,
            child: CustomButton(
              key,
              buttonTitle: submit.tr,
              padding: EdgeInsets.zero,
              onPressed: () {},
              isDisabled: true,
              buttonType: ButtonType.primary,
            ),
          ),
        ],
      ),
    );
  }
}
