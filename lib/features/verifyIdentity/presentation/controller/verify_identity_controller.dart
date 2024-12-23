import 'package:get/get.dart';

import '../../../../core/base_controller.dart';
import '../../../../globalServices/ILocalizationService.dart';
import '../../../../utils/constant_keywords.dart';

class VerifyIdentityController extends BaseController {
  final localization = Get.find<ILocalizationService>();
  int _selectedOption = 0;


  int get selectedOption => _selectedOption;
  var isSendButtonActive = false.obs;



  @override
  void onInit() async {
    super.onInit();
  }


  void clickMobileBtn() {
    _selectedOption = ConstantKeys.sendMobileOption ;
    isSendButtonActive.value =true;
    update();
  }

  void clickEmailBtn() {
    _selectedOption = ConstantKeys.sendEmailOption;
    isSendButtonActive.value =true;
    update();
  }

}
