import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/uiHelpers/icons.dart';

import '../../../../core/base_controller.dart';
import '../../../../globalServices/ILocalizationService.dart';
import '../../../../utils/constant_keywords.dart';
import '../../../../utils/translation_keys.dart';

class OtpController extends BaseController {
  final localization = Get.find<ILocalizationService>();
  var isSendButtonActive = false.obs;
  TextEditingController pinCodeController = TextEditingController();
  int _retrySendCounter = 1;
  int get retrySendCounter => _retrySendCounter;
  RxBool isValid = true.obs;
  int otpDurationSec = 100;
  int otpMethodSelected =0;

  bool isValidRetrySendOtp = false;

  void showTimer() {
    otpDurationSec = _retrySendCounter > 1 ? 90 : 100;
    isValidRetrySendOtp = !isValidRetrySendOtp;
    update();
  }

  void onEnd() {
    otpDurationSec = 0;
    isValidRetrySendOtp = true;
    update();
  }

  getVerificationMethod(){
    return otpMethodSelected == ConstantKeys.sendMobileOption?  verifyByEmail.tr: verifyByMobile.tr;
  }
  getVerificationMethodIcon(){
    return otpMethodSelected == ConstantKeys.sendMobileOption?  AllIcons.emailIcon: AllIcons.mobileIcon;
  }
  @override
  void onInit() async {
    super.onInit();
    otpMethodSelected = Get.arguments;
  }



}
