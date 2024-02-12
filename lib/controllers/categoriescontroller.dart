import 'package:get/get.dart';
import '../dataforcrud/categoriesdata.dart';

import '../core/class/statusrequst.dart';
import '../core/functions/handlingdata.dart';

class CategoriesController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  CategoriesData categoriesData = CategoriesData(Get.find());
  List categories = [];

  getCategories() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoriesData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      categories.addAll(response['categories']);
    } else {}
    update();
  }

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }
}
