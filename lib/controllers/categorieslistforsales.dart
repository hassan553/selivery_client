
import 'package:get/get.dart';
import '../dataforcrud/categorieslistforsale.dart';

import '../core/class/statusrequst.dart';
import '../core/functions/handlingdata.dart';

class CategoriesListForSalesController extends GetxController{
  StatusRequest  statusRequest = StatusRequest.none;

  CategoriesListForSaleData categoriesListForSaleData = CategoriesListForSaleData(Get.find());
  List categories = [];
 
  getCategories(id)async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoriesListForSaleData.getData(id);
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
     
      categories.addAll(response['vehicles']);
    
    }else{
    
    }
    update();
  }

}