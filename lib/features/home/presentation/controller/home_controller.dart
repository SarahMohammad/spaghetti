import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/features/home/data/models/service.dart';
import 'package:untitled3/uiHelpers/app_spacing.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../commonWidgets/bottomSheet/bottom_sheet_action.dart';
import '../../../../core/base_controller.dart';
import '../../../../functions/bottom_sheet_manager.dart';

import '../../../../functions/toast_manager.dart';
import '../../../../utils/translation_keys.dart';
import '../../../services/widgets/category_grid_tile.dart';
import '../../data/models/category.dart';

class HomeController extends BaseController {
  var isExpanded = false.obs; // Observes whether the list is expanded or not
  int initialLength = 4; // Number of items to display initially

  var favoriteItems = <ServiceSystem>[];
  var serviceList = <ServiceSystem>[];
  var systemsList = <ServiceSystem>[];
  var categoryList = <Category>[];
  var requestsNumber = 0;
  var approvalsNumber = 0;
  var selectedCategoryTitle = "".obs;



  List<ServiceSystem> get visibleItems {
    if (favoriteItems.isEmpty) return []; // Prevent empty list
    return isExpanded.value
        ? favoriteItems // Show all items when expanded
        : favoriteItems.take(initialLength).toList(); // Show only a subset when collapsed
  }

  void toggleExpansion() {
    isExpanded.value = !isExpanded.value;
  }

  loadFavorites() {
    final favorites = fetchFavoriteItemsFromApi();
    favoriteItems.addAll(favorites);
  }

  fetchFavoriteItemsFromApi() {
    return [
      ServiceSystem(
        isFavorite: true,
        title: "service 1",
        description: "Lorem ipsum dolor sit amet consectetur. Ridiculus orci .",
      ),
      ServiceSystem(
        isFavorite: true,
        title: "service 2",
        description: "Lorem ipsum dolor sit amet consectetur. ",
      ),
      ServiceSystem(
        isFavorite: true,
        title: "service 3",
        description: "Lorem ipsum dolor sit amet consectetur. Ridiculus orci gravida",
      ),
      ServiceSystem(
        isFavorite: true,
        title: "service 4",
        description: "Lorem ipsum dolor sit amet consectetur. Ridiculus orci gravida",
      ),
    ];
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
        title: "TAP Ariba",
        description: "Lorem ipsum dolor sit amet consectetur. Ridiculus orci gravida adipiscing venenatis accumsan enim.",
      ),
    ];
  }

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
      ServiceSystem(
        isFavorite: true,
        title: "service 1",
        description: "Lorem ipsum dolor sit amet consectetur. Ridiculus orci .",
      ),
      ServiceSystem(
        isFavorite: true,
        title: "service 2",
        description: "Lorem ipsum dolor sit amet consectetur. ",
      ),
      ServiceSystem(
        isFavorite: true,
        title: "service 3",
        description: "Lorem ipsum dolor sit amet consectetur. Ridiculus orci gravida",
      ),
      ServiceSystem(
        isFavorite: true,
        title: "service 4",
        description: "Lorem ipsum dolor sit amet consectetur. Ridiculus orci gravida",
      ),
    ];
  }

  loadCategories() {
    final categoryItems = fetchCategoriesFromAPi();
    categoryList.addAll(categoryItems);
  }

   loadCardsData() {
      requestsNumber = 5;
      approvalsNumber = 12;
   }


  fetchCategoriesFromAPi(){
     return [
       Category(title :"Human capital"),
       Category(title :"Administrative Services"),
       Category(title :"Technology"),
       Category(title :"Supply Chain & Procurement "),
       Category(title :"Advisory and Disputes"),
       Category(title :"Supply Chain & Procurement "),
       Category(title :"Government Affairs & Protocol "),
       Category(title :"GRC"),
       Category(title :"Planning and Development"),
       Category(title :"County Support Services"),
     ];
   }
  @override
  void onInit() {
    super.onInit();
    loadFavorites();
    loadServices();
    loadSystems();
    loadCategories();
    loadCardsData();
  }

// // Add a service to the favorites list
//   void addToFavorites(ServiceSystem service) {
//     if (!isServiceInFavorites(service, favoriteItems)) {
//       favoriteItems.add(service);
//       service.isFavorite = true;
//
//       // Update the service in the main list
//       serviceList
//           .firstWhere((s) => s.title == service.title)
//           .isFavorite = true;
//     }
//     update(); // Ensure UI reflects the change
//   }
//
// // Remove a service from the favorites list
//   void removeFromFavorites(ServiceSystem service) {
//     favoriteItems.removeWhere((item) => item.title == service.title);
//     service.isFavorite = false;
//
//     // Update the service in the main list
//     serviceList
//         .firstWhere((s) => s.title == service.title)
//         .isFavorite = false;
//     update(); // Ensure UI reflects the change
//   }

// Toggle favorite status

  void toggleFavoriteStatus(ServiceSystem service, BuildContext context,
      {required bool isSystem}) {
    // Check if the service is in favorites
    if (isServiceInFavorites(service, favoriteItems)) {
      // Remove from favorites
      favoriteItems.removeWhere((item) => item.title == service.title);
      service.isFavorite = false;

      if(isSystem){
        // Update in systemList
        systemsList
            .firstWhere((item) => item.title == service.title)
            .isFavorite = false;
      }else {
        // Update in serviceList
        serviceList
            .firstWhere((item) => item.title == service.title)
            .isFavorite = false;
      }
      ToastManager.showToast(
        state: ToastState.neutral,
        title: 'Service removed from favorites',
        context: context,
      );
    } else {
      // Add to favorites
      favoriteItems.add(service);
      service.isFavorite = true;
      if(isSystem){
        // Update in systemList
        systemsList
            .firstWhere((item) => item.title == service.title)
            .isFavorite = true;
      }else {
        // Update in serviceList
        serviceList
            .firstWhere((item) => item.title == service.title)
            .isFavorite = true;
      }
      ToastManager.showToast(
        state: ToastState.positive,
        title: 'Service added to favorites',
        context: context,
      );
    }

    // Update visibleItems (this will automatically recalculate based on the current isExpanded state)
    update();
  }

// Check if a service is in favorites
  bool isServiceInFavorites(ServiceSystem service, List<ServiceSystem> favoriteItems) {
    return favoriteItems.any((favorite) => favorite.title == service.title);
  }



  void openCategoryBottomSheet() {
    BottomSheetManager.openCategoryBottomSheet(
      categories: categoryList,
      onCategorySelected: (selectedCategory) {
        selectedCategoryTitle.value = selectedCategory.title;
      },
    );
  }

  void showServiceDescriptionBottomSheet(ServiceSystem item, Key? key) {
    BottomSheetManager.showServiceSystemDescriptionBottomSheet(serviceSystem:item , key: key );
  }


}

