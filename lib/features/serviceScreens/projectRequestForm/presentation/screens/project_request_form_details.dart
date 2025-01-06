import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:untitled3/uiHelpers/app_colors.dart';
import 'package:untitled3/uiHelpers/font_text_style.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../../commonWidgets/custom_app_bar.dart';
import '../../../../../core/app_states/app_state_handler_widget.dart';
import '../../../../../uiHelpers/app_spacing.dart';
import '../../../../../utils/translation_keys.dart';
import '../controller/request_form_controller.dart';
import '../widgets/comments_feedback_widget.dart';
import '../widgets/details_widget.dart';
import '../widgets/feedback_widget.dart';
import '../widgets/label_value_row.dart';
import '../widgets/party_details_card.dart';
import '../widgets/project_request_summery.dart';
import '../widgets/project_status_widget.dart';

class ProjectRequestFormDetails extends StatelessWidget {
  const ProjectRequestFormDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: GetBuilder<RequestFormController>(
          builder: (requestFormController) => AppStateHandlerWidget(
            state: requestFormController.loadingState,
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

                       const Row(
                          children: [
                            Expanded(
                              child: ProjectRequestSummery(isCard : false),
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
                                          label: "Project Implementation Year", value: "2025"),
                                    ),
                                    SizedBox(width: 24),
                                    Expanded(
                                      child: LabelValueRow(
                                          label: "Expected Closing Date", value: "11/12/2026"),
                                    ),
                                  ],
                                ),
                                SizedBox(height: AppSpacing.l.getHeight()),
                                Row(
                                  children: [
                                    Expanded(
                                      child: LabelValueRow(label: "Value", value: "Typed text"),
                                    ),
                                    SizedBox(width: 24),
                                    Expanded(
                                      child: LabelValueRow(
                                          label: "Approval Authority", value: "Typed text"),
                                    ),
                                  ],
                                ),
                                SizedBox(height: AppSpacing.l.getHeight()),
                                Row(
                                  children: [
                                    Expanded(
                                      child: LabelValueRow(
                                          label: "Management Approval", value: "Typed text"),
                                    ),
                                    SizedBox(width: 24),
                                    Expanded(
                                      child: LabelValueRow(
                                          label: "External Approval", value: "Typed text"),
                                    ),
                                  ],
                                ),
                                SizedBox(height: AppSpacing.l.getHeight()),
                              ],
                            )
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.getWidth()),
                          child: Text("Parties" , style: FontTextStyle.headingMedium,),
                        ),
                        PartyDetailsCard(),
                        DetailsWidget(

                            columnDetails: Column(
                              children: [
                                Row(children: [
                                  Expanded(child: LabelValueRow(label: "Authorized Personnel", value: "Typed text")),
                                  SizedBox(width: AppSpacing.l.getWidth()),
                                  Expanded(child: LabelValueRow(label: "Similar Projects", value: "Typed text")),
                                ],)


                              ],
                            )
                        ),

                        Container(
                          width: double.infinity,
                          height: 8,
                          color: AppColors.neutral100,
                        ),


                        CommentsAndFeedbackWidget(commentsList : requestFormController.commentsList ,
                        onAddCommentPressed : requestFormController.addComment),
                        // Feedback Section
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

