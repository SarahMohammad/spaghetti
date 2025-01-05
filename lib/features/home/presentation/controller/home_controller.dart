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
  }

// Add a service to the favorites list
  void addToFavorites(ServiceSystem service) {
    if (!isServiceInFavorites(service, favoriteItems)) {
      favoriteItems.add(service);
      service.isFavorite = true;

      // Update the service in the main list
      serviceList
          .firstWhere((s) => s.title == service.title)
          .isFavorite = true;
    }
    update(); // Ensure UI reflects the change
  }

// Remove a service from the favorites list
  void removeFromFavorites(ServiceSystem service) {
    favoriteItems.removeWhere((item) => item.title == service.title);
    service.isFavorite = false;

    // Update the service in the main list
    serviceList
        .firstWhere((s) => s.title == service.title)
        .isFavorite = false;
    update(); // Ensure UI reflects the change
  }

// Toggle favorite status
  void toggleFavoriteStatus(ServiceSystem service, BuildContext context) {
    // Check if the service is in favorites
    if (isServiceInFavorites(service, favoriteItems)) {
      // Remove from favorites
      favoriteItems.removeWhere((item) => item.title == service.title);
      service.isFavorite = false;

      // Update in serviceList
      serviceList
          .firstWhere((item) => item.title == service.title)
          .isFavorite = false;

      ToastManager.showToast(
        state: ToastState.neutral,
        title: 'Service removed from favorites',
        context: context,
      );
    } else {
      // Add to favorites
      favoriteItems.add(service);
      service.isFavorite = true;

      // Update in serviceList
      serviceList
          .firstWhere((item) => item.title == service.title)
          .isFavorite = true;

      ToastManager.showToast(
        state: ToastState.positive,
        title: 'Service added to favorites',
        context: context,
      );
    }

    // Update visibleItems (this will automatically recalculate based on the current isExpanded state)
    update(); // Refresh UI
  }

// Check if a service is in favorites
  bool isServiceInFavorites(ServiceSystem service, List<ServiceSystem> favoriteItems) {
    return favoriteItems.any((favorite) => favorite.title == service.title);
  }


  openCategoryBottomSheet() {
    var selectedIndex = (-1).obs; // Observable variable to track selected index

    showBottomActionModelSheet(
      Get.context!,
      showCloseIcon: true,
      content:  ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: Get.size.height * 0.85 // Constrain the height of the GridView
        ),
        child: GridView.builder(
          padding: EdgeInsets.only(top:AppSpacing.m.getHeight()),
          shrinkWrap: true,
          itemCount: categoryList.length,
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
              title : categoryList[index].title
            ),
            );
          },
        ),
      ),
      title: selectCategory.tr,
      isScrollControlled: true,
    );
  }

  void showServiceDescriptionBottomSheet(ServiceSystem item, Key? key) {
    BottomSheetManager.showServiceSystemDescriptionBottomSheet(serviceSystem:item , key: key );
  }

}

