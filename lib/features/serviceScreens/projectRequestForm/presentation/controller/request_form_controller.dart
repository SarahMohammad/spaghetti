import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/functions/bottom_sheet_manager.dart';
import 'package:untitled3/uiHelpers/app_colors.dart';
import 'package:untitled3/uiHelpers/app_spacing.dart';
import 'package:untitled3/uiHelpers/font_text_style.dart';
import 'package:untitled3/utils/constant.dart';
import '../../../../../commonWidgets/bottomSheet/bottom_sheet_action.dart';
import '../../../../../commonWidgets/search_box.dart';
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

  String screenTitle = "";
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

  }


  getName(index) {
    return partiesValues[index].name;
  }

  getCategory(index) {
    return partiesValues[index].category;
  }



  Future<void> openDatePicker(BuildContext context) async {
    await showDatePickerDialog(
      context: context,
      initialDate: DateTime(2024, 12, 4),
      minDate: DateTime(2020, 10, 10),
      maxDate: DateTime(2025, 10, 30),
      selectedDate: DateTime(2024, 12, 20),
      selectedCellTextStyle: TextStyle(color: Color(0xFF007AFF)),
      selectedCellDecoration: BoxDecoration(shape: BoxShape.circle,
          color: Color(0x2F007AFF)),
      currentDateTextStyle: TextStyle(color: Color(0xFF007AFF)),
      currentDateDecoration: BoxDecoration(shape: BoxShape.circle,
          border: Border.all(color: Color(0xFFFFFF))),
      enabledCellsTextStyle: const TextStyle(color: Colors.black),
      leadingDateTextStyle:  TextStyle(color: Colors.black,
        fontSize: 17,),
      slidersColor: Colors.black,


    );
  }

  void showProjectImplYearsBottomSheet() {
    List<String> years = List.generate(7, (index) => (2024 + index).toString());
    BottomSheetManager.showProjectImplYears(years: years);
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

}