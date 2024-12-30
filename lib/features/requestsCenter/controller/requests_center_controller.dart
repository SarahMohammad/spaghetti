import 'package:flutter/material.dart';
import 'package:untitled3/router/routes_constants.dart';
import 'package:untitled3/uiHelpers/font_text_style.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../UIHelpers/images.dart';
import '../../../commonWidgets/bottomSheet/bottom_sheet_action.dart';
import '../../../core/base_controller.dart';

import 'package:get/get.dart';

import '../../../functions/helper_classes.dart';
import '../../../uiHelpers/app_colors.dart';
import '../../../uiHelpers/app_spacing.dart';

class RequestsCenterController extends BaseController {
  // State variables
  bool isSearching = false; // Tracks if the search bar is active
  String searchQuery = ""; // Holds the current search query
  List<String> searchResult = [];
  RxString selectedChoice = ''.obs;
  var isCommentsExpanded = false;

  void updateExpansionCommentsState(bool expanded) {
    isCommentsExpanded = expanded;
    update();
  }

  var isSummeryExpanded = false;

  void updateExpansionSummeryState(bool expanded) {
    isSummeryExpanded = expanded;
    update();
  }

  var commentsList = <Comment>[Comment()].obs;



  void addComment() {
    commentsList.add(Comment());
  }

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

  openOptionsSheet() {
    showBottomActionModelSheet(
      Get.context!,
      showCloseIcon: false,
      isScrollControlled: true,
      bottomSheetHeight: Get.size.height / 4,
      contentHeight: Get.size.height / 6,
      content: ListView(children: [
             GestureDetector(
              onTap: (){
                Get.toNamed(
                    RoutesConstants.requestCenterDetailsScreen
                );
              },
              child: Container(
                color: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.m.getWidth(),
                      vertical: AppSpacing.l.getHeight()),
                  child: Text(
                'View details',
                style: TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 16,
                  fontFamily: 'DIN Next LT Arabic',
                  fontWeight: FontWeight.w500,
                  height: 0.09,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.getWidth()),
          child: const Divider(
            color: AppColors.neutral500,
            thickness: 1,
          ),
        ),
        GestureDetector(
          onTap: (){
            openApprovalLineSheet();
            },
          child: Container(
            color: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.m.getWidth(),
                  vertical: AppSpacing.l.getHeight()),
              child: Text(
                'View approval line',
                style: TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 16,
                  fontFamily: 'DIN Next LT Arabic',
                  fontWeight: FontWeight.w500,
                  height: 0.09,
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }

  openApprovalLineSheet() {
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
                        child: Image.asset(
                          Images.avatar,
                          fit: BoxFit.cover,
                          width: 48,
                          height: 48,
                        ),
                      ),
                      isApproved
                          ? Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                height: 16,
                                width: 16,
                                decoration: BoxDecoration(
                                  color: AppColors.darkGreen,
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: AppColors.darkGreen, width: 2),
                                ),
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                  // Green Vertical Line
                  index != 4
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          child: Container(
                            width: 3,
                            height: 35,
                            color: isApproved
                                ? AppColors.darkGreen
                                : AppColors.neutral200,
                          ),
                        )
                      : const SizedBox.shrink(),
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
                      style: FontTextStyle.labelLarge
                          .copyWith(color: AppColors.neutral900),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      approval['title'],
                      style: FontTextStyle.paragraphMedium
                          .copyWith(color: AppColors.neutral800),
                    ),
                  ],
                ),
              ),

              // Status and Date
              if (isApproved)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Approved on:",
                      style: FontTextStyle.paragraphMedium
                          .copyWith(color: AppColors.darkGreen),
                    ),
                    Text(
                      approval['date'],
                      style: FontTextStyle.paragraphMedium
                          .copyWith(color: AppColors.neutral800),
                    ),
                  ],
                )
              else if (isPending)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: ShapeDecoration(
                    color: AppColors.warning100,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSpacing.xs.getWidth(),
                        vertical: AppSpacing.xs.getHeight()),
                    child: Text(
                      'Pending',
                      style: FontTextStyle.labelMedium
                          .copyWith(color: AppColors.warning500),
                    ),
                  ),
                ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox.shrink();
        },
      ),
      title: "Approval line",
    );
  }
}
