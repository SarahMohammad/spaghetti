import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:untitled3/uiHelpers/app_spacing.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../UIHelpers/icons.dart';
import '../../../../UIHelpers/images.dart';
import '../../../../commonWidgets/sliver_app_bar_container.dart';
import '../../../../commonWidgets/state_indicator.dart';
import '../../../../commonWidgets/system_card_widget.dart';
import '../../../../core/app_states/app_state_handler_widget.dart';
import '../../../../utils/translation_keys.dart';
import '../controller/systems_controller.dart';

class SystemsScreen extends StatelessWidget {
  SystemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SystemsController>(
      builder: (systemController) => AppStateHandlerWidget(
        state: systemController.loadingState,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: false,
              snap: false,
              expandedHeight: systemController.isSearching
                  ? Get.size.height * 0.19
                  : Get.size.height * 0.12,
              collapsedHeight: systemController.isSearching
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
                      isSearching: systemController.isSearching,
                      onSearchIconClick: systemController.toggleSearch,
                      title: systems.tr,
                    ),
                  ),
                ],
              ),
            ),
          systemController.isSearching && systemController.searchResult.length == 0?
        SliverFillRemaining(
          hasScrollBody: false,
          child: StateIndicator(
            title: noSearchResult.tr,
            description: noSearchDesc.tr,
            middleIcon: SvgPicture.asset(AllIcons.searchIcon,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
          ),
        )

           : SliverPadding(
            padding:  EdgeInsets.only(top: AppSpacing.l.getHeight()),
            sliver:  SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) => Padding(
                        padding:  EdgeInsets.symmetric(vertical : AppSpacing.m.getHeight(), horizontal: AppSpacing.l.getWidth()),
                        child: SystemCardWidget(onReadMorePress: (){
                          systemController.showServiceDescriptionBottomSheet(
                              systemController.systemsList[index], key);
                        },),
                      ),
                  childCount: 10, // Number of items in the list
                ),
              ),
           ),
          ],
        ),
      ),
    );
  }
}
