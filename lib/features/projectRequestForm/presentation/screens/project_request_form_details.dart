import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:untitled3/commonWidgets/buttons/custom_button.dart';
import 'package:untitled3/features/projectRequestForm/presentation/widgets/project_status_widget.dart';
import 'package:untitled3/features/projectRequestForm/presentation/widgets/project_request_summery.dart';
import 'package:untitled3/uiHelpers/app_colors.dart';
import 'package:untitled3/utils/button_enum.dart';
import 'package:untitled3/utils/constant.dart';
import 'package:untitled3/utils/service_enum.dart';

import '../../../../UIHelpers/icons.dart';
import '../../../../commonWidgets/custom_app_bar.dart';
import '../../../../core/app_states/app_state_handler_widget.dart';
import '../../../../uiHelpers/app_spacing.dart';
import '../../../../uiHelpers/font_text_style.dart';
import '../../../../utils/translation_keys.dart';
import '../controller/request_form_controller.dart';
import '../widgets/attachment_list_tile.dart';
import '../widgets/comments_feedback_widget.dart';
import '../widgets/details_widget.dart';
import '../widgets/feedback_widget.dart';
import '../widgets/label_value_row.dart';
import '../widgets/party_details_card.dart';

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
                         requestFormController.getTopProjectDetails(),
                        requestFormController.serviceType== ServiceType.nonRcu ?
                        AttachmentListTile()
                        :PartyDetailsCard(),
                        requestFormController.getBottomProjectDetails(),

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

