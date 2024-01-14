import 'package:get/get.dart';

import '../core/class/statusrequst.dart';
import '../core/functions/handlingdata.dart';
import '../dataforcrud/carwithdriver.dart';

class CarWithDriverController extends GetxController{
  StatusRequest  statusRequest = StatusRequest.none;

  CarWithDriverData carWithDriverData = CarWithDriverData(Get.find());

List carswithdriver = [];

  getcarswithdriver(id)async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await carWithDriverData.getData(id);
    statusRequest = handlingData(response);
    print(response);
    if(StatusRequest.success == statusRequest){
   carswithdriver.addAll(response['vehicles']);
      print("categories rent $carswithdriver");
      print("okkkkkkk");
    }else{
      print("someerror");
    }
    update();
  }


}