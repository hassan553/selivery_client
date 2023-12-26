import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../controllers/setlocation.dart';

class SetLaunchLocation extends StatelessWidget {
  const SetLaunchLocation({super.key});

  @override
  Widget build(BuildContext context) {
//    SetLocationController addAddressController =
    Get.lazyPut(()=>SetLocationController(),fenix: true);
    return GetBuilder<
        SetLocationController>(
      builder:(controller) =>  Scaffold(
          appBar: AppBar(
            title:const  Text("حدد مكان الاقلاع",
              style: TextStyle(color: Colors.black,
                fontWeight: FontWeight.bold),),
            centerTitle: true,
            backgroundColor: Colors.tealAccent,
          ),
        body: GetBuilder<SetLocationController>(builder:
            (controller)=>
                Container(
                  child: Column(
                    children: [
                      if(controller.kGooglePlex!=null)
                        Expanded(child:
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            GoogleMap(
                              markers: controller.markers.toSet(),
                              onTap: (latlong){
                                controller.addMarkers(latlong);
                                print(latlong);
      
                              },
                              mapType: MapType.normal,
                              initialCameraPosition: controller.kGooglePlex!,
                              onMapCreated: (GoogleMapController mapcontroller) {
                                controller.completercontroller!.complete(mapcontroller);
                              },
                            ),
      
      
                          ],
                        ) ),
                    ],
                  ),
                ),),
      ),
    );
  }
}
