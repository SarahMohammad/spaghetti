import 'package:get/get.dart';
import 'package:untitled3/features/createPassword/presentation/screens/create_password_screen.dart';
import 'package:untitled3/features/forgetPassword/presentation/screens/request_sent_screen.dart';
import 'package:untitled3/features/forgetPassword/presentation/screens/forget_password_screen.dart';
import 'package:untitled3/features/home/presentation/screens/home_screen.dart';
import 'package:untitled3/features/home/presentation/screens/recent_search_screen.dart';
import 'package:untitled3/features/home/presentation/screens/search_result_screen.dart';
import 'package:untitled3/features/mainScreen/presentation/screens/main_screen.dart';
import 'package:untitled3/features/requestsCenter/presentation/screens/request_center_search_screen.dart';
import 'package:untitled3/features/requestsCenter/presentation/screens/requests_center_screen.dart';
import 'package:untitled3/features/serviceScreens/newTemplateRequestForm/presentation/screens/new_template_request_form_screen.dart';
import 'package:untitled3/features/serviceScreens/nonRcuTemplateReviewRequest/presentation/screens/non_rcu_template_review_request_screen.dart';
import 'package:untitled3/features/services/presentation/screens/services_screen.dart';
import 'package:untitled3/features/services/presentation/screens/services_search_screen.dart';
import 'package:untitled3/router/routes_constants.dart';
import '../features/login/presentation/screens/login_screen.dart';
import '../features/otp/presentation/screens/otp_screen.dart';
import '../features/requestsCenter/presentation/screens/request_center_details.dart';
import '../features/serviceScreens/newTemplateRequestForm/presentation/screens/new_template_request_form_details.dart';
import '../features/serviceScreens/nonRcuTemplateReviewRequest/presentation/screens/non_rcu_form_details.dart';
import '../features/serviceScreens/projectRequestForm/presentation/screens/project_request_form_details.dart';
import '../features/serviceScreens/projectRequestForm/presentation/screens/request_form_screen.dart';
import '../features/serviceScreens/projectRequestForm/presentation/screens/request_submit_screen.dart';
import '../features/splash/presentation/screens/splash_screen.dart';
import '../features/systems/presentation/screens/systems_screen.dart';
import '../features/systems/presentation/screens/systems_search_screen.dart';
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
      name: RoutesConstants.projectRequestFormScreen,
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

GetPage(
      name: RoutesConstants.recentSearchScreen,
      page: () => RecentSearchScreen(),
      transition: Transition.fade,
      binding: GlobalBindings(),
    ),

GetPage(
      name: RoutesConstants.searchResultScreen,
      page: () => SearchResultScreen(),
      transition: Transition.fade,
      binding: GlobalBindings(),
    ),

GetPage(
      name: RoutesConstants.newTemplateRequestFromScreen,
      page: () => NewTemplateRequestFormScreen(),
      transition: Transition.fade,
      binding: GlobalBindings(),
    ),
    GetPage(
      name: RoutesConstants.nonRcuTemplateReviewRequestScreen,
      page: () => NonRcuTemplateReviewRequestScreen(),
      transition: Transition.fade,
      binding: GlobalBindings(),
    ),
    GetPage(
      name: RoutesConstants.newTemplateRequestFormDetails,
      page: () => NewTemplateRequestFormDetails(),
      transition: Transition.fade,
      binding: GlobalBindings(),
    ),


   GetPage(
      name: RoutesConstants.nonRcuFormDetailsScreen,
      page: () => NonRcuFormDetails(),
      transition: Transition.fade,
      binding: GlobalBindings(),
    ),

   GetPage(
      name: RoutesConstants.servicesSearchScreen,
      page: () => ServicesSearchScreen(),
      transition: Transition.fade,
      binding: GlobalBindings(),
    ),

    GetPage(
      name: RoutesConstants.systemsSearchScreen,
      page: () => const SystemsSearchScreen(),
      transition: Transition.fade,
      binding: GlobalBindings(),
    ),
    GetPage(
      name: RoutesConstants.requestCenterSearchScreen,
      page: () => const RequestCenterSearchScreen(),
      transition: Transition.fade,
      binding: GlobalBindings(),
    ),



  ];
}
