
import 'package:get/get.dart';

import '../../../../core/base_controller.dart';

class HomeController extends BaseController {
  var isExpanded = false.obs; // Observes whether the list is expanded or not
  int initialLength = 4; // Number of items to display initially

  List<String> favoriteItems = [
    "Customs Clearance Permit Request",
    "Legal Gate",
    "Training Request",
    "Sap Hana",
    "Item 5",
    "Item 6",
    "Item 7",
    "Item 8",
  ];

  final List<String> items = List.generate(12, (index) => "Item ${index + 1}");

  List<String> get visibleItems => isExpanded.value
      ? favoriteItems
      : favoriteItems.take(initialLength).toList();

  void toggleExpansion() {
    isExpanded.value = !isExpanded.value;
  }
}