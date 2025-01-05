import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/features/createPassword/presentation/controllers/create_password_controller.dart';
import 'package:untitled3/features/forgetPassword/presentation/controller/forget_password_controller.dart';
import 'package:untitled3/features/home/presentation/controller/services_systems_search_controller.dart';
import 'package:untitled3/features/serviceScreens/newTemplateRequestForm/presentation/controller/new_template_request_form_controller.dart';
import 'package:untitled3/features/serviceScreens/nonRcuTemplateReviewRequest/presentation/controller/non_rcu_template_review_request_controller.dart';
import 'package:untitled3/features/verifyIdentity/presentation/controller/verify_identity_controller.dart';
import '../features/home/presentation/controller/home_controller.dart';
import '../features/home/presentation/controller/search_result_controller.dart';
import '../features/login/presentation/controllers/login_controller.dart';
import '../features/mainScreen/presentation/controller/nav_bar_controller.dart';
import '../features/otp/presentation/controller/otp_controller.dart';
import '../features/requestsCenter/presentation/controller/requests_center_controller.dart';
import '../features/serviceScreens/projectRequestForm/presentation/controller/request_form_controller.dart';
import '../features/services/presentation/controller/services_controller.dart';
import '../features/splash/presentation/controller/splash_controller.dart';
import '../features/systems/presentation/controller/systems_controller.dart';


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
    Get.lazyPut<ServicesSystemsSearchController>(() => ServicesSystemsSearchController(), fenix: true);
    Get.lazyPut<SearchResultController>(() => SearchResultController(), fenix: true);
    Get.lazyPut<NewTemplateRequestFormController>(() => NewTemplateRequestFormController(), fenix: true);
    Get.lazyPut<NonRcuTemplateReviewRequestController>(() => NonRcuTemplateReviewRequestController(), fenix: true);
    }
}
