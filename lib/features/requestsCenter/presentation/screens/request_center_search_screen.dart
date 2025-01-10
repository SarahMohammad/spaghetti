import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:untitled3/commonWidgets/sliver_app_bar_container.dart';
import 'package:untitled3/features/requestsCenter/presentation/controller/requests_center_controller.dart';
import 'package:untitled3/features/services/presentation/controller/services_controller.dart';
import 'package:untitled3/features/services/widgets/service_card_widget.dart';

import 'package:untitled3/uiHelpers/app_spacing.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../UIHelpers/icons.dart';
import '../../../../UIHelpers/images.dart';
import '../../../../commonWidgets/state_indicator.dart';
import '../../../../core/app_states/app_state_handler_widget.dart';
import '../../../../utils/translation_keys.dart';
import '../../widgets/request_card.dart';

class RequestCenterSearchScreen extends StatelessWidget {
  const RequestCenterSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestsCenterController>(
      builder: (controller) => AppStateHandlerWidget(
        state: controller.loadingState,
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                floating: false,
                snap: false,
                expandedHeight: Get.size.height * 0.19,
                collapsedHeight: Get.size.height * 0.19,
                leading: const SizedBox(),
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
                        isSearching: true,
                        prefixIcon: AllIcons.closeIcon,
                        onSearchChanged: controller.search,
                        onSearchIconClick: controller.closeSearch,
                        title: services.tr,
                      ),
                    ),
                  ],
                ),
              ),
              controller.searchQuery.isNotEmpty &&
                  controller.searchResult.isEmpty
                  ? SliverFillRemaining(
                hasScrollBody: false,
                child: StateIndicator(
                  title: noSearchResult.tr,
                  description: noSearchDesc.tr,
                  middleIcon: SvgPicture.asset(AllIcons.searchIcon,
                      colorFilter: const ColorFilter.mode(
                          Colors.white, BlendMode.srcIn)),
                ),
              )
                  : controller.searchResult.isNotEmpty
                  ? SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) => Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: AppSpacing.m.getHeight(),
                      horizontal: AppSpacing.l.getWidth(),
                    ),
                    child: RequestCard(
                      onSettingsClick:
                      controller.openOptionsSheet,
                      category: controller.searchResult[index].categoryTitle,
                      title:controller.searchResult[index].title,
                      date: controller.searchResult[index].date,
                      inProgress: controller.searchResult[index].state.status == "In progress",
                      status: controller.searchResult[index].state.status,
                      statusTime: controller.searchResult[index].state.statusTime,
                      requestId: controller.searchResult[index].state.requestId,
                      pendingOn: controller.searchResult[index].state.pendingOn,
                    ),
                  ),
                  childCount: controller.searchResult.length,
                ),
              )
                  : const SliverToBoxAdapter(
                child: SizedBox.shrink(),
              ),
              // The list of ServiceCardWidget
            ],
          ),
        ),
      ),
    );
  }
}