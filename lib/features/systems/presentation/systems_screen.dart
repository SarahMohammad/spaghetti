import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:untitled3/commonWidgets/search_box.dart';
import 'package:untitled3/features/systems/widgets/system_card_widget.dart';
import 'package:untitled3/uiHelpers/app_colors.dart';
import 'package:untitled3/uiHelpers/app_spacing.dart';
import 'package:untitled3/uiHelpers/font_text_style.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../UIHelpers/icons.dart';
import '../../../UIHelpers/images.dart';
import '../../../commonWidgets/state_indicator.dart';
import '../../../core/app_states/app_state_handler_widget.dart';
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
              expandedHeight: systemController.isSearching ? 150.0 : 110.0,
              collapsedHeight: systemController.isSearching ?150.0 :80,
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
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 25.getWidth(),
                        top: 60.getHeight(),
                        right: 28.getHeight(),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Systems",
                                style: FontTextStyle.headingX.copyWith(color: Colors.white),
                              ),
                              GestureDetector(
                                onTap: () {
                                  systemController.toggleSearch();
                                },
                                child: Container(
                                  width: 40.getWidth(),
                                  height: 40.getHeight(),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: SvgPicture.asset(
                                      AllIcons.searchIcon,
                                      color: Colors.yellow,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              height: systemController.isSearching
                                  ? 20.getHeight()
                                  : 10),
                          // Show search box only when in search mode and app bar is expanded
                          if (systemController.isSearching)
                            SearchBox(
                              onChanged: null,
                              prefixIconExist: true ,
                              suffixColor: Colors.white,
                              backgroundColor: AppColors.brand700,
                              title: "Search",
                              prefixIconColor: Colors.white,
                              titleStyle: FontTextStyle.paragraphLarge.copyWith(color: Colors.white)
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          systemController.isSearching && systemController.searchResult.length == 0?
        SliverFillRemaining(
          hasScrollBody: false, // Ensures it doesn't allow internal scrolling
          child: StateIndicator(
            title: "No search results",
            description: "We couldn't find what you're looking for. Try using different phrases or words.",
            middleIcon: SvgPicture.asset(AllIcons.searchIcon,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
          ),
        )

           : SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) => Padding(
                      padding:  EdgeInsets.symmetric(vertical : AppSpacing.s.getHeight(), horizontal: AppSpacing.l.getWidth()),
                      child: SystemCardWidget(),
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
