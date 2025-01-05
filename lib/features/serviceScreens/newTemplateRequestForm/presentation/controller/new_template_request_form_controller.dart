import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../../commonWidgets/bottomSheet/bottom_sheet_action.dart';
import '../../../../../commonWidgets/search_box.dart';
import '../../../../../core/base_controller.dart';
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
  showPartyTypeName(int partyIndex) {
    showBottomActionModelSheet(Get.context!,
        showCloseIcon: true,
        content: Column(
          children: [
            SearchBox(
              onChanged: (val) {
                // if (val.isEmpty) {
                //   faqController.loadData();
                // }
              },

              onSearch: (val) {
                // faqController.loadData();
              },
              controller: null,
              suffixIconExist: false,
              isPrefixIconVisible: true,
              //         onSuffixClick: () {
              // faqController.loadData();
              // }
              prefixIconExist: true,
            ),
            SizedBox(height: 15.getHeight()),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: names.length,
                itemBuilder: (context, index) {
                  // Display each year
                  return InkWell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.getHeight()),
                      child: Text(
                        names[index].toString(),
                        style: FontTextStyle.labelLarge
                            .copyWith(color: AppColors.neutral900),
                      ),
                    ),
                    onTap: () {
                      partiesValues[partyIndex].name = names[index];
                      partiesValues.refresh();
                      refresh();
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  // Add a horizontal line between items
                  return const Divider(
                    color: AppColors.neutral500,
                    thickness: 1,
                  );
                },
              ),
            ),
          ],
        ),
        title: "Party Type Name",
        isScrollControlled: true,
    );
  }

  showPartyCategory(int partyIndex) {
    showBottomActionModelSheet(
      Get.context!,
      showCloseIcon: true,
      isScrollControlled: true,
      content: ListView.separated(
        shrinkWrap: true,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          // Display each year
          return InkWell(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.getHeight()),
              child: Text(
                categories[index].toString(),
                style: FontTextStyle.labelLarge
                    .copyWith(color: AppColors.neutral900),
              ),
            ),
            onTap: () {
              partiesValues[partyIndex].category = categories[index];
              partiesValues.refresh();
              refresh();
            },
          );
        },
        separatorBuilder: (context, index) {
          // Add a horizontal line between items
          return const Divider(
            color: AppColors.neutral500,
            thickness: 1,
          );
        },
      ),
      title: "Category 1",
    );
  }
}