import 'package:get/get.dart';
import '../dataforcrud/carwithoutdriver.dart';

import '../core/class/statusrequst.dart';
import '../core/functions/handlingdata.dart';

class CarWithOutDriverController extends GetxController{
  StatusRequest  statusRequest = StatusRequest.none;

  CarWithOutDriverData carWithoutDriverData = CarWithOutDriverData(Get.find());

  List carswithoutdriver = [];

  getcarswithoutdriver(id)async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await carWithoutDriverData.getData(id);
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      carswithoutdriver.addAll(response['vehicles']);
      print("categories rent $carswithoutdriver");
      print("okkkkkkk");
    }else{
      print("someerror");
    }
    update();
  }


}