import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:selivery_client/features/home/views/chats.dart';

import '../../../controllers/tracking.dart';
import '../../../core/functions/global_function.dart';

class Tracking extends StatelessWidget {
  const Tracking({super.key});

  @override
  Widget build(BuildContext context) {
    TrackingController trackingController=  Get.put(TrackingController());
    return Scaffold(
      appBar: AppBar(
        title: Text("تتبع مسار السائق",style: TextStyle(color: Colors.black,
            fontWeight: FontWeight.bold),),
        backgroundColor: Colors.tealAccent,
        actions: [
          Row(
            children: [
              IconButton(onPressed: (){
                navigateTo(ChatScreen(driverid:trackingController.driverId!));
              },
                  icon: Icon(Icons.chat_bubble,
                    color: Colors.amberAccent,)),
              Text("دردشة مع السائق")
            ],
          ),
        ],
      ),
      body: GetBuilder<TrackingController>(builder:
          (controller)=>
          Container(
            child: Column(
              children: [
                if(trackingController.kGooglePlex!=null)
                  Expanded(child:
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      GetBuilder<TrackingController>(builder:
                          (controller)=>GoogleMap(
                        markers: controller.markers.toSet(),
                        mapType: MapType.normal,
                        initialCameraPosition: controller.kGooglePlex!,
                        onMapCreated: (GoogleMapController mapcontroller) {
                          controller.completercontroller!.complete(mapcontroller);
                        },
                      ),),

                    ],
                  ) ),
              ],
            ),
          ),),
    );
  }
}
