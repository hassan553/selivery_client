import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'setlocation.dart';
import 'setlocationgoto.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_common/src/util/event_emitter.dart';

import '../core/class/statusrequst.dart';
import '../core/functions/global_function.dart';
import '../core/functions/handlingdata.dart';
import 'package:dio/dio.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../dataforcrud/models/drivermodel.dart';
import '../dataforcrud/nearestdrivers.dart';
import '../dataforcrud/requesttrip.dart';
import '../features/home/views/driverprofile.dart';

class SetLocationWithDriverController extends GetxController {
  late SharedPreferences sharedPreferences;

  RequestTripData requestTripData = RequestTripData(Get.find());

  NearestDriversData nearestDriversData = NearestDriversData(Get.find());
  // SetLocationController setLocationController = Get.find();
  SetLocationGoToController setLocationGoToController = Get.find();
  StatusRequest statusRequest = StatusRequest.loading;
  SetLocationController setLocationController = Get.find();
  double? lat;
  double? long;
  //IO.Socket ? socket;

  //Position? position;
  Completer<GoogleMapController>? completercontroller;
  CameraPosition? kGooglePlex;
  //new code
  //List<Map<String, dynamic>> driversLocations = [];

  List<Marker> markers = [];

  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(Marker(
        markerId: const MarkerId("1"),
        position: latLng,
        infoWindow: InfoWindow(
            title: 'driver Name',
            snippet: drivername,
            onTap: () {
              navigateTo(DriverProfile(
                name: drivername!,
                image: driverimage!,
              ));
            })));
  }

  Map<String, dynamic>? locations;
  Map<String, dynamic>? locations2;

  String? drivername;
  String? driverid;
  String? driverimage;
  String? driverimagecar;
  String? drivercarmodel;
  getdrivers() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await nearestDriversData.postData(
      setLocationController.lat,
      setLocationController.long,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      List drivers = response['drivers'];
      // driversLocations = List.from(response['drivers']);
      // for (var driverLocation in driversLocations) {
      //   addMarkers(LatLng(
      //     driverLocation['location']['latitude'],
      //     driverLocation['location']['longitude'],
      //   ));
      // }
      if (drivers.isEmpty) {
        return Get.defaultDialog(
            title: 'تنيه', middleText: 'لا يوجد سائق متاحين الان');
      }
      print(response['drivers'][0]['location']['latitude']);
      drivername = response['drivers'][0]['driver']['name'];
      driverid = response['drivers'][0]['driver']['_id'];
      driverimage = response['drivers'][0]['driver']['image'];
      print(driverimagecar);
      print(drivercarmodel);
      print("okkkkk");
    } else {
      print("error driver");
      // print(response.statuscode);
      statusRequest = StatusRequest.failure;
    }
    addMarkers(LatLng(response['drivers'][0]['location']['latitude'],
        response['drivers'][0]['location']['longitude']));
    update();
  }

  getCurrentLocation() async {
    // position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(setLocationController.lat!, setLocationController.long!),
      zoom: 14.4746,
    );
    //addMarkers(LatLng(setLocationController.lat!,setLocationController.long!));
    statusRequest = StatusRequest.none;
    update();
  }

  requestTripDriver() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await requestTripData.postData(
        driverid,
        setLocationController.lat,
        setLocationController.long,
        setLocationGoToController.lat2,
        setLocationGoToController.long2);
    statusRequest = handlingData(response);
    if(setLocationController.lat ==null || setLocationController.long== null
        || setLocationGoToController.lat2==null || setLocationGoToController.long2==null){
      return Get.defaultDialog(
          title: 'تنيه', middleText: 'من فضلك حدد مكان الذهاب ومكان الاقلاع');
    }
    if (StatusRequest.success == statusRequest) {
      print(response);
      print("success trip");
    } else {
      print("error to trip");
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() async {
    getCurrentLocation();
    completercontroller = Completer<GoogleMapController>();
    sharedPreferences = await SharedPreferences.getInstance();
    if(setLocationController.lat ==null || setLocationController.long== null
        || setLocationGoToController.lat2==null || setLocationGoToController.long2==null){
      return Get.defaultDialog(
          title: 'تنيه', middleText: 'من فضلك حدد مكان الذهاب ومكان الاقلاع');
    }
    getdrivers();
    print("clint lat ${setLocationController.lat}");
    print("clint lat ${setLocationController.lat}");
    print("clint long ${setLocationController.long}");
    // print("clint long ${position!.longitude}");
    //initalSocket();
    super.onInit();
  }
}
