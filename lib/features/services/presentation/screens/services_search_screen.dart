import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:untitled3/commonWidgets/sliver_app_bar_container.dart';
import 'package:untitled3/features/services/presentation/controller/services_controller.dart';
import 'package:untitled3/features/services/widgets/service_card_widget.dart';

import 'package:untitled3/uiHelpers/app_spacing.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../UIHelpers/icons.dart';
import '../../../../UIHelpers/images.dart';
import '../../../../commonWidgets/state_indicator.dart';
import '../../../../core/app_states/app_state_handler_widget.dart';
import '../../../../utils/translation_keys.dart';
import '../../widgets/service_category_widget.dart';

class ServicesSearchScreen extends StatelessWidget {
  ServicesSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ServicesController>(
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
                collapsedHeight:  Get.size.height * 0.19,
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
                        onSearchIconClick: controller.toggleSearch,
                        title: services.tr,
                      ),
                    ),
                  ],
                ),
              ),
              controller.isSearching &&
                  controller.searchResult.length == 0
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
                  : const SliverToBoxAdapter(
                child: SizedBox.shrink(),
              ),
              // The list of ServiceCardWidget
              controller.isSearching &&
                  controller.searchResult.length == 0
                  ? const SliverToBoxAdapter(
                child: SizedBox.shrink(),
              )
                  : SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) => Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: AppSpacing.m.getHeight(),
                      horizontal: AppSpacing.l.getWidth(),
                    ),
                    child: ServiceCardWidget(
                      title: controller.searchQuery.isNotEmpty
                          ? controller.searchResult[index].title
                          : controller.serviceList[index].title,
                      onPress: () {
                        controller.handleServicePress(index);
                      },
                      onFavPressed: () {},
                      isFav: false,
                      onShowDescriptionPress: () {
                        controller
                            .showServiceDescriptionBottomSheet(
                            controller.searchQuery.isNotEmpty
                                ? controller.searchResult[index]
                                : controller.serviceList[index],
                            key);
                      },
                    ),
                  ),
                  childCount: controller.searchQuery.isNotEmpty
                      ? controller.searchResult.length
                      : controller.serviceList.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}