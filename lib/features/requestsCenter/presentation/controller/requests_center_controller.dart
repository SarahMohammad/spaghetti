import 'package:untitled3/functions/bottom_sheet_manager.dart';
import 'package:untitled3/router/routes_constants.dart';
import 'package:get/get.dart';

import '../../../../core/base_controller.dart';
import '../../../../functions/helper_classes.dart';
import '../../data/models/request_data.dart';


class RequestsCenterController extends BaseController {
  // State variables
  bool isSearching = false;
  String searchQuery = "";
  List<RequestData> searchResult = [];
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
    getDetailsScreenData();
  }
  late Request request;
  getDetailsScreenData() {
    request = Request(
      role: 'HR Manager',
      paymentStructure: "Typed text",
      projectOwner: "Ahmed hassan",
      projectDuration: "1-3 months",
      description: "This service allows business domains to",
      requestFor: 'Ali Al Ghafli',
      pendingOn: 'Ali Al Ghafli',
      status: 'Pending',
      requestId: 'REQ 122812',
      managementApproval: "text",
      approvalAuthority: "text",
      authorizedPersonal: "text",
      comments: [
        Comment(attachment: "",
            date: "Date",
            fileSize: "1.2 MB",
            message: "Hi mohamed, i can't approve your request."
                "i need an attachment to further approve your request.",
            name: "Ahmed Ammar",
            role: "HR Manager")
      ],
      etaWorkingDays: "4 business days",
      expectedClosingDate: "11/12/2026",
      externalApproval: "text",
      parties: [
        Party(
          name: "Party1",
          category: "Tenant",
          type: "Person",
        )
      ],
      projectImplementationYear: "2025",
      projectName: "Project name",
      similarProjects: "text",
      value: "text",
    );
  }
    void toggleSearch() {
      Get.toNamed(RoutesConstants.requestCenterSearchScreen);
    }


  openOptionsSheet() {
   BottomSheetManager.openOptionsBottomSheet(approvals: approvals);
  }

  final requests = <RequestData>[];

  final categories = [
    "None",
    "buyer",
    "commercial broker",
    "distributor",
    "external lawyer",
    "Lessor",
    "Provider",
    "Seller"
  ];

  void loadRequests() {
    requests.addAll(fetchRequestDataList());
    allRequests.value = requests;
    filteredRequests.value = requests;
  }
  List<RequestData> fetchRequestDataList() {
    return [
      RequestData(
        categoryTitle: "Administrative Services",
        title: "General Maintenance Request",
        date: "29 Sep, 12:30 PM",
        state: RequestState(
          status: "In progress",
          requestId: "REQ123456",
          pendingOn: "Ahmed Alhawari",
          statusTime: null,

        ),
      ),
      RequestData(
        categoryTitle: "Administrative Services",
        title: "Sourcing For Real Estate / Committee Evaluation",
        date: "29 Sep, 12:30 PM",
        state: RequestState(
          status: "Approved on",
          requestId: null,
          pendingOn: null,
          statusTime: "10 Feb, 10:30 PM",

        ),
      ),
      RequestData(
        categoryTitle: "Administrative Services",
        title: "General Maintenance Request",
        date: "29 Sep, 12:30 PM",
        state: RequestState(
          status: "Rejected on",
          requestId: null,
          pendingOn: null,
          statusTime: "30 Sep, 12:40 PM",
        ),
      ),
      RequestData(
        categoryTitle: "Human Capital",
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
        categoryTitle: "Administrative Services",
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

  openApprovalLineSheet() {
    BottomSheetManager.openApprovalLineSheet(approvals : approvals);
  }

  void closeSearch() {
    isSearching = false;
    searchQuery = "";
    searchResult = requests;
    Get.back();
  }

  void search(String query) {
    searchQuery = query;
    searchResult = requests
        .where((service) =>
        service.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    update();
  }
}
