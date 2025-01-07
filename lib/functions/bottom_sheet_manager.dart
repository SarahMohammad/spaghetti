import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled3/UIHelpers/icons.dart';
import 'package:untitled3/features/home/data/models/category.dart';
import 'package:untitled3/utils/constant.dart';

import '../UIHelpers/images.dart';
import '../commonWidgets/bottomSheet/bottom_sheet_action.dart';
import '../commonWidgets/buttons/custom_button.dart';
import '../commonWidgets/custom_form_field.dart';
import '../commonWidgets/search_box.dart';
import '../features/home/data/models/service.dart';
import '../features/serviceScreens/projectRequestForm/presentation/controller/request_form_controller.dart';
import '../features/services/widgets/category_grid_tile.dart';
import '../router/routes_constants.dart';
import '../uiHelpers/app_colors.dart';
import '../uiHelpers/app_radius.dart';
import '../uiHelpers/app_spacing.dart';
import '../uiHelpers/font_text_style.dart';
import '../utils/button_enum.dart';
import '../utils/translation_keys.dart';
import 'helper_classes.dart';

class BottomSheetManager {

/// Bottom sheet for show service/system description
   static showServiceSystemDescriptionBottomSheet({required ServiceSystem serviceSystem , Key? key}) {
    showBottomActionModelSheet(
      Get.context!,
      showCloseIcon: true,
      content:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: AppSpacing.l.getHeight(),),
          Text(serviceSystem.description ,
            style: FontTextStyle.paragraphMedium.copyWith(color: AppColors.neutral800),),
          SizedBox(height: AppSpacing.xl.getHeight(),),
          SizedBox(
            height:52.getHeight(),
            width: Get.size.width,
            child: CustomButton(
              key,
              //radius: 40,
              buttonTitle: requestService.tr,
              padding: EdgeInsets.zero,
              onPressed: () {
              },
              buttonType: ButtonType.primary,
              isDisabled: false,
              showSuffixIcon: serviceSystem.isSystem != null &&
                  serviceSystem.isSystem! ? true :false,
              suffixIcon: serviceSystem.isSystem != null &&
                  serviceSystem.isSystem! ? SvgPicture.asset(AllIcons.systemIcon , colorFilter: const ColorFilter.mode( Colors.white, BlendMode.srcIn)
                ,): null,
            ),
          )
        ],),
      title: serviceSystem.title,
      titleAlignment: TextAlign.start,
      showPrefixIcon: serviceSystem.isSystem != null && serviceSystem.isSystem! ? true :false,
      titleStyle: FontTextStyle.labelX.
      copyWith(color: AppColors.neutral900),
      isScrollControlled: true,

      // bottomSheetHeight: Get.size.height / 3,
      // contentHeight: Get.size.height / 5.5,

    );
  }
