import 'package:get/get.dart';
import 'package:selivery_client/dataforcrud/mytrips.dart';

import '../core/class/statusrequst.dart';
import '../core/functions/handlingdata.dart';
import '../dataforcrud/models/mytrips.dart';
import '../dataforcrud/rating.dart';
import '../dataforcrud/starttrip.dart';

class MyTripsController extends GetxController{
  StatusRequest  statusRequest = StatusRequest.none;
  MyTripsData myTripsData =MyTripsData(Get.find());
  StartTripData startTripData =StartTripData(Get.find());
  RatingData ratingData = RatingData(Get.find());

  List<MyTripsModel> trips = [];

  myTrips()async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await myTripsData.getData();
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      print(response['trips']);
      List x =response['trips'];
      trips.addAll(x.map((e) => MyTripsModel.fromJson(e)));
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
      print("ok");
    }else{
      print("someerror for rate trips");
    }
    update();
  }

  @override
  void onInit() {
    myTrips();
    super.onInit();
  }
}