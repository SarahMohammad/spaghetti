import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/base_controller.dart';
import '../../../../../functions/bottom_sheet_manager.dart';
import '../../../../../functions/helper_classes.dart';

class NewTemplateRequestFormController extends BaseController {
  TextEditingController projectNameController = TextEditingController();
  TextEditingController projectDurationController = TextEditingController();
  TextEditingController projectOwnerController = TextEditingController();
  TextEditingController valueController = TextEditingController();
  TextEditingController paymentStructureController = TextEditingController();
  TextEditingController authorizedPersonnelController = TextEditingController();
  TextEditingController similarProjectsController = TextEditingController();
  var partiesValues = <Party>[Party()].obs;
  final isSubmitEnabled = false.obs;

  final names = [
    "The Royal Commission for Al Ula",
    "Option",
    "Option",
    "Option",
    "Option",
    "Option",
    "Option",
    "Option",
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
  var commentsList = <Comment>[Comment()].obs;


  void _initializeValidation() {
    // List of controllers
    final controllers = [
      authorizedPersonnelController,
      similarProjectsController,
      projectNameController,
      projectDurationController,
      projectOwnerController,
      valueController,
      paymentStructureController,
    ];

    // Add listeners to all controllers
    for (var controller in controllers) {
      controller.addListener(_validateForm);
    }

  }

  // Form validation logic
  void _validateForm() {
    final areTextFieldsValid = [

      projectNameController.text.trim(),
      projectDurationController.text.trim(),
      projectOwnerController.text.trim(),
      valueController.text.trim(),
      paymentStructureController.text.trim(),
      authorizedPersonnelController.text.trim(),
      similarProjectsController.text.trim(),
    ].every((field) => field.isNotEmpty);

    final isAnyPartyValid = partiesValues.any((party) =>
    party.name.isNotEmpty &&
        party.category.isNotEmpty &&
        party.type.isNotEmpty);

    // Set the submit button state
    isSubmitEnabled.value = areTextFieldsValid  && isAnyPartyValid;

  }

  @override
  void onClose() {
    authorizedPersonnelController.dispose();
    similarProjectsController.dispose();
    projectNameController.dispose();
    projectDurationController.dispose();
    projectOwnerController.dispose();
    valueController.dispose();
    paymentStructureController.dispose();
    super.onClose();
  }

  @override
  void onInit() async {
    super.onInit();
    getDetailsScreenData();
    _initializeValidation();
  }


  void addParty() {
    partiesValues.add(Party());
  }
  void addComment() {
    commentsList.add(Comment());
  }
  showPartyTypeName(int key) {
    BottomSheetManager.showPartyTypeName( names: names, partyIndex: key,
        onPartyNameSelected: (selectedName){
          partiesValues[key].name =selectedName;
          partiesValues.refresh();
          refresh();
        });
    update();
  }

  showPartyCategory(int key) {
    BottomSheetManager.showPartyCategory( categories: categories, partyIndex: key,
        onPartyCategorySelected: (selectedCategory){
          partiesValues[key].category =selectedCategory;
          partiesValues.refresh();
          refresh();
        });
    update();
  }

  late Request request;
  getDetailsScreenData(){
    request = Request(
      role: 'HR Manager',
      paymentStructure: "Typed text",
      projectOwner: "Ahmed hassan",
      projectDuration: "1-3 months",
      description : "This service allows business domains to",
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