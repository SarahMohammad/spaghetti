import 'package:get/get.dart';
import 'app_enums.dart';

class BaseController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    initialValues();
  }

  RxBool networkServiceLoading = false.obs;
//App State
  AppState _loadingState = AppState.done;

  set updateState(AppState state) {
    _loadingState = state;
    update();
  }

  AppState get loadingState => _loadingState;

  //Pagination
  bool morePages = false;
  RxBool callingApi = false.obs;
  int maxPage = 0;
  int pageId = 0;
  resetPageId() {
    pageId = 0;
  }

  initialValues() {
    morePages = false;
    callingApi.value = false;
    maxPage = 0;
    pageId = 0;
  }

  setMaxPageId({required int totalSize, required int pageSize}) {
    maxPage = (totalSize / pageSize).ceil();
    if (pageId < maxPage - 1 && maxPage != 1) {
      morePages = true;
    } else {
      morePages = false;
    }
    update();
  }

  Future<void> paginate() async {
    callingApi.value = true;
    pageId++;
    await nextPage();
    callingApi.value = false;
    update();
  }

  Future<void> nextPage() async {}
}
