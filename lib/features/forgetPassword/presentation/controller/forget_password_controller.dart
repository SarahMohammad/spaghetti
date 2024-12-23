import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/base_controller.dart';
import '../../../../globalServices/ILocalizationService.dart';

class ForgetPasswordController extends BaseController {
  final localization = Get.find<ILocalizationService>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController userTypeController = TextEditingController();
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

  // Function to open the calendar dialog
  Future<void> openDatePicker(BuildContext context) async {
    await showDatePickerDialog(
      context: context,
      initialDate: DateTime(2024, 12, 4),
      minDate: DateTime(2020, 10, 10),
      maxDate: DateTime(2025, 10, 30),
      // width: 300,
      // height: 300,
      // currentDate: DateTime(2022, 10, 15),
      selectedDate: DateTime(2024, 12, 20),
      selectedCellTextStyle: TextStyle(color: Color(0xFF007AFF)),
      selectedCellDecoration: BoxDecoration(shape: BoxShape.circle,
      color: Color(0x2F007AFF)),
      currentDateTextStyle: TextStyle(color: Color(0xFF007AFF)),
      currentDateDecoration: BoxDecoration(shape: BoxShape.circle,
          border: Border.all(color: Color(0xFFFFFF))),
      // daysOfTheWeekTextStyle: const TextStyle(),
      // disabledCellsTextStyle: const TextStyle(),
      // enabledCellsDecoration: const BoxDecoration(color: Colors.amber),
      enabledCellsTextStyle: const TextStyle(color: Colors.black),
      // initialPickerType: PickerType.days,
      // selectedCellDecoration: const BoxDecoration(),
      // selectedCellTextStyle: const TextStyle(),
      leadingDateTextStyle:  TextStyle(color: Colors.black,
        fontSize: 17,),
      slidersColor: Colors.black,
      // highlightColor: Colors.redAccent,
      // slidersSize: 20,
      // splashColor: Colors.lightBlueAccent,
      // splashRadius: 40,
      // centerLeadingDate: true,


    );
  }
}
