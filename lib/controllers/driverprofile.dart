import 'package:get/get.dart';
import 'package:selivery_client/core/class/statusrequst.dart';
import 'package:selivery_client/dataforcrud/getdriverprofile.dart';

import '../core/functions/handlingdata.dart';

class DriverProfileController extends GetxController{
StatusRequest statusRequest =StatusRequest.none;

DriverProfileData driverProfileData = DriverProfileData(Get.find());

getDriver(id)async{
  statusRequest = StatusRequest.loading;
  update();
  var response = await driverProfileData.getData(id);
  statusRequest = handlingData(response);
  if(StatusRequest.success == statusRequest){

  }else{
    print("someerror for get profile");
  }
  update();
}


}