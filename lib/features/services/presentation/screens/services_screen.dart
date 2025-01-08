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

class ServicesScreen extends StatelessWidget {
  ServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ServicesController>(
      builder: (servicesController) => AppStateHandlerWidget(
        state: servicesController.loadingState,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: false,
              snap: false,
              // expandedHeight: servicesController.isSearching
              //     ? Get.size.height * 0.19
              //     : Get.size.height * 0.12,
              collapsedHeight: servicesController.isSearching
                  ? Get.size.height * 0.19
                  : Get.size.height * 0.12,
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
                      isSearching: servicesController.isSearching,
                      onSearchChanged: servicesController.search,
                      onSearchIconClick: servicesController.toggleSearch,
                      title: services.tr,
                    ),
                  ),
                ],
              ),
            ),
            servicesController.isSearching &&
                servicesController.searchResult.length == 0
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
                : servicesController.searchQuery.isEmpty
                ? SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: AppSpacing.s.getHeight(),
                  right: AppSpacing.l.getWidth(),
                  left: AppSpacing.l.getWidth(),
                  top: AppSpacing.l.getHeight(),
                ),
                child: Obx(
                      () {
                    return ServiceCategoryWidget(
                        title: servicesController
                            .selectedCategoryTitle.value.isEmpty
                            ? selectCategory.tr
                            : servicesController
                            .selectedCategoryTitle.value,
                        onTap: () {
                          servicesController
                              .openCategoryBottomSheet();
                        });
                  },
                ),
              ),
            )
                : const SliverToBoxAdapter(
              child: SizedBox.shrink(),
            ),
            // The list of ServiceCardWidget
            servicesController.isSearching &&
                servicesController.searchResult.length == 0
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
                    title: servicesController.searchQuery.isNotEmpty
                        ? servicesController.searchResult[index].title
                        : servicesController.serviceList[index].title,
                    onPress: () {
                      servicesController.handleServicePress(index);
                    },
                    onFavPressed: () {},
                    isFav: false,
                    onShowDescriptionPress: () {
                      servicesController
                          .showServiceDescriptionBottomSheet(
                          servicesController.searchQuery.isNotEmpty
                              ? servicesController.searchResult[index]
                              : servicesController.serviceList[index],
                          key);
                    },
                  ),
                ),
                childCount: servicesController.searchQuery.isNotEmpty
                    ? servicesController.searchResult.length
                    : servicesController.serviceList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}