import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../core/class/statusrequst.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../core/services/cache_storage_services.dart';

class TrackingController extends GetxController{
  StatusRequest statusRequest = StatusRequest.loading;
  Position? position;
  Completer<GoogleMapController>? completercontroller ;
  CameraPosition? kGooglePlex ;

  List<Marker> markers = [];
  IO.Socket ? socket;
  Map<String,dynamic> options ={
    "transports":['websocket'],
    "autoConnect":false,
  };
double ? lat;
double ? lon;
String ? driverId;
  initalSocket(){
    socket =IO.io("http://192.168.1.5:8000",options);
    socket!.connect();
    socket!.onConnect((_) => print("connect with server"));
    socket!.on("driver_location_update", (data) {
      // Handle the driver location update here
      if (data is Map<String, dynamic>) {
         driverId = data['driverId'];
        Map<String, dynamic> location = data['location'];
        lat = data['location']['latitude'];
        lon = data['location']['longitude'];
        if (lat != null && lon != null) {
          addMarkers(LatLng(lat!, lon!));
          //update();
        }
        // Update the UI or perform any other actions based on the received data
        print("Received driver location update: $driverId - $location");
      }
    });


    //with room
    // Emit the 'joinRoom' event to the server with the driver to track's ID
    socket!.emit('joinRoom', driverId);
    // Optionally, you can handle the server's response if needed
    socket!.on('joinedRoom', (data) {
      print('Joined room for tracking driver: $data');
    });
  }


  getCurrentLocation()async{
    position = await Geolocator.getCurrentPosition();
    kGooglePlex =  CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    //addMarkers(LatLng(position!.latitude, position!.longitude));
    //addMarkers(LatLng(lat!, lon!));
    // if (lat != null && lon != null) {
    //   addMarkers(LatLng(lat!, lon!));
    //   print('Markers: $markers');
    //   update();
    // }
    statusRequest=StatusRequest.none;
    update();
  }

  addMarkers(LatLng latLng){
    print('Adding markers: $latLng');
    markers.clear();
    markers.add(Marker(markerId: MarkerId("1"),position:latLng));
    update();
  }

  @override
  void onInit() {
    initalSocket();
    getCurrentLocation();
    completercontroller = Completer<GoogleMapController>();
    super.onInit();
  }
@override
  void dispose() {
   socket!.close();
    super.dispose();
  }
}