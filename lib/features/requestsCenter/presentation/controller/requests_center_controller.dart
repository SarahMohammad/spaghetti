import 'package:flutter/material.dart';
import 'package:untitled3/router/routes_constants.dart';
import 'package:untitled3/uiHelpers/app_radius.dart';
import 'package:untitled3/uiHelpers/font_text_style.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../UIHelpers/images.dart';
import '../../../../commonWidgets/bottomSheet/bottom_sheet_action.dart';


import 'package:get/get.dart';

import '../../../../core/base_controller.dart';
import '../../../../functions/helper_classes.dart';
import '../../../../uiHelpers/app_colors.dart';
import '../../../../uiHelpers/app_spacing.dart';
import '../../../../utils/translation_keys.dart';
import '../../data/models/request_data.dart';


class RequestsCenterController extends BaseController {
  // State variables
  bool isSearching = false; // Tracks if the search bar is active
  String searchQuery = ""; // Holds the current search query
  List<String> searchResult = [];
  // RxString selectedChoice = ''.obs;
  var isCommentsExpanded = false;

  // Original list of requests
  final allRequests = <RequestData>[].obs;

  // Filtered list of requests
  final filteredRequests = <RequestData>[].obs;
  final selectedFilter = "".obs;

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

  void selectChoice(String filter) {
    // selectedChoice.value = choice;
    selectedFilter.value = filter;

    if (filter == "All" || filter.isEmpty) {
      filteredRequests.value = allRequests;
    } else {
      filteredRequests.value = allRequests
          .where((request) =>
          request.state.status.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadRequests();
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
      // bottomSheetHeight: Get.size.height / 4,
      // contentHeight: Get.size.height / 6,
      content: ListView(
          shrinkWrap: true,
          children: [
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

  final requests = <RequestData>[];
  void loadRequests() {
    requests.addAll(fetchRequestDataList());
    allRequests.value = requests;
    filteredRequests.value = requests;
  }
  List<RequestData> fetchRequestDataList() {
    return [
      RequestData(
        categoryTitle: "Category 1",
        title: "Card Title 1",
        date: "29 Sep, 12:30 PM",
        state: RequestState(
          status: "In progress",
          requestId: "REQ123456",
          pendingOn: "Alice",
          statusTime: null,

        ),
      ),
      RequestData(
        categoryTitle: "Category 2",
        title: "Card Title 2",
        date: "29 Sep, 12:30 PM",
        state: RequestState(
          status: "Approved on",
          requestId: null,
          pendingOn: null,
          statusTime: "10 Feb, 10:30 PM",

        ),
      ),
      RequestData(
        categoryTitle: "Category 3",
        title: "Card Title 3",
        date: "29 Sep, 12:30 PM",
        state: RequestState(
          status: "Rejected on",
          requestId: null,
          pendingOn: null,
          statusTime: "30 Sep, 12:40 PM",
        ),
      ),
      RequestData(
        categoryTitle: "Category 4",
        title: "Card Title 4",
        date: "29 Sep, 12:30 PM",
        state: RequestState(
          status: "Cancelled on",
          requestId: null,
          pendingOn: null,
          statusTime: "29 Sep, 12:30 PM",
        ),
      ),
      RequestData(
        categoryTitle: "Category 5",
        title: "Card Title 5",
        date: "29 Sep, 12:30 PM",
        state: RequestState(
          status: "In progress",
          requestId: "REQ123457",
          pendingOn: "Bob",
          statusTime: null,

        ),
      ),
    ];
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
      content: Column(
        children: [
          ListView.separated(
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
                                decoration: ShapeDecoration(
                                  color: isApproved
                                      ? AppColors.darkGreen
                                      : AppColors.neutral200,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.xs)),
                                ),
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
          SizedBox(height: AppSpacing.l.getHeight(),)
        ],
      ),
      title: approvalLine.tr,
    );
  }
}
