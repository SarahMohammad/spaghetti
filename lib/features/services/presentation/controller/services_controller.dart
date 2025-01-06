import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:untitled3/features/services/presentation/controller/services_route_mapping.dart';
import 'package:untitled3/functions/bottom_sheet_manager.dart';
import '../../../../core/base_controller.dart';
import '../../../home/data/models/category.dart';
import '../../../home/data/models/service.dart';

class ServicesController extends BaseController {
  // State variables
  bool isSearching = false; // Tracks if the search bar is active
  String searchQuery = ""; // Holds the current search query
  List<String> searchResult = [];
  List<Category> categories = [];

  var serviceList = <ServiceSystem>[];

  // RxString selectedCategoryTitle = 'human capital'.obs;

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
    loadCategories();
  }

  void toggleSearch() {
    isSearching = !isSearching;
    if (!isSearching) {
      searchQuery = ""; // Clear search query when exiting search mode
    }
    update();
  }

  loadCategories(){
    final categoryList = fetchCategories();
    categories.addAll(categoryList);
  }

  List<Category> fetchCategories() {
    return [
      Category(title: 'Human capital'),
      Category(title: 'Administrative Services'),
      Category(title: 'Technology'),
      Category(title: 'Supply Chain & Procurement '),
      Category(title: 'Advisory and Disputes'),
      Category(title: 'Supply Chain & Procurement '),
      Category(title: 'Government Affairs & Protocol '),
      Category(title: 'Government Affairs & Protocol '),
      Category(title: 'GRC'),
      Category(title: 'Planning and Development'),
      Category(title: 'County Support Services'),
    ];
  }



  void showServiceDescriptionBottomSheet(item, Key? key) {
    BottomSheetManager.showServiceSystemDescriptionBottomSheet(serviceSystem:item , key: key );
  }

  var selectedCategoryTitle = "".obs; // Observable for the selected category title

  void openCategoryBottomSheet() {
    BottomSheetManager.openCategoryBottomSheet(
      categories: categories,
      onCategorySelected: (selectedCategory) {
        selectedCategoryTitle.value = selectedCategory.title;
      },
    );
  }


}
