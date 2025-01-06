import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled3/UIHelpers/icons.dart';
import 'package:untitled3/features/home/data/models/category.dart';
import 'package:untitled3/utils/constant.dart';

import '../commonWidgets/bottomSheet/bottom_sheet_action.dart';
import '../commonWidgets/buttons/custom_button.dart';
import '../commonWidgets/search_box.dart';
import '../features/home/data/models/service.dart';
import '../features/services/widgets/category_grid_tile.dart';
import '../uiHelpers/app_colors.dart';
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
   static showProjectImplYears({required List<String> years}) {
     showBottomActionModelSheet(
       Get.context!,
       showCloseIcon: true,
       content: ListView.separated(
         shrinkWrap: true,
         itemCount: years.length,
         itemBuilder: (context, index) {
           // Display each year
           return Padding(
             padding:  EdgeInsets.symmetric(vertical: AppSpacing.m.getHeight()),
             child: Center(
               child: Text(
                 years[index].toString(),
                 style: FontTextStyle.labelLarge.copyWith(
                     color: AppColors.neutral900),
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

}
