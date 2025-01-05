import 'package:get/get.dart';
import 'package:untitled3/features/home/data/models/service.dart';

import '../../../../core/base_controller.dart';

class SearchResultController extends BaseController {



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

   List<ServiceSystem> filteredServices=[];
  searchServices(String searchQuery) {
    final serviceItems = fetchServiceItemsFromApi();
    filteredServices = serviceItems
        .where((ServiceSystem service) => service.title.toLowerCase().
    contains(searchQuery.toLowerCase()))
        .toList();
    update();
  }
  List<ServiceSystem> filteredSystems=[];
  searchSystems(String searchQuery) {
    final systemItems = fetchSystemItemsFromApi();
    filteredSystems = systemItems
        .where((ServiceSystem system) => system.title.toLowerCase().
    contains(searchQuery.toLowerCase()))
        .toList();
    update();
  }

  ServicesSystemsSearch(String searchQuery){
    searchServices(searchQuery);
    searchSystems(searchQuery);
    update();
  }
  @override
  void onInit() {
    super.onInit();
    final searchQuery = Get.arguments;
    ServicesSystemsSearch(searchQuery);
  }
}