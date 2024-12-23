import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/features/projectRequestForm/presentation/controller/form_field_handler.dart';
import 'package:untitled3/uiHelpers/app_colors.dart';
import 'package:untitled3/uiHelpers/font_text_style.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../commonWidgets/bottomSheet/bottom_sheet_action.dart';
import '../../../../commonWidgets/search_box.dart';
import '../../../../core/base_controller.dart';
import '../../../../globalServices/ILocalizationService.dart';
import '../../../../uiHelpers/app_spacing.dart';
import '../../../../utils/service_enum.dart';
import '../widgets/details_widget.dart';
import '../widgets/label_value_row.dart';

class Party {
  String type;
  String name;
  String category;

  Party({this.type = "person", this.name = "", this.category = ""});
}

class UploadFile {

  String name;
  String size;

  UploadFile({this.name = "", this.size = ""});
}

class Comment {

  final String name;
  final String role;
  final String date;
  final String message;
  final String? attachment;
  final String? fileSize;

  Comment({this.name = "", this.role="",
  this.attachment="", this.date="", this.fileSize="", this.message=""});
}

class RequestFormController extends BaseController {
  final localization = Get.find<ILocalizationService>();
  late ServiceType serviceType;
  final FormFieldHandler formFieldHandler = FormFieldHandler();

  final names = [
    "name",
    "name1",
    "name2",
    "name3",
    "name4",
    "name5",
    "name6",
    "name7",
    "name8",
    "name9",
    "name10"
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

  // var isSendButtonActive = false.obs;
  // TextEditingController projectNameController = TextEditingController();
  // TextEditingController projectDurationController = TextEditingController();
  // TextEditingController projectOwnerController = TextEditingController();
  // TextEditingController valueController = TextEditingController();
  // TextEditingController approvalAuthorityController = TextEditingController();
  // TextEditingController managementApprovalController = TextEditingController();
  // TextEditingController externalApprovalController = TextEditingController();
  // TextEditingController  projectDescriptionController = TextEditingController();
  // TextEditingController  structureController = TextEditingController();
  // TextEditingController  paymentStructureController = TextEditingController();
  // TextEditingController  authorizedPersonnelController = TextEditingController();
  // TextEditingController  similarProjectsController = TextEditingController();

  // var parties = <PartyWidget>[].obs;
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
        title: "Project implementation year",
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
      title: "Cat1",

    );
  }

  @override
  void onInit() async {
    super.onInit();
    serviceType = Get.arguments;
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
