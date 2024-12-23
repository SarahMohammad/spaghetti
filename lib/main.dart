import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:untitled3/globalServices/ILocalizationService.dart';
import 'package:untitled3/router/router.dart';
import 'package:untitled3/router/routes_constants.dart';
import 'package:untitled3/service_locator.dart';
import 'package:untitled3/utils/global_bindings.dart';
import 'package:untitled3/utils/translation_keys.dart';

import 'globalServices/localization_service.dart';


bool isFlutterLocalNotificationsInitialized = false;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  GlobalBindings().dependencies();
  setupLocator();
  await GetStorage.init();
  await Get.find<ILocalizationService>().loadTranslationsFiles();




  runApp(
     const Budget(),
  );

}


class Budget extends StatefulWidget {
  const Budget({Key? key}) : super(key: key);

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> with WidgetsBindingObserver {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411.50, 876.75),
      minTextAdapt: true,
      builder: (_, widget) => GetMaterialApp(
        title: login.tr,
        theme: ThemeData(
          // primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
        ),
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar'),
          Locale('en') // OR Locale('ar', 'AE') OR other RTL locales
        ],
        initialRoute: RoutesConstants.splashScreen,
        getPages: AppRouter.routes,
        initialBinding: GlobalBindings(),
        debugShowCheckedModeBanner: false,
        translations: LocalizationService(),
        locale: LocalizationService.locale,
        fallbackLocale: LocalizationService.fallbackLocale,
      ),
    );
  }


  @override
  void initState() {
    super.initState();
  }

}
