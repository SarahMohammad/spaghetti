import 'package:flutter/src/foundation/key.dart';
import 'package:untitled3/router/routes_constants.dart';

import '../../../../core/base_controller.dart';

import 'package:get/get.dart';

import '../../../../functions/bottom_sheet_manager.dart';
import '../../../home/data/models/service.dart';

class SystemsController extends BaseController {
  bool isSearching = false;
  String searchQuery = "";
  List<ServiceSystem> searchResult = [];
  var systemsList = <ServiceSystem>[];


  @override
  void onInit() {
    super.onInit();
    loadSystems();
  }

  void toggleSearch() {
    Get.toNamed(RoutesConstants.systemsSearchScreen);
  }
  loadSystems() {
    final systems = fetchSystemItemsFromApi();
    systemsList.addAll(systems);
    searchResult = systemsList;
  }
  void closeSearch() {
    isSearching = false;
    searchQuery = "";
    searchResult = systemsList;
    Get.back();
  }
  void search(String query) {
    searchQuery = query;
    searchResult = systemsList
        .where((system) =>
        system.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    update();
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
        title: "FAP Ariba",
        description: "Lorem ipsum dolor sit amet consectetur. Ridiculus orci gravida adipiscing venenatis accumsan enim.",
      ),
      ServiceSystem(
        isFavorite: false,
        isSystem: true,
        title: "RAP Ariba",
        description: "Lorem ipsum dolor sit amet consectetur. Ridiculus orci gravida adipiscing venenatis accumsan enim.",
      ),
      ServiceSystem(
        isFavorite: false,
        isSystem: true,
        title: "MAP Ariba",
        description: "Lorem ipsum dolor sit amet consectetur. Ridiculus orci gravida adipiscing venenatis accumsan enim.",
      ),
    ];
  }

  void showServiceDescriptionBottomSheet(ServiceSystem item, Key? key) {
    BottomSheetManager.showServiceSystemDescriptionBottomSheet(serviceSystem:item , key: key );
  }
}