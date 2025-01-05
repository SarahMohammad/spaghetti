import 'package:flutter/src/foundation/key.dart';

import '../../../../core/base_controller.dart';

import 'package:get/get.dart';

import '../../../../functions/bottom_sheet_manager.dart';
import '../../../home/data/models/service.dart';

class SystemsController extends BaseController {
  // State variables
  bool isSearching = false; // Tracks if the search bar is active
  String searchQuery = ""; // Holds the current search query
  List<String> searchResult = [];
  var systemsList = <ServiceSystem>[];


  @override
  void onInit() {
    super.onInit();
    loadSystems();
  }

  void toggleSearch() {
    isSearching = !isSearching;
    if (!isSearching) {
      searchQuery = ""; // Clear search query when exiting search mode
    }
    update(); // Notify listeners of state change
  }
  loadSystems() {
    final systems = fetchSystemItemsFromApi();
    systemsList.addAll(systems);
  }

  fetchSystemItemsFromApi() {
    return [
      ServiceSystem(
        isFavorite: false,
        isSystem: true,
        title: "SAP Ariba",
        description: "Lorem ipsum dolor sit amet consectetur. Ridiculus orci gravida adipiscing venenatis accumsan enim.",
      ),
      ServiceSystem(
        isFavorite: false,
        isSystem: true,
        title: "SAP Ariba",
        description: "Lorem ipsum dolor sit amet consectetur. Ridiculus orci gravida adipiscing venenatis accumsan enim.",
      ),
      ServiceSystem(
        isFavorite: false,
        isSystem: true,
        title: "SAP Ariba",
        description: "Lorem ipsum dolor sit amet consectetur. Ridiculus orci gravida adipiscing venenatis accumsan enim.",
      ),
      ServiceSystem(
        isFavorite: false,
        isSystem: true,
        title: "SAP Ariba",
        description: "Lorem ipsum dolor sit amet consectetur. Ridiculus orci gravida adipiscing venenatis accumsan enim.",
      ),
    ];
  }

  void showServiceDescriptionBottomSheet(ServiceSystem item, Key? key) {
    BottomSheetManager.showServiceSystemDescriptionBottomSheet(serviceSystem:item , key: key );
  }
}
