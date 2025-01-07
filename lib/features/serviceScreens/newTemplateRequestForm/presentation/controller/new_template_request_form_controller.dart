import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../../commonWidgets/bottomSheet/bottom_sheet_action.dart';
import '../../../../../commonWidgets/search_box.dart';
import '../../../../../core/base_controller.dart';
import '../../../../../functions/bottom_sheet_manager.dart';
import '../../../../../functions/helper_classes.dart';
import '../../../../../uiHelpers/app_colors.dart';
import '../../../../../uiHelpers/font_text_style.dart';

class NewTemplateRequestFormController extends BaseController {
  TextEditingController projectNameController = TextEditingController();
  TextEditingController projectDurationController = TextEditingController();
  TextEditingController projectOwnerController = TextEditingController();
  TextEditingController valueController = TextEditingController();
  TextEditingController paymentStructureController = TextEditingController();
  TextEditingController authorizedPersonnelController = TextEditingController();
  TextEditingController similarProjectsController = TextEditingController();
  var partiesValues = <Party>[Party()].obs;
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
}