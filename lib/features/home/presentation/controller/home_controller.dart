import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/commonWidgets/buttons/custom_button.dart';
import 'package:untitled3/features/home/data/models/service.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../commonWidgets/bottomSheet/bottom_sheet_action.dart';
import '../../../../core/base_controller.dart';
import '../../../../utils/button_enum.dart';

class HomeController extends BaseController {
  var isExpanded = false.obs; // Observes whether the list is expanded or not
  int initialLength = 4; // Number of items to display initially

  var favoriteItems = <Service>[].obs;
  var serviceList = <Service>[].obs;
  var systemsList = <Service>[].obs;

  List<Service> get visibleItems {
    if (favoriteItems.isEmpty) return []; // Prevent empty list
    return isExpanded.value
        ? favoriteItems
        : favoriteItems.take(initialLength).toList();
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
      Service(
        isFavorite: true,
        title: "service 1",
        description: "Lorem ipsum dolor sit amet consectetur. Ridiculus orci .",
      ),
      Service(
        isFavorite: true,
        title: "service 2",
        description: "Lorem ipsum dolor sit amet consectetur. ",
      ),
      Service(
        isFavorite: true,
        title: "service 3",
        description: "Lorem ipsum dolor sit amet consectetur. Ridiculus orci gravida",
      ),
      Service(
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
      Service(
        isFavorite: false,
        title: "SAP Ariba",
        description: "Lorem ipsum dolor sit amet consectetur. Ridiculus orci gravida adipiscing venenatis accumsan enim.",
      ),
      Service(
        isFavorite: false,
        title: "SAP Ariba",
        description: "Lorem ipsum dolor sit amet consectetur. Ridiculus orci gravida adipiscing venenatis accumsan enim.",
      ),
      Service(
        isFavorite: false,
        title: "SAP Ariba",
        description: "Lorem ipsum dolor sit amet consectetur. Ridiculus orci gravida adipiscing venenatis accumsan enim.",
      ),
      Service(
        isFavorite: false,
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
      Service(
        isFavorite: false,
        title: "Customs Clearance Permit Request",
        description: "Process your customs clearance permits.",
      ),
      Service(
        isFavorite: false,
        title: "Organizational Structure Change",
        description: "Request changes to your organizational structure.",
      ),
      Service(
        isFavorite: false,
        title: "Ask Human Capital",
        description: "Get assistance with HR-related matters.",
      ),
      Service(
        isFavorite: false,
        title: "Performance Change",
        description: "Request a performance change review.",
      ),
    ];
  }

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
    loadServices();
    loadSystems();
  }

  // Add a service to the favorites list
  void addToFavorites(Service service) {
    if (!isServiceInFavorites(service, favoriteItems)) {
      favoriteItems.add(service);
      service.isFavorite = true;
      serviceList
          .firstWhere((s) => s.title == service.title)
          .isFavorite = true;
    }
  }

  // Remove a service from the favorites list
  void removeFromFavorites(int index) {
    var service = favoriteItems[index];
    favoriteItems.removeAt(index);
    service.isFavorite = false;
    serviceList
        .firstWhere((s) => s.title == service.title)
        .isFavorite = false;
    update();
  }

  // Toggle favorite status
  void toggleFavoriteStatus(Service service, int index) {
    if (isServiceInFavorites(service, favoriteItems)) {
      removeFromFavorites(index);
    } else {
      addToFavorites(service);
    }
    update();
  }

  bool isServiceInFavorites(Service service, List<Service> favoriteItems) {
    return favoriteItems.any((favorite) => favorite.title == service.title);
  }

  void showServiceDescriptionBottomSheet(Service service , Key? key) {
    showBottomActionModelSheet(
      Get.context!,
      showCloseIcon: true,
      content:  Container(
        color: Colors.orange,
        child: Column(children: [
          Text("data"),
          SizedBox(
              height:52.getHeight(),
              child: CustomButton(
                key,
                radius: 40,
                buttonTitle: "resetPassword.tr",
                padding: EdgeInsets.zero,
                onPressed: () {
               },
                buttonType: ButtonType.primary,
                isDisabled: false,

              ),
          )
        ],),
      ),
      title: service.title,
      isScrollControlled: true,
      bottomSheetHeight: Get.size.height / 3,
      contentHeight: Get.size.height / 6,

    );
  }
}

