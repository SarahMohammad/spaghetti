import 'package:get/get.dart';
import 'package:untitled3/router/routes_constants.dart';

class ServicesRouteMapping {
  static List<RouteItem> serviceRouteMappings = [
    RouteItem(title: 'Project request form', type: ServiceType.projectRequestForm, route: RoutesConstants.projectRequestFormScreen),
    RouteItem(title: 'New template request form', type: ServiceType.newTemplateRequestFrom,route: RoutesConstants.newTemplateRequestFromScreen),
    RouteItem(title: 'Non-RCU template review request', type: ServiceType.nonRcu ,route: RoutesConstants.nonRcuTemplateReviewRequestScreen),
    // Add more items
  ];

  static late  ServiceType currentService;
  static navigateToDetailsScreen() {
    switch (currentService) {
      case ServiceType.projectRequestForm:
        Get.toNamed(RoutesConstants.projectRequestFormDetails);
        break;
      case ServiceType.newTemplateRequestFrom:
        Get.toNamed(RoutesConstants.newTemplateRequestFormDetails);
        break;
      case ServiceType.nonRcu:
        Get.toNamed(RoutesConstants.nonRcuFormDetailsScreen);
        break;
      default:
        print('Unknown service type');
    }
  }

  static void setServiceTypeToNavigate(ServiceType type) {
    currentService = type;
  }
}

class RouteItem {
  final String title;
  final String route;
  final ServiceType type;
  RouteItem({required this.title, required this.type ,required this.route  });
}

enum ServiceType {projectRequestForm , newTemplateRequestFrom, nonRcu}