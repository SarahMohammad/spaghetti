


import 'package:get/get.dart';

import '../utils/translation_keys.dart';

class ValidationUtils {
  static String? required(value) {
    if (value == null || value == "") {
      return login.tr;
    }
    return null;
  }



  static String? passwordValidation(String value) {
    String? requiredMessage = required(value);
    if (requiredMessage != null) {
      return requiredMessage;
    }
    // if (!value.meetsOneNumber() ||
    //     !value.meetsCapitalLetter() ||
    //     !value.meetOneSymbol()) {
    //   return invalidPassword.tr;
    // }
    // if (!GetUtils.isLengthBetween(value, 8, 20)) {
    //   return min8Max20.tr;
    // }
    return null;
  }


}

extension StringExtension on String {
  meetsCapitalLetter() {
    RegExp regEx = RegExp(r"(?=.*[A-Z])");
    return regEx.hasMatch(this);
  }

  meetsSmallLetter() {
    RegExp regEx = RegExp(r"(?=.*[a-z])");
    return regEx.hasMatch(this);
  }

  meetsOneNumber() {
    RegExp regEx = RegExp(r"(?=.*?[0-9])");
    return regEx.hasMatch(this);
  }

  meetOneSymbol() {
    RegExp regEx = RegExp(r"(?=.*?[!@#\$&*~])");
    return regEx.hasMatch(this);
  }
}
