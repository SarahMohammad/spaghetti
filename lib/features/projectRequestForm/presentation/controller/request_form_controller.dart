import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/features/projectRequestForm/presentation/controller/form_field_handler.dart';
import 'package:untitled3/uiHelpers/app_colors.dart';
import 'package:untitled3/uiHelpers/font_text_style.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../commonWidgets/bottomSheet/bottom_sheet_action.dart';
import '../../../../commonWidgets/search_box.dart';
import '../../../../core/base_controller.dart';
import '../../../../functions/helper_classes.dart';
import '../../../../globalServices/ILocalizationService.dart';
import '../../../../uiHelpers/app_spacing.dart';
import '../../../../utils/service_enum.dart';
import '../widgets/details_widget.dart';
import '../widgets/label_value_row.dart';



class RequestFormController extends BaseController {
  final localization = Get.find<ILocalizationService>();
  late ServiceType serviceType;
  final FormFieldHandler formFieldHandler = FormFieldHandler();
  String screenTitle= "";
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


  var partiesValues = <Party>[Party()].obs;

  var uploadFilesList = <UploadFile>[UploadFile()].obs;

  var commentsList = <Comment>[Comment()].obs;



  void addComment() {
    commentsList.add(Comment());
  }

  void addUploadFile() {
    uploadFilesList.add(UploadFile());
  }

  void addParty() {
    partiesValues.add(Party());
  }


  showPartyTypeName(int partyIndex) {
    showBottomActionModelSheet(
        Get.context!,
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
                        style: FontTextStyle.labelLarge.copyWith(
                            color: AppColors.neutral900),
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
        contentHeight: Get.size.height / 1.4
    );
  }

  showPartyCategory(int partyIndex) {
    showBottomActionModelSheet(
      Get.context!,
      showCloseIcon: true,
      isScrollControlled: true,
      bottomSheetHeight: Get.size.height / 1.3,
      contentHeight: Get.size.height / 1.6,
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
                style: FontTextStyle.labelLarge.copyWith(
                    color: AppColors.neutral900),
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

  @override
  void onInit() async {
    super.onInit();
    serviceType = Get.arguments;
    screenTitle = serviceType == ServiceType.projectRequestForm ? "projrct request from" :
    serviceType == ServiceType.newTemplateRequestFrom ? "new template request form" :"Non-rcu template review request";
    print("coming from ${Get.arguments}");
  }

  Widget constructTopFields(ServiceType st) {
    switch (st) {
      case ServiceType.projectRequestForm:
        return formFieldHandler.callTopProjectRequestFormFields();
      case ServiceType.newTemplateRequestFrom:
        return formFieldHandler.callTopTemplateRequestFromFormFields();
      case ServiceType.nonRcu:
        return formFieldHandler.callTopNonRcuFromFormFields();

      default:
        return const SizedBox();
    }
  }

  Widget constructBottomFields(ServiceType st) {
    switch (st) {
      case ServiceType.projectRequestForm:
        return formFieldHandler.callBottomProjectRequestFormFields();
      case ServiceType.newTemplateRequestFrom:
        return formFieldHandler.callBottomTemplateRequesFormFields();
      case ServiceType.nonRcu:
        return SizedBox();

      default:
        return const SizedBox();
    }
  }


  getName(index) {
    return partiesValues[index].name;
  }

  getCategory(index) {
    return partiesValues[index].category;
  }

  Widget getTopProjectDetails() {
    switch (serviceType) {
      case ServiceType.projectRequestForm:
        return formFieldHandler.topPRFDetails();
      case ServiceType.newTemplateRequestFrom:
        return formFieldHandler.topNTRFDetails();
        case ServiceType.nonRcu:
        return formFieldHandler.topNonRCUDetails();
      default:
        return const SizedBox();

    }
  }
  Widget getBottomProjectDetails() {
    switch (serviceType) {
      case ServiceType.projectRequestForm:
        return formFieldHandler.bottomPRFDetails();
      case ServiceType.newTemplateRequestFrom:
        return formFieldHandler.bottomNTRFDetails();
        case ServiceType.nonRcu:
        return SizedBox();
      default:
        return const SizedBox();

    }
  }



}
