import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/base_controller.dart';
import '../../../../globalServices/ILocalizationService.dart';
import '../../../../globalServices/lookups_services.dart';

class CreatePasswordController extends BaseController {
  final localization = Get.find<ILocalizationService>();
  final LookupsServices lookupsServices = LookupsServices();
  bool hidePassword = true;
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  var isResetButtonActive = false.obs;

  var errorSnackBarVisibility = false;

void toggleSnackBarVisibility(){
  errorSnackBarVisibility =true;
  update();
}
  void showPassword() {
    hidePassword = !hidePassword;
    update();
  }

  void _validateInput() {
    final newPassword = newPasswordController.text.trim();
    final confirmPassword = confirmNewPasswordController.text.trim();

    if (newPassword.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        newPassword == confirmPassword) {
      isResetButtonActive.value = true;
    } else {
      isResetButtonActive.value = false;
    }
  }

  @override
  void onInit() async {
    super.onInit();
    newPasswordController.addListener(_validateInput);
    confirmNewPasswordController.addListener(_validateInput);
  }

}
