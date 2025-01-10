import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:untitled3/functions/bottom_sheet_manager.dart';
import '../../../../../core/base_controller.dart';
import '../../../../../functions/helper_classes.dart';
import '../../../../../globalServices/ILocalizationService.dart';


class RequestFormController extends BaseController {
  final localization = Get.find<ILocalizationService>();

  TextEditingController authorizedPersonnelController = TextEditingController();
  TextEditingController similarProjectsController = TextEditingController();
  TextEditingController projectNameController = TextEditingController();
  TextEditingController projectDurationController = TextEditingController();
  TextEditingController projectOwnerController = TextEditingController();
  TextEditingController valueController = TextEditingController();
  TextEditingController approvalAuthorityController = TextEditingController();
  TextEditingController managementApprovalController = TextEditingController();
  TextEditingController externalApprovalController = TextEditingController();
  TextEditingController projectDescriptionController = TextEditingController();
  TextEditingController structureController = TextEditingController();
  TextEditingController paymentStructureController = TextEditingController();
  TextEditingController projectImplYearController = TextEditingController();
  TextEditingController closingDateController = TextEditingController();

  //  to manage the state of the submit button
  final isSubmitEnabled = false.obs;

  // Observables for project implementation year and closing date
  final projectImplementationYear = ''.obs;
  final expectedClosingDate = ''.obs;

  final names = [
    "The Royal Commission for Al Ula",
    "Option1",
    "Option2",
    "Option3",
    "Option4",
    "Option5",
    "Option6",
    "Option7",
  ];
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

  var partiesValues = <Party>[Party()].obs;


  var commentsList = <Comment>[Comment()].obs;

  void addComment() {
    commentsList.add(Comment());
  }


  void addParty() {
    partiesValues.add(Party());
  }


  @override
  void onInit() async {
    super.onInit();
    _initializeValidation();
    getDetailsScreenData();
  }

  void _initializeValidation() {
    // List of controllers
    final controllers = [
      authorizedPersonnelController,
      similarProjectsController,
      projectNameController,
      projectDurationController,
      projectOwnerController,
      valueController,
      approvalAuthorityController,
      managementApprovalController,
      externalApprovalController,
      structureController,
      paymentStructureController,
    ];

    // Add listeners to all controllers
    for (var controller in controllers) {
      controller.addListener(_validateForm);
    }

    // React to changes in implementation year, closing date, or parties list
    everAll([projectImplementationYear, expectedClosingDate, partiesValues], (_) {
      _validateForm();
    });
  }

  // Form validation logic
  void _validateForm() {
    final areTextFieldsValid = [
      authorizedPersonnelController.text.trim(),
      similarProjectsController.text.trim(),
      projectNameController.text.trim(),
      projectDurationController.text.trim(),
      projectOwnerController.text.trim(),
      valueController.text.trim(),
      approvalAuthorityController.text.trim(),
      managementApprovalController.text.trim(),
      externalApprovalController.text.trim(),
      structureController.text.trim(),
      paymentStructureController.text.trim(),
    ].every((field) => field.isNotEmpty);

    // Check if project implementation year and closing date are valid
    final areDatesValid = projectImplYearController.text.isNotEmpty &&
        closingDateController.text.isNotEmpty;

    // Check if at least one party has valid data
    final isAnyPartyValid = partiesValues.any((party) =>
    party.name.isNotEmpty &&
        party.category.isNotEmpty &&
        party.type.isNotEmpty);

    // Set the submit button state
    isSubmitEnabled.value = areTextFieldsValid && areDatesValid && isAnyPartyValid;

  }

  @override
  void onClose() {
    authorizedPersonnelController.dispose();
    similarProjectsController.dispose();
    projectNameController.dispose();
    projectDurationController.dispose();
    projectOwnerController.dispose();
    valueController.dispose();
    approvalAuthorityController.dispose();
    managementApprovalController.dispose();
    externalApprovalController.dispose();
    structureController.dispose();
    paymentStructureController.dispose();
    super.onClose();
  }


  getName(index) {
    return partiesValues[index].name;
  }

  getCategory(index) {
    return partiesValues[index].category;
  }

  var dateSelected = DateTime.now().obs;

  openDatePicker(BuildContext context){
    BottomSheetManager.openDatePicker(context: context,
    selectedDateObs: dateSelected,
    onDateSelected: (selectedDate){
      dateSelected.value = selectedDate;
      String formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
      closingDateController.text = formattedDate.toString();
    });
  }


  void showProjectImplYearsBottomSheet() {
    List<String> years = List.generate(7, (index) => (2024 + index).toString());
    BottomSheetManager.showProjectImplYears(
      years: years,
      onYearSelected: (selectedYear) {
        projectImplYearController.text = selectedYear;
        update();
      },
    );
  }

  void showPartyCategory(int key) {
    BottomSheetManager.showPartyCategory( categories: categories, partyIndex: key,
          onPartyCategorySelected: (selectedCategory){
          partiesValues[key].category =selectedCategory;
          partiesValues.refresh();
          refresh();
        });
    update();
  }

  void showPartyTypeName(int key) {
    BottomSheetManager.showPartyTypeName( names: names, partyIndex: key,
        onPartyNameSelected: (selectedName){
          partiesValues[key].name =selectedName;
          partiesValues.refresh();
          refresh();
        });
    update();
  }
  late Request request;
  getDetailsScreenData(){
     request = Request(role: 'HR Manager',
        requestFor : 'Ali Al Ghafli',
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
         role: "HR Manager" )
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

}