///  Bottom sheet for showing categories
   static openCategoryBottomSheet({
     required List<Category> categories,
     required Function(Category) onCategorySelected, // Callback to notify selection
   }) {
     var selectedIndex = (-1).obs; // Observable variable to track selected index

     showBottomActionModelSheet(
       Get.context!,
       showCloseIcon: true,
       content: ConstrainedBox(
         constraints: BoxConstraints(
           maxHeight: Get.size.height * 0.85,
         ),
         child: GridView.builder(
           shrinkWrap: true,
           itemCount: categories.length,
           padding: EdgeInsets.symmetric(
             vertical: AppSpacing.l.getHeight(),
           ),
           scrollDirection: Axis.vertical,
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 2,
             mainAxisSpacing: AppSpacing.m.getHeight(),
             crossAxisSpacing: AppSpacing.m.getWidth(),
           ),
           itemBuilder: (context, index) {
             return Obx(() => CategoryGridTile(
               title: categories[index].title,
               isSelected: index == selectedIndex.value,
               onPressed: () {
                 selectedIndex.value = index;
                 onCategorySelected(categories[index]); // Notify the selected category
               },
             ));
           },
         ),
       ),
       title: selectCategory.tr,
       titleAlignment: TextAlign.center,
       isScrollControlled: true,
     );
   }

   /// Bottom sheet for showing years
   static showProjectImplYears({required List<String> years ,
     required Function(String selectedYear) onYearSelected,
   }) {
     showBottomActionModelSheet(
       Get.context!,
       showCloseIcon: true,
       content: ListView.separated(
         shrinkWrap: true,
         itemCount: years.length,
         itemBuilder: (context, index) {
           // Display each year
           return InkWell(
             onTap: (){
               // Pass the selected year back to the controller
               onYearSelected(years[index]);
               // Close the bottom sheet
               Get.back();
             },
             child: Padding(
               padding:  EdgeInsets.symmetric(vertical: AppSpacing.m.getHeight()),
               child: Center(
                 child: Text(
                   years[index].toString(),
                   style: FontTextStyle.labelLarge.copyWith(
                       color: AppColors.neutral900),
                 ),
               ),
             ),
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
       title: projectImplYear.tr,
     );
   }

   /// Bottom sheet for showing party categories
   static showPartyCategory({required int partyIndex , required List<String> categories,
     required Function(String) onPartyCategorySelected,
   }) {
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
               onPartyCategorySelected(categories[index]);
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

   /// Bottom sheet for showing party names
   static showPartyTypeName({required int partyIndex , required List<String> names,
   required Function(String) onPartyNameSelected}) {
     showBottomActionModelSheet(
       Get.context!,
       showCloseIcon: true,
       content: Column(
         mainAxisSize: MainAxisSize.min,
         children: [
           SearchBox(
             onChanged: (val) {
               // Handle search box changes
             },
             onSearch: (val) {
               // Handle search box search action
             },
             controller: null,
             suffixIconExist: false,
             isPrefixIconVisible: true,
             prefixIconExist: true,
           ),
           SizedBox(height: 15.getHeight()),
           Flexible(
             child: ListView.separated(
               shrinkWrap: true,
               physics: const NeverScrollableScrollPhysics(),
               itemCount: names.length,
               itemBuilder: (context, index) {
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
                     onPartyNameSelected(names[index]);

                   },
                 );
               },
               separatorBuilder: (context, index) {
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

  static void openFilterSheet({required List<String> categories,})  {
    var selectedIndex = (-1).obs; // Observable variable to track selected index

    showBottomActionModelSheet(
      Get.context!,
      showCloseIcon: true,
      content: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: Get.size.height * 0.85,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align content to the start
          children: [
            // Label for the Date row
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppSpacing.m.getHeight(),
              ),
              child: Container(
                color:Colors.white,
                child: Text(
                  date.tr,
                  style: FontTextStyle.headingMedium,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.zero,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: CustomFormField(
                      readOnly: true,
                      onTap: () {
                        // requestFormController.showProjectImplYearsBottomSheet();
                      },
                      suffix: SvgPicture.asset(
                        AllIcons.calendarIcon,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  SizedBox(width: AppSpacing.s.getWidth()),
                  Expanded(
                    child: CustomFormField(
                      readOnly: true,
                      onTap: () {
                        // requestFormController.showProjectImplYearsBottomSheet();
                      },
                      suffix: SvgPicture.asset(
                        AllIcons.calendarIcon,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.m.getHeight()),

            // Label for the Categories grid
            Padding(
              padding: EdgeInsets.symmetric(
                // horizontal: AppSpacing.m.getWidth(),
                vertical: AppSpacing.m.getHeight(),
              ),
              child: Text(
                category.tr,
                style: FontTextStyle.headingMedium,
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.zero,
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: AppSpacing.m.getHeight(),
                  crossAxisSpacing: AppSpacing.m.getWidth(),
                ),
                itemBuilder: (context, index) {
                  return Obx(() => CategoryGridTile(
                    title: categories[index],
                    isSelected: index == selectedIndex.value,
                    onPressed: () {
                      selectedIndex.value = index;
                      // onCategorySelected(categories[index]); // Notify the selected category
                    },
                  ));
                },
              ),
            ),
          ],
        ),
      ),
      title: selectCategory.tr,
      titleAlignment: TextAlign.center,
      isReset: true,
      onResetPressed: () {
        print("Reset pressed");
      },
      isScrollControlled: true,
    );


  }

  static void openApprovalLineSheet({required List<Map<String, dynamic>> approvals}) {
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

  static void openOptionsBottomSheet({required List<Map<String, dynamic>> approvals}) {
    showBottomActionModelSheet(
      Get.context!,
      showCloseIcon: false,
      isScrollControlled: true,
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
                      viewDetails.tr,
                      style: FontTextStyle.labelLarge.copyWith(color: AppColors.neutral900)
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
                openApprovalLineSheet(approvals: approvals);
              },
              child: Container(
                color: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.m.getWidth(),
                      vertical: AppSpacing.l.getHeight()),
                  child: Text(
                    viewApprovalLine.tr,
                    style: FontTextStyle.labelLarge.copyWith(color: AppColors.neutral900),
                  ),
                ),
              ),
            )
          ]),
    );
  }

  static Future<void> openDatePicker({required BuildContext context ,
    required Function(DateTime) onDateSelected,
    required Rx<DateTime> selectedDateObs,}) async {
    // final RequestFormController controller = Get.find<RequestFormController>();
    // final DateTime currentSelectedDate = controller.dateSelected.value;
    final DateTime currentSelectedDate = selectedDateObs.value;

    final DateTime? selectedDate =  await showDatePickerDialog(
       context: context,
       initialDate: DateTime(2024, 12, 4),
       minDate: DateTime(2020, 10, 10),
       maxDate: DateTime(2025, 10, 30),
       selectedDate: currentSelectedDate,
       selectedCellTextStyle: const TextStyle(color: AppColors.blue),
       selectedCellDecoration: const BoxDecoration(shape: BoxShape.circle,
           color: AppColors.darkBlue),
       currentDateTextStyle: const TextStyle(color: AppColors.blue),
       enabledCellsTextStyle: const TextStyle(color: Colors.black),
       leadingDateTextStyle:  TextStyle(color: Colors.black,
         fontSize: 17.getFontSize(),),
       slidersColor: Colors.black,
     );
    if (selectedDate != null) {
      onDateSelected(selectedDate);
    }
   }

}
