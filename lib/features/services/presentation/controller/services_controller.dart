import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:untitled3/features/services/presentation/controller/services_route_mapping.dart';
import 'package:untitled3/functions/bottom_sheet_manager.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../commonWidgets/bottomSheet/bottom_sheet_action.dart';
import '../../../../core/base_controller.dart';
import '../../../../uiHelpers/app_spacing.dart';
import '../../../../utils/translation_keys.dart';
import '../../../home/data/models/service.dart';
import '../../widgets/category_grid_tile.dart';

class ServicesController extends BaseController {
  // State variables
  bool isSearching = false; // Tracks if the search bar is active
  String searchQuery = ""; // Holds the current search query
  List<String> searchResult = [];

  var serviceList = <ServiceSystem>[];

  loadServices() {
    final serviceItems = fetchServiceItemsFromApi();
    serviceList.addAll(serviceItems);
  }

  fetchServiceItemsFromApi() {
    return [
      ServiceSystem(
        isFavorite: false,
        title: "Customs Clearance Permit Request",
        description: "Lorem ipsum dolor sit amet consectetur. Ridiculus orci gravida adipiscing venenatis accumsan enim. Lorem ipsum dolor sit amet consectetur. Ridiculus orci gravida adipiscing venenatis accumsan enim.",
      ),
      ServiceSystem(
        isFavorite: false,
        title: "Organizational Structure Change",
        description: "Lorem ipsum dolor sit amet consectetur. Ridiculus orci gravida adipiscing venenatis accumsan enim. Lorem ipsum dolor sit amet consectetur. Ridiculus orci gravida adipiscing venenatis accumsan enim.",
      ),
      ServiceSystem(
        isFavorite: false,
        title: "Ask Human Capital",
        description: "Lorem ipsum dolor sit amet consectetur. Ridiculus orci gravida adipiscing venenatis accumsan enim. Lorem ipsum dolor sit amet consectetur. Ridiculus orci gravida adipiscing venenatis accumsan enim.",
      ),
      ServiceSystem(
        isFavorite: false,
        title: "Performance Change",
        description: "Lorem ipsum dolor sit amet consectetur. Ridiculus orci gravida adipiscing venenatis accumsan enim. Lorem ipsum dolor sit amet consectetur. Ridiculus orci gravida adipiscing venenatis accumsan enim.",
      ),
    ];
  }
  void handleServicePress(int index) {
    ServicesRouteMapping.setServiceTypeToNavigate(ServicesRouteMapping.serviceRouteMappings[index].type);
    Get.toNamed(
      ServicesRouteMapping.serviceRouteMappings[index].route,
    );
  }

  @override
  void onInit() {
    super.onInit();
    loadServices();
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
      content: ConstrainedBox(
        constraints: BoxConstraints(
            maxHeight:
                Get.size.height * 0.85
            ),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: 10,
          padding: EdgeInsets.symmetric(vertical: AppSpacing.l.getHeight(),
          ),
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: AppSpacing.m.getHeight(),
            crossAxisSpacing: AppSpacing.m.getWidth(),
          ),
          itemBuilder: (context, index) {
            return Obx(() => CategoryGridTile(
                  title: "human capital",
                  isSelected: index == selectedIndex.value,
                  onPressed: () {
                    selectedIndex.value = index;
                  },
                ));
          },
        ),
      ),
      title: selectCategory.tr,
      isScrollControlled: true,
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
    return textControllers
        .map((key, controller) => MapEntry(key, controller.text));
  }

  void showServiceDescriptionBottomSheet(item, Key? key) {
    BottomSheetManager.showServiceSystemDescriptionBottomSheet(serviceSystem:item , key: key );
  }
}
