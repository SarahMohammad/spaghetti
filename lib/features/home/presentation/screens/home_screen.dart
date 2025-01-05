import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:untitled3/router/routes_constants.dart';
import 'package:untitled3/uiHelpers/app_colors.dart';
import 'package:untitled3/uiHelpers/app_spacing.dart';
import 'package:untitled3/utils/constant.dart';
import '../../../../UIHelpers/icons.dart';
import '../../../../commonWidgets/buttons/custom_button.dart';
import '../../../../commonWidgets/search_box.dart';
import '../../../../commonWidgets/square_home_card.dart';
import '../../../../core/app_states/app_state_handler_widget.dart';
import '../../../../uiHelpers/font_text_style.dart';
import '../../../../utils/button_enum.dart';
import '../../../../utils/translation_keys.dart';
import '../../../../commonWidgets/system_card_widget.dart';
import '../../../mainScreen/presentation/controller/nav_bar_controller.dart';
import '../../../services/widgets/service_card_widget.dart';
import '../../../services/widgets/service_category_widget.dart';
import '../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) => AppStateHandlerWidget(
        state: homeController.loadingState,
        child: Scaffold(
          body: Stack(
            children: [
              // Background content and header
              Column(
                children: [
                  // Header: Fixed at the top
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 20.0),
                    decoration: const BoxDecoration(
                        color: Colors.brown, // Adjust the color as needed
                        image: DecorationImage(
                          image: AssetImage("assets/images/header_image.png"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50.getHeight(),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Welcome Text
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hi, Abdelrhman!",
                                  style: FontTextStyle.headingX
                                      .copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                            // Avatar and Notifications
                            Row(
                              children: [
                                SvgPicture.asset(AllIcons.notificationIcon),
                                SizedBox(width: AppSpacing.m.getWidth()),
                                CircleAvatar(
                                  radius: 20.0,
                                  backgroundImage:
                                      AssetImage("assets/images/avatar.png"),
                                ),
                              ],
                            ),
                          ],
                        ),
                         SizedBox(height: AppSpacing.m.getHeight()),
                        // Search Box
                        SearchBox(
                          onChanged: (value) {},
                          onTap: (){
                            Get.toNamed(RoutesConstants.recentSearchScreen);
                          },
                          prefixIconExist: true,
                          suffixColor: Colors.white,
                          backgroundColor: Colors.white.withOpacity(0.2),
                          title: "Search services or systems",
                          prefixIconColor: Colors.white,
                          titleStyle: FontTextStyle.paragraphMedium
                              .copyWith(color: Colors.white),
                          borderColor: Colors.transparent,
                        ),
                        SizedBox(
                          height: 45.getHeight(),
                        )
                      ],
                    ),
                  ),
                ],
              ),

              // Cards Positioned Above the Header (Overlap from Bottom)
              Positioned(
                left: 16.getWidth(),
                right: 16.getWidth(),
                top: 210.getHeight(),
                // Adjust this value to control the overlap
                child: _buildCardsRow(),
              ),

              // Scrollable Content: Favorites and Services (Now below the cards and header)
              Positioned(
                top: 400.getHeight(),
                // Adjust this value so the scrollable content starts after the header and cards
                left: 0,
                right: 0,
                bottom: 0,
                child: SingleChildScrollView(
                  child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Favorites Section
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: AppSpacing.l.getWidth()),
                          child: _buildFavoritesSection(homeController),
                        ),
                         SizedBox(height: AppSpacing.l.getHeight()),

                        Container(
                          width: double.infinity,
                          height: 7.getHeight(),
                          color: AppColors.neutral100,
                        ),
                        SizedBox(height: AppSpacing.m.getHeight()),
                        // Services Section
                       Padding(
                         padding: EdgeInsets.symmetric(horizontal: AppSpacing.l.getWidth()),
                         child: _buildServicesSection(homeController),
                       ),
                        Container(
                          width: double.infinity,
                          height: 7.getHeight(),
                          color: AppColors.neutral100,
                        ),
                        SizedBox(height: AppSpacing.l.getHeight()),

                        // Systems Section
                       Padding(
                         padding: EdgeInsets.symmetric(horizontal: AppSpacing.l.getWidth()),
                         child: _buildSystemsSection(homeController),
                       )
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

  Widget _buildCardsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SquareHomeCard(
            title: "My Requests",
            subTitle: "Check your updates",
            bgColor: AppColors.brand400,
            count: "5",
          bgCountColor: AppColors.brand300,
          cardIcon: AllIcons.requestIcon,
        ),
        SquareHomeCard(
          bgColor: AppColors.brand900,
          title: "Approvals",
          subTitle: "Pending on me",
          count: "12",
          bgCountColor: AppColors.darkBrown,
          cardIcon: AllIcons.timeIcon,

        )
      ],
    );
  }

  Widget _buildFavoritesSection(HomeController homeController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          favorites.tr,
          style: FontTextStyle.headingX,
        ),
         SizedBox(height: AppSpacing.xs.getHeight()),
        Obx(
          () {
            if (homeController.favoriteItems.isEmpty) {
              return  Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AllIcons.heartIcon),
                     SizedBox(height: AppSpacing.l.getHeight()),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'No favorites yet',
                          textAlign: TextAlign.center,
                          style: FontTextStyle.headingLarge,
                        ),
                         SizedBox(height: AppSpacing.s.getHeight()),
                        Text(
                          'You can add services and systems to your favorite when you press on the heart icon',
                          textAlign: TextAlign.center,
                          style: FontTextStyle.paragraphLarge.copyWith(color: AppColors.neutral800),
                        ),
                      ],
                    ),
                  ],
                );
            }
            return ListView.builder(
            shrinkWrap: true, // Ensures the ListView adapts to the parent's constraints
            physics: NeverScrollableScrollPhysics(), // Prevents independent scrolling
            itemCount: homeController.visibleItems.length,
            itemBuilder: (context, index) {
              final item = homeController.visibleItems[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: AppSpacing.s.getHeight()),
                child: Container(
                  decoration: ShapeDecoration(
                    color: index % 2 == 0
                        ? AppColors.darkWhite
                        : AppColors.brand100, // Alternating colors
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: AppColors.neutral500),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      item.title,
                      style: FontTextStyle.labelLarge.copyWith(
                        color: AppColors.neutral900,
                      ),
                    ),
                    trailing: InkWell(
                        child: SvgPicture.asset(AllIcons.filledHeartIcon),
                      onTap: (){
                        // homeController.removeFromFavorites(index);
                        homeController.toggleFavoriteStatus(
                            item, context);
                      },
                    ),
                  ),
                ),
              );
            },
          );}

        ),
        SizedBox(
          height: AppSpacing.l.getHeight(),
        ),
        Obx(() {
          if (homeController.favoriteItems.isEmpty){
            return SizedBox.shrink();
          }

          return SizedBox(
              height: 52.getHeight(),
              width: double.infinity,
              child: CustomButton(key,
                  buttonTitle: homeController.isExpanded.value
                      ? showLess.tr
                      : showMore.tr,
                  padding: EdgeInsets.zero,
                  isDisabled: false,
                  buttonType: ButtonType.tertiary, onPressed: () {
                homeController.toggleExpansion();
              }),
            );}
        ),
      ],
    );
  }

  Widget _buildServicesSection(HomeController homeController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets. only(bottom: AppSpacing.m.getHeight()),
          child: Text(
            services.tr,
            style: FontTextStyle.headingX,
          ),
        ),
        SizedBox(height: AppSpacing.xs.getHeight()),
        ServiceCategoryWidget(
          title: "Administrative Services",
          onTap: () {
            homeController.openCategoryBottomSheet();
          },
        ),

        SizedBox(height: AppSpacing.l.getHeight()),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true, // Ensures the ListView does not take infinite height
          physics: const NeverScrollableScrollPhysics(), // Prevents ListView from scrolling independently
          itemCount: homeController.serviceList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: AppSpacing.m.getHeight()),
              child: ServiceCardWidget(
                title: homeController.serviceList[index].title,
                onPress: () {
                  // Handle service card press
                },
                onFavPressed:(){
                  homeController.toggleFavoriteStatus(
                      homeController.serviceList[index], context);
                  },
                isFav: homeController.serviceList[index].isFavorite ?? false,
                onShowDescriptionPress:(){
                  homeController.showServiceDescriptionBottomSheet(
                      homeController.serviceList[index], key);
                }
              ),
            );
          },
        ),
        SizedBox(height: AppSpacing.m.getHeight()),
        SizedBox(
          height: 52.getHeight(),
          width: double.infinity,
          child: CustomButton(key,
              buttonTitle: viewAll.tr,
              padding: EdgeInsets.zero,
              isDisabled: false,
              buttonType: ButtonType.tertiary, onPressed: () {
                final NavBarController navBarController =
                Get.find<NavBarController>();
                navBarController.setCurrentNavIndexState(1);
              }),
        ),
        SizedBox(height: AppSpacing.l.getHeight()),

      ],
    );
  }

  Widget _buildSystemsSection(HomeController homeController){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          systems.tr,
          style: FontTextStyle.headingX,
        ),
         SizedBox(height: AppSpacing.l.getHeight()),
        // Column(
        //   children:
        //   homeController.services.entries.map((entry) {
        //     return  Padding(
        //       padding:  EdgeInsets.only(bottom: AppSpacing.m.getHeight()),
        //       child: SystemCardWidget(),
        //     );
        //   }).toList(),
        // ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: homeController.systemsList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: AppSpacing.m.getHeight()),
              child: SystemCardWidget(title: homeController.systemsList[index].title,
                  onReadMorePress:(){
                    homeController.showServiceDescriptionBottomSheet(
                        homeController.systemsList[index], key);
                  }
              ),
            );
          },
        ),
        SizedBox(height: AppSpacing.m.getHeight()),
        SizedBox(
          height: 52.getHeight(),
          width: double.infinity,
          child: CustomButton(key,
              buttonTitle: viewAll.tr,
              padding: EdgeInsets.zero,
              isDisabled: false,
              buttonType: ButtonType.tertiary, onPressed: () {
                final NavBarController navBarController =
                Get.find<NavBarController>();
                navBarController.setCurrentNavIndexState(2);
          }),
        ),
        SizedBox(height: AppSpacing.l.getHeight()),

      ],
    );
  }


}
