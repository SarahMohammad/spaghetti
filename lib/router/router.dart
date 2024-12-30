import 'package:get/get.dart';
import 'package:untitled3/features/createPassword/presentation/screens/create_password_screen.dart';
import 'package:untitled3/features/forgetPassword/presentation/screens/request_sent_screen.dart';
import 'package:untitled3/features/forgetPassword/presentation/screens/forget_password_screen.dart';
import 'package:untitled3/features/home/presentation/screens/home_screen.dart';
import 'package:untitled3/features/mainScreen/presentation/main_screen.dart';
import 'package:untitled3/features/requestsCenter/presentation/request_center_details.dart';
import 'package:untitled3/features/requestsCenter/presentation/requests_center_screen.dart';
import 'package:untitled3/features/services/presentation/screens/services_screen.dart';
import 'package:untitled3/router/routes_constants.dart';
import '../features/login/presentation/screens/login_screen.dart';
import '../features/otp/presentation/screens/otp_screen.dart';
import '../features/projectRequestForm/presentation/screens/project_request_form_details.dart';
import '../features/projectRequestForm/presentation/screens/request_form_screen.dart';
import '../features/projectRequestForm/presentation/screens/request_submit_screen.dart';
import '../features/splash/presentation/screens/splash_screen.dart';
import '../features/systems/presentation/systems_screen.dart';
import '../features/verifyIdentity/presentation/screens/verify_identity_screen.dart';
import '../utils/global_bindings.dart';

class AppRouter {
  static final routes = [

    GetPage(
      name: RoutesConstants.splashScreen,
      page: () => SplashScreen(),
      transition: Transition.fade,
      binding: GlobalBindings(),
    ),
    GetPage(
      name: RoutesConstants.loginScreen,
      page: () => LoginScreen(),
      transition: Transition.fade,
      binding: GlobalBindings(),
    ),
    GetPage(
      name: RoutesConstants.verifyIdentityScreen,
      page: () => VerifyIdentityScreen(),
      transition: Transition.fade,
      binding: GlobalBindings(),
    ),
    GetPage(
      name: RoutesConstants.forgetPasswordScreen,
      page: () => ForgetPasswordScreen(),
      transition: Transition.fade,
      binding: GlobalBindings(),
    ),

    GetPage(
      name: RoutesConstants.otpScreen,
      page: () => OtpScreen(),
      transition: Transition.fade,
      binding: GlobalBindings(),
    ),

    GetPage(
      name: RoutesConstants.createPasswordScreen,
      page: () => CreatePasswordScreen(),
      transition: Transition.fade,
      binding: GlobalBindings(),
    ),
       GetPage(
      name: RoutesConstants.requestSentScreen,
      page: () => RequestSentScreen(),
      transition: Transition.fade,
      binding: GlobalBindings(),
    ),
       GetPage(
      name: RoutesConstants.requestFormScreen,
      page: () => RequestFormScreen(),
      transition: Transition.fade,
      binding: GlobalBindings(),
    ),
          GetPage(
      name: RoutesConstants.homeScreen,
      page: () => HomeScreen(),
      transition: Transition.fade,
      binding: GlobalBindings(),
    ),
          GetPage(
      name: RoutesConstants.mainScreen,
      page: () => MainScreen(),
      transition: Transition.fade,
      binding: GlobalBindings(),
    ),

    GetPage(
      name: RoutesConstants.systemsScreen,
      page: () => SystemsScreen(),
      transition: Transition.fade,
      binding: GlobalBindings(),
    ),

   GetPage(
      name: RoutesConstants.requestSubmitScreen,
      page: () => RequestSubmitScreen(),
      transition: Transition.fade,
      binding: GlobalBindings(),
    ),

   GetPage(
      name: RoutesConstants.projectRequestFormDetails,
      page: () => ProjectRequestFormDetails(),
      transition: Transition.fade,
      binding: GlobalBindings(),
    ),

 GetPage(
      name: RoutesConstants.servicesScreen,
      page: () => ServicesScreen(),
      transition: Transition.fade,
      binding: GlobalBindings(),
    ),

 GetPage(
      name: RoutesConstants.requestsCenterScreen,
      page: () => RequestsCenterScreen(),
      transition: Transition.fade,
      binding: GlobalBindings(),
    ),

 GetPage(
      name: RoutesConstants.requestCenterDetailsScreen,
      page: () => RequestCenterDetails(),
      transition: Transition.fade,
      binding: GlobalBindings(),
    ),





  ];
}
