import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../core/class/statusrequst.dart';
import '../features/home/views/order_car_view/toSet_location_view.dart';

class SetLocationController extends GetxController{

  StatusRequest statusRequest =StatusRequest.loading;
  Position? position;
  Completer<GoogleMapController>? completercontroller ;
  CameraPosition? kGooglePlex ;

  List<Marker> markers = [];
  double ? lat;
  double ? long;

  addMarkers(LatLng latLng){
    markers.clear();
    markers.add(Marker(markerId: MarkerId("1"),position:latLng));
    lat=latLng.latitude;
    long=latLng.longitude;
    update();
  }


  gotocompletedata(){
   // navigatorOff(context, screen);
    Get.offAll(ToSetLocation(),arguments: {
      "lat":lat.toString(),
      "long":long.toString() ,
    });
  }

  getCurrentLocation()async{
    position = await Geolocator.getCurrentPosition();
    kGooglePlex =  CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    addMarkers(LatLng(position!.latitude, position!.longitude));
    statusRequest=StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    getCurrentLocation();
    completercontroller = Completer<GoogleMapController>();
    super.onInit();
  }
}