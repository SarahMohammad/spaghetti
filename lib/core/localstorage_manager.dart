import 'package:get_storage/get_storage.dart';

class LocalStorageManager {
  //Write language
  static void saveLanguageToDisk(String lang) async {
    await GetStorage().write("lang", lang);
  }

  //Read language
  static Future<String?> get currentLanguage async {
    return GetStorage().read('lang');
  }

  //Write biometric
  static void saveBioToDisk(bool bio) async {
    await GetStorage().write("bio", bio);
  }

  // writeAutoLogin
  // static void saveAutoLogin(bool autoLogin) async {
  //   await GetStorage().write("autoLogin", autoLogin);
  // }

  //Read language
  static Future<bool?> get currentBio async {
    return GetStorage().read('bio');
  }

  // static Future<bool?> get currentAutoLogin async {
  //   return GetStorage().read('autoLogin');
  // }

  // //Write Token
  // static void saveTokenToLocal(String token) async {
  //   await GetStorage().write('Token', token);
  // }

  // //Read Token
  // static Future<String> get getToken async {
  //   return await GetStorage().read('Token');
  // }
  //
  // //Remove Token
  // static Future removeToken() async {
  //   await GetStorage().remove('Token');
  // }
  //
  // //Write First Use
  // static void firstLogin() async {
  //   await GetStorage().write('logedBefore', true);
  // }
  //
  // // Check if the First Time Log in or not
  // static Future<bool> get logedBefore async {
  //   return await GetStorage().read('logedBefore');
  // }
}
