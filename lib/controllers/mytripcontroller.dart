import 'package:get/get.dart';
import '../dataforcrud/mytrip.dart';
import '../dataforcrud/mytrips.dart';

import '../core/class/statusrequst.dart';
import '../core/functions/handlingdata.dart';
import '../dataforcrud/models/mytrips.dart';
import '../dataforcrud/rating.dart';
import '../dataforcrud/starttrip.dart';

class MyTripController extends GetxController{
  StatusRequest  statusRequest = StatusRequest.none;
  MyTripData myTripData =MyTripData(Get.find());
  StartTripData startTripData =StartTripData(Get.find());
  RatingData ratingData = RatingData(Get.find());

 late MyTripsModel myTripsModel;

  myTrip(id)async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await myTripData.getData(id);
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      print(response['trip']);
      myTripsModel= MyTripsModel.fromJson(response['trip']);
      update();
    }else{
      print("someerror for grt trips");
    }
    update();
  }

  startTrip(id)async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await startTripData.getData(id);
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      Get.defaultDialog(title: "هلا",
          middleText: "تم بدا الرحلة بنجاح");
      print("start");
    }else{
      print("someerror for start trips");
    }
    update();
  }

  rateTrip(tripid,rate)async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await ratingData.postData(tripid,rate);
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      Get.defaultDialog(title: "هلا",
          middleText: "تم تقييم السائق بنجاح");
    }else{
      print("someerror for rate trips");
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}