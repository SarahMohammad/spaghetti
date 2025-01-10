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
          builder: (controller) => AppStateHandlerWidget(
            state: controller.loadingState,
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

                        ProjectStatusWidget(
                          pendingOn: controller.request.pendingOn,
                          role: controller.request.role,
                          status: controller.request.status,
                        ),

                        Container(
                          width: double.infinity,
                          height: 8,
                          color: AppColors.neutral100,
                        ),

                        Row(
                          children: [
                            Expanded(
                              child: ProjectRequestSummery(
                              isCard : false ,
                              requestForVal: controller.request.requestFor,
                              pendingOnVal : controller.request.pendingOn,
                              requestId: controller.request.requestId,
                              workingDays: controller.request.etaWorkingDays),
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
                            projectValue: controller.request.projectName,
                            columnDetails: Column(
                              children: [
                                SizedBox(height: AppSpacing.l.getHeight()),
                                 Row(
                                  children: [
                                    Expanded(
                                      child: LabelValueRow(
                                          label: "Project Implementation Year", value: controller.request.projectImplementationYear),
                                    ),
                                    SizedBox(width: AppSpacing.l.getHeight()),
                                    Expanded(
                                      child: LabelValueRow(
                                          label: "Expected Closing Date", value: controller.request.expectedClosingDate),
                                    ),
                                  ],
                                ),
                                SizedBox(height: AppSpacing.l.getHeight()),
                                Row(
                                  children: [
                                    Expanded(
                                      child: LabelValueRow(label: "Value", value: controller.request.value),
                                    ),
                                    SizedBox(width: AppSpacing.l.getHeight()),
                                    Expanded(
                                      child: LabelValueRow(
                                          label: "Approval Authority", value: controller.request.approvalAuthority),
                                    ),
                                  ],
                                ),
                                SizedBox(height: AppSpacing.l.getHeight()),
                                Row(
                                  children: [
                                    Expanded(
                                      child: LabelValueRow(
                                          label: "Management Approval", value: controller.request.managementApproval),
                                    ),
                                    SizedBox(width: AppSpacing.l.getHeight()),
                                    Expanded(
                                      child: LabelValueRow(
                                          label: "External Approval", value: controller.request.externalApproval),
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
                        Column(
                          children: controller.request.parties
                              .asMap()
                              .entries
                              .map((entry) => Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                  AppSpacing.m.getHeight()),
                              child: PartyDetailsCard(
                                name: entry.value.name,
                                category: entry.value.category,
                                type: entry.value.type,
                              ),),)
                              .toList(),
                        ),

                        DetailsWidget(
                            columnDetails: Column(
                              children: [
                                Row(children: [
                                  Expanded(child: LabelValueRow(label: "Authorized Personnel", value: controller.request.authorizedPersonal)),
                                  SizedBox(width: AppSpacing.l.getWidth()),
                                  Expanded(child: LabelValueRow(label: "Similar Projects", value: controller.request.similarProjects)),
                                ],)


                              ],
                            )
                        ),

                        Container(
                          width: double.infinity,
                          height: 8,
                          color: AppColors.neutral100,
                        ),


                        CommentsAndFeedbackWidget(commentsList : controller.commentsList ,
                        onAddCommentPressed : controller.addComment),
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

