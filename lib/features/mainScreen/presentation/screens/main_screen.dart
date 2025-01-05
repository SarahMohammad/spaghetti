import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:untitled3/uiHelpers/app_colors.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../UIHelpers/icons.dart';
import '../../../../uiHelpers/font_text_style.dart';
import '../../../../utils/translation_keys.dart';
import '../controller/nav_bar_controller.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarController>(
      builder: (navBarController) => Scaffold(
        body: navBarController.navBarScreens.elementAt(
          navBarController.currentNavIndex,
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(top: 6.getHeight()),
          //color: Colors.amberAccent,
          decoration: BoxDecoration(
            color: Colors.white, // Background color
            border: Border(
              top: BorderSide(
                color: AppColors.neutral500, // Top border color
                width: 0.5.getWidth(), // Top border width
              ),
            ),
          ),
          child: Stack(
            clipBehavior: Clip.none, // Allows the line to extend outside the bar
            children: [
              // The BottomNavigationBar itself
              Theme(
                 data: Theme.of(context).copyWith(
            splashColor: Colors.transparent, // Removes the ripple effect
            highlightColor: Colors.transparent, // Removes the highlight on press
          ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: navBarController.currentNavIndex,
                  onTap: (val) {
                    navBarController.setCurrentNavIndexState(val);
                  },
                  selectedItemColor: AppColors.primary100,
                  showUnselectedLabels: true,
                  unselectedItemColor: AppColors.neutral700,
                  unselectedLabelStyle: FontTextStyle.labelSmall,
                  selectedLabelStyle: FontTextStyle.labelSmall,
                  elevation: 0,
                  backgroundColor: Colors.white,

                  items: [
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        AllIcons.homeIcon,
                        color: navBarController.currentNavIndex == 0
                            ? AppColors.primary100
                            : AppColors.neutral700,
                      ),
                      label: home.tr,
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        AllIcons.serviceIcon,
                        color: navBarController.currentNavIndex == 1
                            ? AppColors.primary100
                            : AppColors.neutral700,
                      ),
                      label: services.tr,
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        AllIcons.systemIcon,
                        color: navBarController.currentNavIndex == 2
                            ? AppColors.primary100
                            : AppColors.neutral700,
                      ),
                      label: systems.tr,
                    ),
                    BottomNavigationBarItem(
                      icon: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          SvgPicture.asset(
                            AllIcons.requestIcon,
                            color: navBarController.currentNavIndex == 3
                                ? AppColors.primary100
                                : AppColors.neutral700,
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height * -0.01, // Adjust height based on screen size
                            right: MediaQuery.of(context).size.width * -0.04, // Adjust width based on screen size
                            child: Badge(
                              label: Text('2'),
                            ),
                          ),
                        ],
                      ),
                      label: requestCenter.tr,
                    ),




                  ],
                ),
              ),

              // Line above the navigation bar
              Positioned(
                top: -5, // Position above the navigation bar
                left: 0,
                right: 0,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final tabWidth = constraints.maxWidth / navBarController.navBarScreens.length; // Calculate tab width (4 items)
                    return Row(
                      children: List.generate(4, (index) {
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          alignment: Alignment.center,
                          width: tabWidth,
                          child: Container(
                            width: index == navBarController.currentNavIndex ? 24.getWidth() : 0, // Line width
                            height: 5.getHeight(), // Line height


                        decoration: BoxDecoration(
                        color: index == navBarController.currentNavIndex
                        ? AppColors.primary100
                            : Colors.transparent, // Container color
                        borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8), // Bottom-left corner curve
                        bottomRight: Radius.circular(8), // Bottom-right corner curve
                        ),
                          ),
                        ));
                      }),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
