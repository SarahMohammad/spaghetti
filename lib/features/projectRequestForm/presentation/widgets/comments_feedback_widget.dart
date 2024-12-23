import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:untitled3/commonWidgets/custom_form_field.dart';
import 'package:untitled3/features/projectRequestForm/presentation/controller/request_form_controller.dart';
import 'package:untitled3/uiHelpers/app_colors.dart';
import 'package:untitled3/uiHelpers/font_text_style.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../UIHelpers/icons.dart';
import '../../../../UIHelpers/images.dart';
import '../../../../commonWidgets/buttons/custom_button.dart';
import '../../../../uiHelpers/app_spacing.dart';
import '../../../../utils/button_enum.dart';
import 'attachment_list_tile.dart';

class CommentsAndFeedbackWidget extends StatelessWidget {
  final RxList<Comment> commentsList;
  final void Function()? onAddCommentPressed;

  const CommentsAndFeedbackWidget(
      {super.key, required this.commentsList, this.onAddCommentPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Comments Header
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() {
            return Text(
              'Comments (${commentsList.length})',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            );
          }),
        ),

        //Comments field
        Container(
          margin:  EdgeInsets.symmetric(horizontal: AppSpacing.m.getWidth()),
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.s.getWidth() ,
              vertical :AppSpacing.m.getHeight()),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TextField for the comment
              TextField(
                controller: null,
                decoration:  InputDecoration(
                  hintText: 'Comment',
                  border: InputBorder.none,
                  hintStyle: FontTextStyle.paragraphLarge.copyWith(color: AppColors.neutral800),
                ),
                maxLines: 2,
              ),

              // Icons and Send Button
              Row(
                children: [
                  GestureDetector(
                    child: SvgPicture.asset(AllIcons.attachmentIcon),
                     onTap: (){

                     },
                  ),
                  SizedBox(width: AppSpacing.m.getWidth(),),
                  GestureDetector(
                    child: SvgPicture.asset(AllIcons.mentionIcon),
                    onTap: (){

                    },
                  ),
                  const Spacer(),
                  Container(
                   padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                    child:  GestureDetector(
                      child: SvgPicture.asset(AllIcons.sendIcon , ),
                      onTap: onAddCommentPressed,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 16.0),

        // Comment List
        Obx(() {
          return Column(
            children: commentsList
                .map((comment) =>
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: _CommentTile(
                      name: 'Ahmed Ammar',
                      role: 'HR Manager',
                      date: 'Date',
                      message:
                      'Hi Mohamed, I can’t approve your request. I need an attachment to further approve your request.',
                      attachment: 'File name.pdf',
                      fileSize: '1.2MB',
                    )))
                .toList(),
          );
        }),

        // _CommentTile(
        //   name: 'Ahmed Ammar',
        //   role: 'HR Manager',
        //   date: 'Date',
        //   message:
        //       'Hi Mohamed, I can’t approve your request. I need an attachment to further approve your request.',
        // ),
        // _CommentTile(
        //   name: 'Mohamed Samer',
        //   role: 'Employee',
        //   date: 'Date',
        //   message:
        //       'Hello Ahmed, sorry for the trouble. Here is the Attachment you requested.',
        //   attachment: 'File name.pdf',
        //   fileSize: '1.2MB',
        // ),
        // _CommentTile(
        //   name: 'Ahmed Ammar',
        //   role: 'HR Manager',
        //   date: 'Date',
        //   message: 'Thank you Mohamed, I approved your request.',
        // ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: AppSpacing.m.getWidth(),
              vertical: AppSpacing.l.getHeight()),
          height: 52.getHeight(),
          width: double.infinity,
          child: CustomButton(
            key,
            buttonTitle: "View all",
            padding: EdgeInsets.zero,
            onPressed: () {},
            isDisabled: false,
            buttonType: ButtonType.tertiary,
          ),
        ),
        Container(
          width: double.infinity,
          height: 8,
          color: AppColors.neutral100,
        ),
        // Feedback Section
        Padding(
          padding: const EdgeInsets.all(16.0),
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
              // Row(
              //   children: List.generate(
              //     5,
              //     (index) => IconButton(
              //       onPressed: () {},
              //       icon: Icon(
              //         Icons.star_border,
              //         size: 32.0,
              //         color: Colors.grey,
              //       ),
              //     ),
              //   ),
              // ),

              Center(
                child: RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 12.getWidth()),
                  itemBuilder: (context, _) =>
                      Icon(
                        Icons.star_border,
                        color: Colors.amber,
                      ),
                  onRatingUpdate: (rating) {
                    //print(rating);
                  },
                ),
              ),


              SizedBox(height: AppSpacing.l.getHeight()),
              CustomFormField(
                maxLines: 3,
                maxLength: 300,
                labelText: "Add review",
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
                  buttonTitle: "Submit",
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  isDisabled: true,
                  buttonType: ButtonType.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CommentTile extends StatelessWidget {
  final String name;
  final String role;
  final String date;
  final String message;
  final String? attachment;
  final String? fileSize;

  const _CommentTile({
    required this.name,
    required this.role,
    required this.date,
    required this.message,
    this.attachment,
    this.fileSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.l.getWidth()),
          child: Row(
            children: [
              Image.asset(
                Images.avatar,
                height: 40,
              ),
              const SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: FontTextStyle.labelLarge
                          .copyWith(color: AppColors.neutral900)),
                  Text(role,
                      style: FontTextStyle.paragraphMedium
                          .copyWith(color: AppColors.neutral800)),
                ],
              ),
              const Spacer(),
              Text(date,
                  style: FontTextStyle.paragraphMedium
                      .copyWith(color: AppColors.neutral800)),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.l.getWidth()),
          child: Text(
            message,
            style: FontTextStyle.paragraphLarge
                .copyWith(color: AppColors.neutral800),
          ),
        ),
        if (attachment != null) AttachmentListTile(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.m.getWidth()),
          child: const Divider(),
        ),
      ],
    );
  }
}
