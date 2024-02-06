import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
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

  //List<Marker> markers = [];
  late GoogleMapController mapController;
  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = "AIzaSyAS3BGUrmQusXe0pctVL6VALzlJHlIBD1o";


  IO.Socket ? socket;
  Map<String,dynamic> options ={
    "transports":['websocket'],
    "autoConnect":false,
  };
double ? lat;
double ? lon;
String ? driverId;
  initalSocket(id,pick1,pick2){
    socket =IO.io("https://www.selivery-app.com/",options);
    socket!.connect();
    socket!.onConnect((_) => print("connect with server"));
    //with room
    // Emit the 'joinRoom' event to the server with the driver to track's ID
    socket!.emit('joinRoom', id);
    // Optionally, you can handle the server's response if needed
    socket!.on('joinedRoom', (data) {
      print('Joined room for tracking driver: $data');
    });
    socket!.on("driver_location_update", (data) {
      // Handle the driver location update here
      if (data is Map<String, dynamic>) {
         driverId = data['driverId'];
        Map<String, dynamic> location = data['location'];
        lat = data['location']['latitude'];
        lon = data['location']['longitude'];
        if (lat != null && lon != null) {
          //addMarkers(LatLng(lat!, lon!));
          _addMarker(LatLng(pick1, pick2), "origin",
              BitmapDescriptor.defaultMarker);

          /// destination marker
          _addMarker(LatLng(lat!,lon!), "destination",
              BitmapDescriptor.defaultMarkerWithHue(80));
          _getPolyline(pick1,pick2);
          //update();
        }
        // Update the UI or perform any other actions based on the received data
        print("Received driver location update: $id - $location");
      }
    });



  }
  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
    Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }
  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: Colors.red,
        width:5,points: polylineCoordinates);
    polylines[id] = polyline;
    update();
  }

  _getPolyline(pick1,pick2) async {
    PolylineResult result = await polylinePoints.
    getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(pick1, pick2),
      PointLatLng(lat!,lon!),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    _addPolyLine();
  }
  void onMapCreated(GoogleMapController controller) async {
    mapController = controller;
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

  // addMarkers(LatLng latLng){
  //   print('Adding markers: $latLng');
  //   markers.clear();
  //   markers.add(Marker(markerId: MarkerId("1"),position:latLng));
  //   update();
  // }

  @override
  void onInit() {
    //initalSocket();
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