import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/commonWidgets/sliver_app_bar_container.dart';
import 'package:untitled3/features/services/presentation/controller/services_controller.dart';
import 'package:untitled3/features/services/widgets/service_card_widget.dart';

import 'package:untitled3/uiHelpers/app_spacing.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../UIHelpers/images.dart';
import '../../../../core/app_states/app_state_handler_widget.dart';
import '../../../../utils/translation_keys.dart';
import '../../widgets/service_category_widget.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

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
                      onSearchIconClick: servicesController.toggleSearch,
                      title: services.tr,
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
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
                            : servicesController.selectedCategoryTitle.value,
                        onTap: () {
                          servicesController.openCategoryBottomSheet();
                        });
                  },
                ),
              ),
            ), // The list of ServiceCardWidget
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) => Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: AppSpacing.m.getHeight(),
                    horizontal: AppSpacing.l.getWidth(),
                  ),
                  child: ServiceCardWidget(
                    title: servicesController.serviceList[index].title,
                    onPress: () {
                      servicesController.handleServicePress(index);
                    },
                    onFavPressed: () {},
                    isFav: false,
                    onShowDescriptionPress: () {
                      servicesController.showServiceDescriptionBottomSheet(
                          servicesController.serviceList[index], key);
                    },
                  ),
                ),
                childCount: servicesController.serviceList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}