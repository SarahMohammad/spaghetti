import 'package:get/get.dart';
import '../../../../core/base_controller.dart';
import '../../../../core/localstorage_manager.dart';
import '../../../../globalServices/ILocalizationService.dart';
import '../../../../globalServices/lookups_services.dart';
import '../../../../router/routes_constants.dart';
import '../../../../utils/constant_keywords.dart';

class SplashController extends BaseController {
  final localization = Get.find<ILocalizationService>();
  final LookupsServices lookupsServices = LookupsServices();


  @override
  void onInit() async {
    super.onInit();
    await initializeMethods();
  }

  Future<void> initializeMethods() async {
    await getSavedLanguage();
    await lookupsServices.initLookupSplashScreen();
    moveToNextScreen();
  }


  Future<void> moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
        Get.offAndToNamed(RoutesConstants.loginScreen);
  }

  Future<void> getSavedLanguage() async {
    String? lang = await LocalStorageManager.currentLanguage;
    localization.changeLocale(lang ?? ConstantKeys.english);
  }
}
