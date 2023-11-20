import 'dart:convert';

import 'package:get/get.dart';
import '../dataforcrud/categorieslistforsale.dart';

import '../core/class/statusrequst.dart';
import '../core/functions/handlingdata.dart';
import '../models/carlistforsalemodel.dart';

class CategoriesListForSalesController extends GetxController{
  StatusRequest  statusRequest = StatusRequest.none;

  CategoriesListForSaleData categoriesListForSaleData = CategoriesListForSaleData(Get.find());
  List categories = [];
 //late carListModel  carlistmodel;
  getCategories(id)async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoriesListForSaleData.getData(id);
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      // List resopnsedata = response['vehicles'];
      // categories.addAll(resopnsedata.map((e) =>
      //     carListModel.fromJson(e as Map<String, dynamic>)));
      categories.addAll(response['vehicles']);
     // carlistmodel = carListModel.fromJson(response);
      print("categories sale $categories");
      print("ok for sale");
    }else{
      print("someerror");
    }
    update();
  }

}