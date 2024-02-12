import 'package:get/get.dart';
import '../dataforcrud/mytrip.dart';

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
      myTripsModel= MyTripsModel.fromJson(response['trip']);
      update();
    }else{
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
    }else{
    }
    update();
  }

  rateTrip(tripid,rate)async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await ratingData.postData(tripid,rate);
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
    }else{
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}