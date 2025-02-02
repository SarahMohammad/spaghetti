import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:untitled3/features/serviceScreens/nonRcuTemplateReviewRequest/presentation/controller/non_rcu_template_review_request_controller.dart';
import 'package:untitled3/uiHelpers/app_colors.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../../UIHelpers/icons.dart';
import '../../../../../commonWidgets/custom_app_bar.dart';
import '../../../../../core/app_states/app_state_handler_widget.dart';
import '../../../../../uiHelpers/app_spacing.dart';
import '../../../../../utils/translation_keys.dart';
import '../../../projectRequestForm/presentation/widgets/attachment_list_tile.dart';
import '../../../projectRequestForm/presentation/widgets/comments_feedback_widget.dart';
import '../../../projectRequestForm/presentation/widgets/details_widget.dart';
import '../../../projectRequestForm/presentation/widgets/feedback_widget.dart';
import '../../../projectRequestForm/presentation/widgets/label_value_row.dart';
import '../../../projectRequestForm/presentation/widgets/project_request_summery.dart';
import '../../../projectRequestForm/presentation/widgets/project_status_widget.dart';


class NonRcuFormDetails extends StatelessWidget {
  const NonRcuFormDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: GetBuilder<NonRcuTemplateReviewRequestController>(
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
                        status: controller.request.status,
                        role: controller.request.role,
                        pendingOn: controller.request.pendingOn,),

                        Container(
                          width: double.infinity,
                          height: 8,
                          color: AppColors.neutral100,
                        ),

                        Row(
                          children: [
                            Expanded(
                              child: ProjectRequestSummery(
                                  isCard : false,
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
                            projectLabel: "Name",
                            projectValue: controller.request.projectName,
                            columnDetails: Column(
                              children: [
                                SizedBox(height: AppSpacing.l.getHeight()),
                                LabelValueRow(label: "Description", value: controller.request.description??""),
                                SizedBox(height: AppSpacing.l.getHeight()),

                              ],
                            )
                        ),
                        AttachmentListTile(prefixIcon: SvgPicture.asset(
                            AllIcons
                                .downloadIcon),
                        fileName: "File name.pdf",
                        fileSize: "1,2MB",),
                        Container(
                          width: double.infinity,
                          height: 8,
                          color: AppColors.neutral100,
                        ),


                        CommentsAndFeedbackWidget(
                        commentsList : controller.commentsList ,
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

