import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:untitled3/uiHelpers/app_colors.dart';
import 'package:untitled3/uiHelpers/font_text_style.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../../UIHelpers/icons.dart';
import '../../../../../UIHelpers/images.dart';
import '../../../../../commonWidgets/buttons/custom_button.dart';
import '../../../../../functions/helper_classes.dart';
import '../../../../../uiHelpers/app_spacing.dart';
import '../../../../../utils/button_enum.dart';
import 'attachment_list_tile.dart';

class CommentsAndFeedbackWidget extends StatelessWidget {
  final RxList<Comment> commentsList;
  final bool? hideCommentHeader;
  final void Function()? onAddCommentPressed;

  const CommentsAndFeedbackWidget(
      {super.key, required this.commentsList, this.onAddCommentPressed ,
      this.hideCommentHeader = false });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Comments Header
        hideCommentHeader! ?SizedBox():Padding(
          padding:  EdgeInsets.all(16.getHeight()),
          child: Obx(() {
            return Text(
              'Comments (${commentsList.length})',
              style: FontTextStyle.headingLarge.copyWith(color: AppColors.neutral900),
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

         SizedBox(height: 16.getHeight()),

        // Comment List
        Obx(() {
          return Column(
            children: commentsList.asMap().entries.map((entry) {
              int index = entry.key;
              bool isLastItem = index == commentsList.length - 1;

              return Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: 8.getHeight()),
                    child: _CommentTile(
                      name: 'Ahmed Ammar',
                      role: 'HR Manager',
                      date: 'Date',
                      message:
                      'Hi Mohamed, I can’t approve your request. I need an attachment to further approve your request.',
                      attachment: 'File name.pdf',
                      fileSize: '1.2MB',
                    ),
                  ),
                  // Add a divider only if it's not the last item
                  if (!isLastItem) Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.m.getWidth()),
              child: const Divider(),
              ),
                ],
              );
            }).toList(),
          );
        }),

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
                height: 40.getHeight(),
                width: 40.getWidth(),
                fit: BoxFit.fill,
              ),
               SizedBox(width: 8.getWidth()),
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
         SizedBox(height: 8.getHeight()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.l.getWidth()),
          child: Text(
            message,
            style: FontTextStyle.paragraphLarge
                .copyWith(color: AppColors.neutral800),
          ),
        ),
        if (attachment != null) AttachmentListTile(prefixIcon: SvgPicture.asset(
            AllIcons
                .downloadIcon),),

      ],
    );
  }
}
