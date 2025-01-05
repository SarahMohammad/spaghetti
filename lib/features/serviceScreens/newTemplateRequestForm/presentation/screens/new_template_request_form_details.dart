import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:untitled3/features/serviceScreens/newTemplateRequestForm/presentation/controller/new_template_request_form_controller.dart';
import 'package:untitled3/uiHelpers/app_colors.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../../commonWidgets/custom_app_bar.dart';
import '../../../../../core/app_states/app_state_handler_widget.dart';
import '../../../../../uiHelpers/app_spacing.dart';
import '../../../../../utils/translation_keys.dart';
import '../../../projectRequestForm/presentation/widgets/comments_feedback_widget.dart';
import '../../../projectRequestForm/presentation/widgets/details_widget.dart';
import '../../../projectRequestForm/presentation/widgets/feedback_widget.dart';
import '../../../projectRequestForm/presentation/widgets/label_value_row.dart';
import '../../../projectRequestForm/presentation/widgets/party_details_card.dart';
import '../../../projectRequestForm/presentation/widgets/project_request_summery.dart';
import '../../../projectRequestForm/presentation/widgets/project_status_widget.dart';


class NewTemplateRequestFormDetails extends StatelessWidget {
  const NewTemplateRequestFormDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: GetBuilder<NewTemplateRequestFormController>(
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
                                SizedBox(height: AppSpacing.l.getHeight()),
                                Row(
                                  children: [
                                    Expanded(
                                      child: LabelValueRow(label: "Project Duration", value: "1-3 months"),
                                    ),
                                    SizedBox(width: AppSpacing.l.getWidth()),
                                    Expanded(
                                      child: LabelValueRow(
                                          label: "Project Owner", value: "Ahmed hassan"),
                                    ),
                                  ],
                                ),
                                SizedBox(height: AppSpacing.l.getHeight()),
                              ],
                            )
                        ),
                        PartyDetailsCard(),
                        DetailsWidget(

                            columnDetails: Column(
                              children: [
                                SizedBox(height: AppSpacing.l.getHeight()),
                                Row(
                                  children: [
                                    Expanded(child: LabelValueRow(label: "value", value: "Typed text")),
                                    SizedBox(width: AppSpacing.l.getWidth()),
                                    Expanded(child: LabelValueRow(label: "payment structure", value: "Typed text")),


                                  ],
                                ),
                                SizedBox(height: AppSpacing.l.getHeight()),

                                Row(
                                  children: [
                                    Expanded(child: LabelValueRow(label: "similar projects", value: "Typed text")),
                                    SizedBox(width: AppSpacing.l.getWidth()),
                                    Expanded(child: LabelValueRow(label: "Authorized personnel", value: "Typed text")),

                                  ],
                                ),

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

