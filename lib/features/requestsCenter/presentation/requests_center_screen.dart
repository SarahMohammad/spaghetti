import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:untitled3/commonWidgets/search_box.dart';
import 'package:untitled3/features/requestsCenter/widgets/filter_tabs.dart';
import 'package:untitled3/features/systems/widgets/system_card_widget.dart';
import 'package:untitled3/uiHelpers/app_colors.dart';
import 'package:untitled3/uiHelpers/app_spacing.dart';
import 'package:untitled3/uiHelpers/font_text_style.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../UIHelpers/icons.dart';
import '../../../UIHelpers/images.dart';
import '../../../commonWidgets/sliver_app_bar_container.dart';
import '../../../commonWidgets/state_indicator.dart';
import '../../../core/app_states/app_state_handler_widget.dart';
import '../controller/requests_center_controller.dart';
import '../widgets/request_card.dart';

class RequestsCenterScreen extends StatelessWidget {
  RequestsCenterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestsCenterController>(
      builder: (requestsCenterController) => AppStateHandlerWidget(
        state: requestsCenterController.loadingState,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: false,
              snap: false,
              expandedHeight: requestsCenterController.isSearching ? 120 : 100.0,
              collapsedHeight: requestsCenterController.isSearching ?150.0 :80,
              leading: SizedBox(),
              flexibleSpace: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Images.headerImg),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: SliverAppBarContainer(
                      isSearching: requestsCenterController.isSearching,
                      onSearchIconClick: requestsCenterController.toggleSearch,
                      title: "Request center",
                    ),
                  ),
                ],
              ),
            ),
            requestsCenterController.isSearching && requestsCenterController.searchResult.length == 0?
        SliverFillRemaining(
          hasScrollBody: false, // Ensures it doesn't allow internal scrolling
          child: StateIndicator(
            title: "No search results",
            description: "We couldn't find what you're looking for. Try using different phrases or words.",
            middleIcon: SvgPicture.asset(AllIcons.searchIcon,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
          ),
        )

           :
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: AppSpacing.s.getHeight(),
                  right: AppSpacing.l.getWidth(),
                  left: AppSpacing.l.getWidth(),
                  top: AppSpacing.l.getHeight(),
                ),
                child:  Obx(() => FilterTabs(
                  selectedChoice: requestsCenterController.selectedChoice.value,
                  onSelected: (choice) {
                    requestsCenterController.selectChoice(choice);
                  },
                )),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) => Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: AppSpacing.m.getHeight(),
                    horizontal: AppSpacing.l.getWidth(),
                  ),
                  child: RequestCard(onSettingsClick: requestsCenterController.openSettingsSheet,),
                ),
                childCount: 10, // Number of items in the list
              ),
            ),
          ],
        ),
      ),
    );
  }
}
