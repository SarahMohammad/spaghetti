import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:untitled3/features/requestsCenter/widgets/filter_tabs.dart';
import 'package:untitled3/uiHelpers/app_spacing.dart';
import 'package:untitled3/utils/constant.dart';
import 'package:untitled3/utils/translation_keys.dart';

import '../../../../UIHelpers/icons.dart';
import '../../../../UIHelpers/images.dart';
import '../../../../commonWidgets/sliver_app_bar_container.dart';
import '../../../../commonWidgets/state_indicator.dart';
import '../../../../core/app_states/app_state_handler_widget.dart';
import '../../widgets/request_card.dart';
import '../controller/requests_center_controller.dart';

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
              expandedHeight: requestsCenterController.isSearching
                  ? Get.size.height * 0.19
                  : Get.size.height * 0.12,
              collapsedHeight: requestsCenterController.isSearching
                  ? Get.size.height * 0.19
                  : Get.size.height * 0.12,
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
                      title: requestCenter.tr,
                    ),
                  ),
                ],
              ),
            ),
            requestsCenterController.isSearching &&
                    requestsCenterController.searchResult.length == 0
                ? SliverFillRemaining(
                    hasScrollBody: false,
                    child: StateIndicator(
                      title: noSearchResult.tr,
                      description:
                      noSearchDesc.tr,
                      middleIcon: SvgPicture.asset(AllIcons.searchIcon,
                          colorFilter: const ColorFilter.mode(
                              Colors.white, BlendMode.srcIn)),
                    ),
                  )
                : SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: AppSpacing.s.getHeight(),
                        right: AppSpacing.l.getWidth(),
                        left: AppSpacing.l.getWidth(),
                        top: AppSpacing.l.getHeight(),
                      ),
                      child: Obx(() => FilterTabs(
                            selectedChoice:
                                requestsCenterController.selectedFilter.value,
                            onSelected: (choice) {
                              requestsCenterController.selectChoice(choice);
                            },
                        categories: requestsCenterController.categories,
                          )),
                    ),
                  ),
            requestsCenterController.isSearching &&
                    requestsCenterController.searchResult.length == 0
                ? const SliverToBoxAdapter(
                    child: SizedBox.shrink(),
                  )
                : requestsCenterController.filteredRequests.isEmpty
                ? const SliverToBoxAdapter(
              child: Center(
                child: Text("No data available"),
              ),
            )
                : Obx(
                  () => SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    final request = requestsCenterController.filteredRequests[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: AppSpacing.m.getHeight(),
                        horizontal: AppSpacing.l.getWidth(),
                      ),
                      child: RequestCard(
                        onSettingsClick:
                        requestsCenterController.openOptionsSheet,
                        category: request.categoryTitle,
                        title: request.title,
                        date: request.date,
                        inProgress: request.state.status == "In progress",
                        status: request.state.status,
                        statusTime: request.state.statusTime,
                        requestId: request.state.requestId,
                        pendingOn: request.state.pendingOn,
                      ),
                    );
                  },
                  childCount: requestsCenterController.filteredRequests.length,
                ),
              ),
            )

        ],
        ),
      ),
    );
  }
}
