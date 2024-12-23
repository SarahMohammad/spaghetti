import 'package:get/get.dart';
import 'globalServices/ILocalizationService.dart';
import 'globalServices/localization_service.dart';

void setupLocator() {
  Get.lazyPut<ILocalizationService>(() => LocalizationService());
}
