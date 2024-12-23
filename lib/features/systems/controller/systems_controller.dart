import '../../../core/base_controller.dart';

import 'package:get/get.dart';

class SystemsController extends BaseController {
  // State variables
  bool isSearching = false; // Tracks if the search bar is active
  String searchQuery = ""; // Holds the current search query
  List<String> searchResult = [];


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
