import 'package:flutter/material.dart';

import '../../../commonWidgets/bottomSheet/bottom_sheet_action.dart';
import '../../../core/base_controller.dart';

import 'package:get/get.dart';

import '../../../uiHelpers/app_colors.dart';

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
    update();
  }

  openSettingsSheet() {
    final List<Map<String, dynamic>> approvals = [
      {
        "name": "Ahmed Elhawari",
        "title": "Senior HR director",
        "status": "approved",
        "date": "Sep 5, 2024",
        "image": "https://via.placeholder.com/150", // Replace with asset path
      },
      {
        "name": "Khalid Al Shihri",
        "title": "HR manager",
        "status": "approved",
        "date": "Sep 5, 2024",
      },
      {
        "name": "Ali Al Ghafli",
        "title": "HR manager",
        "status": "pending",
        "date": "Sep 5, 2024",
      },
      {
        "name": "Majed Seif",
        "title": "Cybersecurity manager",
        "status": "waiting",
        "date": "Sep 5, 2024",
      },
      {
        "name": "Abdul Rahman Rahman",
        "title": "Cybersecurity manager",
        "status": "waiting",
        "date": "Sep 5, 2024",
      },
    ];
    showBottomActionModelSheet(
      Get.context!,
      showCloseIcon: true,
      isScrollControlled: true,
      bottomSheetHeight: Get.size.height / 1.3,
      contentHeight: Get.size.height / 1.6,
      content: ListView.separated(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {


          final approval = approvals[index];
          final isApproved = approval['status'] == "approved";
          final isPending = approval['status'] == "pending";
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Image with Status Icon
              Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 24,
                       // backgroundImage: NetworkImage(imageUrl), // Replace with your asset path
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 16,
                          width: 16,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Green Vertical Line
                  Container(
                    width: 2,
                    height: 40,
                    color: Colors.green,
                  ),
                ],
              ),
              const SizedBox(width: 16),

              // Name, Title, and Status
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      approval['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      approval['title'],
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              // Status and Date
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (isApproved)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "Approved on:",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          approval['date'],
                          style: const TextStyle(
                            color: Colors.green,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  else if (isPending)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        "Pending",
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),


                ],
              ),
            ],
          );
        }, separatorBuilder: (BuildContext context, int index) { return SizedBox(); },

      ),
      title: "Cat1",

    );
  }

}
