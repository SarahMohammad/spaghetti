import 'package:flutter/material.dart';


import 'package:get/get.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../commonWidgets/bottomSheet/bottom_sheet_action.dart';
import '../../../../core/base_controller.dart';
import '../../../../router/routes_constants.dart';
import '../../../../uiHelpers/app_spacing.dart';
import '../../../../utils/service_enum.dart';
import '../../widgets/category_grid_tile.dart';


class ServicesController extends BaseController {
  // State variables
  bool isSearching = false; // Tracks if the search bar is active
  String searchQuery = ""; // Holds the current search query
  List<String> searchResult = [];
  final List<String> services = [
    'Project request form',
    'New template request form',
    'Non RCU template review Request',
  ];

  void handleServicePress(int index) {
    Get.toNamed(
        RoutesConstants.requestFormScreen ,
        arguments: ServiceType.values[index]);
  }

  @override
  void onInit() {
    super.onInit();

  }

  void toggleSearch() {
    isSearching = !isSearching;
    if (!isSearching) {
      searchQuery = ""; // Clear search query when exiting search mode
    }
    update(); // Notify listeners of state change
  }

  openCategoryBottomSheet() {
    var selectedIndex = (-1).obs; // Observable variable to track selected index

    showBottomActionModelSheet(
      Get.context!,
      showCloseIcon: true,
      content:  GridView.builder(
        itemCount: 10,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: AppSpacing.m.getHeight(),
          crossAxisSpacing: AppSpacing.m.getWidth(),
        ),
        itemBuilder: (context, index) {
           return Obx(() =>CategoryGridTile(
            isSelected: index == selectedIndex.value,
            onPressed: () {
              selectedIndex.value = index;
            },
          ));
        },
      ),
      title: "Select category",
      isScrollControlled: true,
      contentHeight: Get.size.height / 1.3,
    );
  }






  //refactored part
  final Map<String, TextEditingController> textControllers = {};

  // Initialize controllers dynamically based on fields
  void initializeControllers(List<String> fieldNames) {
    for (var name in fieldNames) {
      textControllers[name] = TextEditingController();
    }
  }

  // Dispose of controllers
  @override
  void onClose() {
    textControllers.values.forEach((controller) => controller.dispose());
    super.onClose();
  }

  // Retrieve text values
  Map<String, String> getFormData() {
    return textControllers.map((key, controller) => MapEntry(key, controller.text));
  }
}
