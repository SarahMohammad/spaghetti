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
  var isLoginButtonActive = false.obs;

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
    if (newPasswordController.text.trim().isNotEmpty && confirmNewPasswordController.text.trim().isNotEmpty) {
      isLoginButtonActive.value = true;
    } else {
      isLoginButtonActive.value = false;
    }
  }
  @override
  void onInit() async {
    super.onInit();
    newPasswordController.addListener(_validateInput);
    confirmNewPasswordController.addListener(_validateInput);
  }

}
