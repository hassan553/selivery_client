import 'package:get/get.dart';
import '../dataforcrud/models/mytipsmodels.dart';
import '../dataforcrud/mytrips.dart';

import '../core/class/statusrequst.dart';
import '../core/functions/handlingdata.dart';
import '../dataforcrud/rating.dart';
import '../dataforcrud/starttrip.dart';

class MyTripsController extends GetxController{
  StatusRequest  statusRequest = StatusRequest.none;
  MyTripsData myTripsData =MyTripsData(Get.find());
  StartTripData startTripData =StartTripData(Get.find());
  RatingData ratingData = RatingData(Get.find());

  List<MyTripsModels> trips = [];

  myTrips()async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await myTripsData.getData();
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      List x =response['trips'];
      trips.addAll(x.map((e) => MyTripsModels.fromJson(e)));
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
    myTrips();
    super.onInit();
  }
}