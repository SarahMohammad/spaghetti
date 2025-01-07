import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/base_controller.dart';
import '../../../../functions/bottom_sheet_manager.dart';
import '../../../../globalServices/ILocalizationService.dart';

class ForgetPasswordController extends BaseController {
  final localization = Get.find<ILocalizationService>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController userTypeController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  var isSendRequestButtonActive = false.obs;


  void _validateInput() {
    if (userNameController.text.trim().isNotEmpty &&
        userTypeController.text.trim().isNotEmpty) {
      isSendRequestButtonActive.value = true;
    } else {
      isSendRequestButtonActive.value = false;
    }
  }
  @override
  void onInit() async {
    super.onInit();
    userNameController.addListener(_validateInput);
    userTypeController.addListener(_validateInput);
  }

  DateTime? selectedDate;

  var dateSelected = DateTime.now().obs;

  openDatePicker(BuildContext context){
    BottomSheetManager.openDatePicker(context: context,
        selectedDateObs: dateSelected,
        onDateSelected: (selectedDate){
          dateSelected.value = selectedDate;
          String formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
          birthDateController.text = formattedDate.toString();
        });
  }

}
