import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/base_controller.dart';
import '../../../../globalServices/ILocalizationService.dart';
import '../../../../globalServices/lookups_services.dart';

class LoginController extends BaseController {
  final localization = Get.find<ILocalizationService>();
  final LookupsServices lookupsServices = LookupsServices();
  bool hidePassword = true;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
    if (userNameController.text.trim().isNotEmpty && passwordController.text.trim().isNotEmpty) {
      isLoginButtonActive.value = true;
    } else {
      isLoginButtonActive.value = false;
    }
  }
  @override
  void onInit() async {
    super.onInit();
    userNameController.addListener(_validateInput);
    passwordController.addListener(_validateInput);
  }

}
