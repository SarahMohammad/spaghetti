import 'package:untitled3/features/home/data/models/service.dart';

import '../../../../core/base_controller.dart';

class ServicesSystemsSearchController extends BaseController {
  List<ServiceSystem> serviceList=[];
  List<ServiceSystem> systemsList=[];

  loadSystems() {
    final systems = fetchSystemItemsFromApi();
    systemsList.addAll(systems);
  }

  fetchSystemItemsFromApi() {
    return [
      ServiceSystem(
        isFavorite: false,
        title: "SAP Ariba1",
        description: "Lorem ipsum dolor sit amet consectetur. Ridiculus orci gravida adipiscing venenatis accumsan enim.",
      ),
      ServiceSystem(
        isFavorite: false,
        title: "SAP Ariba2",
        description: "Lorem ipsum dolor sit amet consectetur. Ridiculus orci gravida adipiscing venenatis accumsan enim.",
      ),
      ServiceSystem(
        isFavorite: false,
        title: "SAP Ariba3",
        description: "Lorem ipsum dolor sit amet consectetur. Ridiculus orci gravida adipiscing venenatis accumsan enim.",
      ),
      ServiceSystem(
        isFavorite: false,
        title: "SAP Ariba4",
        description: "Lorem ipsum dolor sit amet consectetur. Ridiculus orci gravida adipiscing venenatis accumsan enim.",
      ),
    ];
  }

  loadServices() {
    final serviceItems = fetchServiceItemsFromApi();
    serviceList.addAll(serviceItems);
  }

  fetchServiceItemsFromApi() {
    return [
      ServiceSystem(
        isFavorite: false,
        title: "Customs Clearance Permit Request",
        description: "Process your customs clearance permits.",
      ),
      ServiceSystem(
        isFavorite: false,
        title: "Organizational Structure Change",
        description: "Request changes to your organizational structure.",
      ),
      ServiceSystem(
        isFavorite: false,
        title: "Ask Human Capital",
        description: "Get assistance with HR-related matters.",
      ),
      ServiceSystem(
        isFavorite: false,
        title: "Performance Change",
        description: "Request a performance change review.",
      ),
    ];
  }

  @override
  void onInit() {
    super.onInit();
    loadSystems();
    loadServices();
  }
}