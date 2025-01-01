import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:untitled3/features/home/presentation/screens/home_screen.dart';
import 'package:untitled3/features/requestsCenter/controller/requests_center_controller.dart';
import 'package:untitled3/features/requestsCenter/presentation/requests_center_screen.dart';
import 'package:untitled3/features/services/presentation/screens/services_screen.dart';
import 'package:untitled3/features/systems/presentation/systems_screen.dart';
import '../../../../utils/constant_keywords.dart';
import '../../../core/base_controller.dart';

class NavBarController extends BaseController {
  int? _currentNavIndex = 0;

  int get currentNavIndex => _currentNavIndex!;

  List<Widget> navBarScreens = <Widget>[
    HomeScreen(),
    ServicesScreen(),
    SystemsScreen(),
    RequestsCenterScreen(),
  ];

  @override
  void onInit() async {
    super.onInit();
    if (Get.arguments != null) {
      int index = Get.arguments["index"].toInt();
      setCurrentNavIndexState(index);
    }

    navBarScreens = <Widget>[
      HomeScreen(),
      ServicesScreen(),
      SystemsScreen(),
      RequestsCenterScreen(),
    ];

    update();
  }

  void setCurrentNavIndexState(int val) {
    _currentNavIndex = val;
    update();
  }
}
