import '../../../core/base_controller.dart';

import 'package:get/get.dart';

class RequestsCenterController extends BaseController {
  // State variables
  bool isSearching = false; // Tracks if the search bar is active
  String searchQuery = ""; // Holds the current search query
  List<String> searchResult = [];
  RxString selectedChoice = ''.obs;

  void selectChoice(String choice) {
    selectedChoice.value = choice;
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

}
