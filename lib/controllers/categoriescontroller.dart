import 'package:get/get.dart';
import '../dataforcrud/categoriesdata.dart';

import '../core/class/statusrequst.dart';
import '../core/functions/handlingdata.dart';

class CategoriesController extends GetxController{

  StatusRequest  statusRequest = StatusRequest.none;

  CategoriesData categoriesData = CategoriesData(Get.find());
  List categories = [];

  getCategories()async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoriesData.getData();
     statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      // if(response.Statuscode == 200){
      //   print("okkk");
      //  print(response);
      // }else{
      //   // Get.defaultDialog(title: "33".tr,
      //   //     middleText: "37".tr);
      //   print("error get categories");
      //   statusRequest = StatusRequest.failure;
      // }
      categories.addAll(response['categories']);
      print("categories $categories");
      print("okkkkkkk");
    }else{
      print("someerror");
    }
    update();
  }

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

}