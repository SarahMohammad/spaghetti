import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:untitled3/uiHelpers/app_spacing.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../UIHelpers/icons.dart';
import '../../../../UIHelpers/images.dart';
import '../../../../commonWidgets/search_box.dart';
import '../../../../commonWidgets/sliver_app_bar_container.dart';
import '../../../../core/app_states/app_state_handler_widget.dart';
import '../../../../uiHelpers/app_colors.dart';
import '../../../../uiHelpers/font_text_style.dart';
import '../../../../commonWidgets/system_card_widget.dart';
import '../../../services/widgets/service_card_widget.dart';
import '../controller/search_result_controller.dart';
import '../controller/services_systems_search_controller.dart';

class SearchResultScreen extends StatelessWidget {
  SearchResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchResultController>(
      builder: (controller) => AppStateHandlerWidget(
        state: controller.loadingState,
        child: Scaffold(
          body: Column(
            children: [
              // Taller AppBar with Search Bar
              Material(
                child: PreferredSize(
                  preferredSize: Size.fromHeight(120),
                  // Adjust the height here
                  child: Container(
                    height: 120, // Match the height
                    padding: EdgeInsets.all(16.0),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(Images.headerImg),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: SearchBox(
                                onChanged: (value) {},
                                onTap: () {},
                                onSearch: (query) {
                                  if (query != null &&
                                      query.trim().isNotEmpty) {
                                    controller.ServicesSystemsSearch(query);
                                  }
                                },
                                prefixIconExist: true,
                                suffixColor: Colors.white,
                                backgroundColor: Colors.white.withOpacity(0.2),
                                prefixIconColor: Colors.white,
                                titleStyle: FontTextStyle.paragraphMedium
                                    .copyWith(color: Colors.white),
                                borderColor: AppColors.brand500,
                              ),
                            ),
                            SizedBox(width: 8.getWidth()),
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                width: 48.getWidth(),
                                height: 48.getHeight(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 40.getWidth(),
                                      height: 40.getHeight(),
                                      decoration: ShapeDecoration(
                                        color: Colors.white.withOpacity(0.2),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(999),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 20,
                                            height: 20,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(),
                                            child: SvgPicture.asset(
                                                AllIcons.closeIcon),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: AppSpacing.l.getHeight(),
                          right: AppSpacing.l.getWidth(),
                          left: AppSpacing.l.getWidth(),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Services Section
                            Text(
                              'Recent services',
                              style: FontTextStyle.headingLarge,
                            ),
                            SizedBox(height: AppSpacing.l.getHeight()),

                            controller.filteredServices.isEmpty
                                ? const Center(
                                    child: Text("No services found."),
                                  )
                                : ListView.separated(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount:
                                        controller.filteredServices.length,
                                    // Example count
                                    itemBuilder: (context, index) {
                                      return ServiceCardWidget(
                                        title:controller
                                                  .filteredServices[index].title,
                                        onPress: () {
                                          // Handle service card press
                                        },
                                        onFavPressed:(){
                                        },
                                        isFav: false);

                                      //   Container(
                                      //   padding: EdgeInsets.symmetric(
                                      //     vertical: AppSpacing.s.getHeight(),
                                      //   ),
                                      //   child: Text(
                                      //     controller
                                      //         .filteredServices[index].title,
                                      //     style: FontTextStyle.labelLarge
                                      //         .copyWith(
                                      //             color: AppColors.neutral900),
                                      //   ),
                                      // );
                                    },
                                    separatorBuilder: (context, index) {
                                      // Add a horizontal line between items
                                      return const Divider(
                                        color: AppColors.neutral500,
                                        thickness: 1,
                                      );
                                    },
                                  ),
                            SizedBox(height: 24),
                          ],
                        ),
                      ),

                      Container(
                        width: double.infinity,
                        height: 8,
                        color: AppColors.neutral100,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: AppSpacing.m.getHeight(),
                          bottom: AppSpacing.l.getHeight(),
                          right: AppSpacing.l.getWidth(),
                          left: AppSpacing.l.getWidth(),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Recent systems',
                              style: FontTextStyle.headingLarge,
                            ),
                            SizedBox(height: AppSpacing.l.getHeight()),
                            controller.filteredSystems.isEmpty
                                ? const Center(
                                    child: Text("No systems found."),
                                  )
                                : ListView.separated(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount:
                                        controller.filteredSystems.length,
                                    // Example count
                                    itemBuilder: (context, index) {
                                      return
                                        SystemCardWidget(
                                          title :controller
                                              .filteredSystems[index].title,
                                        );
                                    },
                                    separatorBuilder: (context, index) {
                                      // Add a horizontal line between items
                                      return const Divider(
                                        color: AppColors.neutral500,
                                        thickness: 1,
                                      );
                                    },
                                  )
                          ],
                        ),
                      ),
                      // Systems Section
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
