import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:untitled3/features/projectRequestForm/presentation/widgets/project_status_widget.dart';
import 'package:untitled3/features/projectRequestForm/presentation/widgets/project_request_summery.dart';
import 'package:untitled3/features/requestsCenter/controller/requests_center_controller.dart';
import 'package:untitled3/uiHelpers/app_colors.dart';
import 'package:untitled3/utils/constant.dart';
import 'package:untitled3/utils/service_enum.dart';

import '../../../../commonWidgets/custom_app_bar.dart';
import '../../../../core/app_states/app_state_handler_widget.dart';

import '../../../../utils/translation_keys.dart';
import '../../../UIHelpers/icons.dart';
import '../../../uiHelpers/app_spacing.dart';
import '../../../uiHelpers/font_text_style.dart';
import '../../projectRequestForm/presentation/widgets/comments_feedback_widget.dart';
import '../../projectRequestForm/presentation/widgets/details_widget.dart';
import '../../projectRequestForm/presentation/widgets/feedback_widget.dart';
import '../../projectRequestForm/presentation/widgets/label_value_row.dart';
import '../../projectRequestForm/presentation/widgets/party_details_card.dart';

class RequestCenterDetails extends StatelessWidget {
  const RequestCenterDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: GetBuilder<RequestsCenterController>(
          builder: (requestsCenterController) => AppStateHandlerWidget(
            state: requestsCenterController.loadingState,
            child: SingleChildScrollView(
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    CustomAppBar(
                      title: projectRequestForm.tr,
                      showBackBtn: true,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProjectStatusWidget(),
                        Container(
                          width: double.infinity,
                          height: 8,
                          color: AppColors.neutral100,
                        ),
                        Theme(
                            data: Theme.of(context).copyWith(
                              dividerColor: Colors.transparent, // Removes the border
                            ),
                          child: ExpansionTile(
                            title: Text(""),
                            leading: SizedBox(
                              width: Get.size.width/2,
                              child: Padding(
                                padding:  EdgeInsets.symmetric( vertical: 15.getHeight()),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Request details',
                                      style: FontTextStyle.headingLarge.copyWith(color: AppColors.neutral900),
                                    ),

                                    const Spacer()
                                  ],
                                ),
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  requestsCenterController.isSummeryExpanded ? "Hide" : "Show",
                                  style: FontTextStyle.labelMedium.copyWith(
                                    color: AppColors.primary100,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.primary100,
                                  ),
                                ),
                                SizedBox(width: AppSpacing.xxs.getWidth()),
                                AnimatedRotation(
                                    turns: requestsCenterController.isSummeryExpanded ? 0.5 : 0,
                                    duration: const Duration(milliseconds: 300),
                                    child: SvgPicture.asset(AllIcons.downArrowIcon , width: 16,
                                      colorFilter:ColorFilter.mode(
                                          AppColors.primary100, BlendMode.srcIn) ,
                                    )
                                ),

                              ],
                            ),
                            onExpansionChanged: (bool expanded) {
                              requestsCenterController.updateExpansionSummeryState(expanded);
                            },

                            children: [
                              const Row(
                                children: [
                                  Expanded(
                                    child: ProjectRequestSummery(isCard: false , isHeaderVisibile:false),
                                  ),
                                ],
                              ),
                              Container(
                                width: double.infinity,
                                height: 8,
                                color: AppColors.neutral100,
                              ),
                              DetailsWidget(
                                  projectLabel: "Project name",
                                  projectValue: "Emp digital exp",
                                  columnDetails: Column(
                                    children: [
                                      SizedBox(height: AppSpacing.l.getHeight()),
                                      const Row(
                                        children: [
                                          Expanded(
                                            child: LabelValueRow(
                                                label:
                                                    "Project Implementation Year",
                                                value: "2025"),
                                          ),
                                          SizedBox(width: 24),
                                          Expanded(
                                            child: LabelValueRow(
                                                label: "Expected Closing Date",
                                                value: "11/12/2026"),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: AppSpacing.l.getHeight()),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: LabelValueRow(
                                                label: "Value",
                                                value: "Typed text"),
                                          ),
                                          SizedBox(width: 24),
                                          Expanded(
                                            child: LabelValueRow(
                                                label: "Approval Authority",
                                                value: "Typed text"),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: AppSpacing.l.getHeight()),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: LabelValueRow(
                                                label: "Management Approval",
                                                value: "Typed text"),
                                          ),
                                          SizedBox(width: 24),
                                          Expanded(
                                            child: LabelValueRow(
                                                label: "External Approval",
                                                value: "Typed text"),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: AppSpacing.l.getHeight()),
                                    ],
                                  )),
                              PartyDetailsCard(),
                              DetailsWidget(
                                  columnDetails: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: LabelValueRow(
                                              label: "Authorized Personnel",
                                              value: "Typed text")),
                                      SizedBox(width: AppSpacing.l.getWidth()),
                                      Expanded(
                                          child: LabelValueRow(
                                              label: "Similar Projects",
                                              value: "Typed text")),
                                    ],
                                  )
                                ],
                              )),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 8,
                          color: AppColors.neutral100,
                        ),

                        Theme(
                          data: Theme.of(context).copyWith(
                            dividerColor: Colors.transparent, // Removes the border
                          ),
                          child: ExpansionTile(
                            title:  Text(""),
                            leading:  Obx(() {
                              return SizedBox(
                                width: Get.size.width/2,
                                child: Padding(
                                  padding:  EdgeInsets.symmetric( vertical: 15.getHeight()),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Comments (${requestsCenterController.commentsList.length})',
                                        style: FontTextStyle.headingLarge.copyWith(color: AppColors.neutral900),
                                      ),
                                      Spacer()
                                    ],
                                  ),
                                ),
                              );
                            }),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  requestsCenterController.isCommentsExpanded ? "Hide" : "Show",
                                  style: FontTextStyle.labelMedium.copyWith(
                                    color: AppColors.primary100,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.primary100,
                                  ),
                                ),
                                 SizedBox(width: AppSpacing.xxs.getWidth()),
                                AnimatedRotation(
                                  turns: requestsCenterController.isCommentsExpanded ? 0.5 : 0,
                                  duration: const Duration(milliseconds: 300),
                                  child: SvgPicture.asset(AllIcons.downArrowIcon , width: 16,
                                    colorFilter:ColorFilter.mode(
                                        AppColors.primary100, BlendMode.srcIn) ,
                                 )
                                ),

                                ],
                            ),
                              onExpansionChanged: (bool expanded) {
                                requestsCenterController.updateExpansionCommentsState(expanded);
                              },
                              children: [

                                CommentsAndFeedbackWidget(
                                    commentsList:
                                        requestsCenterController.commentsList,
                                    onAddCommentPressed:
                                        requestsCenterController.addComment ,
                                  hideCommentHeader : true
                                ),
                              ],
                          ),
                            // Feedback Section
                        ),
                        Container(
                          width: double.infinity,
                          height: 8,
                          color: AppColors.neutral100,
                        ),
                        FeedbackWidget()

                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
