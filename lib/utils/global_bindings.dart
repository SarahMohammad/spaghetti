import 'package:get/get.dart';
import 'package:untitled3/features/createPassword/presentation/controllers/create_password_controller.dart';
import 'package:untitled3/features/forgetPassword/presentation/controller/forget_password_controller.dart';
import 'package:untitled3/features/home/controller/home_controller.dart';
import 'package:untitled3/features/mainScreen/controller/nav_bar_controller.dart';
import 'package:untitled3/features/requestsCenter/controller/requests_center_controller.dart';
import 'package:untitled3/features/verifyIdentity/presentation/controller/verify_identity_controller.dart';
import '../features/login/presentation/controllers/login_controller.dart';
import '../features/otp/presentation/controller/otp_controller.dart';
import '../features/projectRequestForm/presentation/controller/request_form_controller.dart';
import '../features/services/controller/services_controller.dart';
import '../features/splash/presentation/controller/splash_controller.dart';
import '../features/systems/controller/systems_controller.dart';


class GlobalBindings extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<VerifyIdentityController>(() => VerifyIdentityController(), fenix: true);
    Get.lazyPut<ForgetPasswordController>(() => ForgetPasswordController(), fenix: true);
    Get.lazyPut<OtpController>(() => OtpController(), fenix: true);
    Get.lazyPut<CreatePasswordController>(() => CreatePasswordController(), fenix: true);
    Get.lazyPut<RequestFormController>(() => RequestFormController(), fenix: true);
    Get.lazyPut<NavBarController>(() => NavBarController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<SystemsController>(() => SystemsController(), fenix: true);
    Get.lazyPut<ServicesController>(() => ServicesController(), fenix: true);
    Get.lazyPut<RequestsCenterController>(() => RequestsCenterController(), fenix: true);
    }
}
