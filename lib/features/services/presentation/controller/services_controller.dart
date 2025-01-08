import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:untitled3/features/services/presentation/controller/services_route_mapping.dart';
import 'package:untitled3/functions/bottom_sheet_manager.dart';
import 'package:untitled3/router/routes_constants.dart';
import '../../../../core/base_controller.dart';
import '../../../home/data/models/category.dart';
import '../../../home/data/models/service.dart';

class ServicesController extends BaseController {
  // State variables
  bool isSearching = false; // Tracks if the search bar is active
  String searchQuery = ""; // Holds the current search query
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
        title: "Project request form",
        description: "Lorem ipsum dolor sit amet consectetur. Ridiculus orci gravida adipiscing venenatis accumsan enim. Lorem ipsum dolor sit amet consectetur. Ridiculus orci gravida adipiscing venenatis accumsan enim.",
      ),
      ServiceSystem(
        isFavorite: false,
        title: "New template request form",
        description: "Lorem ipsum dolor sit amet consectetur. Ridiculus orci gravida adipiscing venenatis accumsan enim. Lorem ipsum dolor sit amet consectetur. Ridiculus orci gravida adipiscing venenatis accumsan enim.",
      ),
      ServiceSystem(
        isFavorite: false,
        title: "Non-RCU template review request",
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
    Get.toNamed(RoutesConstants.servicesSearchScreen);
    // isSearching = !isSearching;
    // if (!isSearching) {
    //   searchQuery = "";
    // }
    // update();
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
  List<ServiceSystem> searchResult = [];
  void search(String query) {
    searchQuery = query;
    searchResult = serviceList
        .where((service) =>
        service.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    update();
  }

}
