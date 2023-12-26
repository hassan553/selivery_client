import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../controllers/setlocationgoto.dart';

class SetLaunchLocationGoTo extends StatelessWidget {
  const SetLaunchLocationGoTo({super.key});

  @override
  Widget build(BuildContext context) {
   // SetLocationGoToController addAddressController =
    Get.lazyPut(()=>SetLocationGoToController());
    return GetBuilder<
        SetLocationGoToController>(
      builder:(addAddressController) =>  Scaffold(
        appBar: AppBar(
          title:const  Text("حدد مكان الذهاب",style: TextStyle(color: Colors.black,
          fontWeight: FontWeight.bold),),
          centerTitle: true,
          backgroundColor: Colors.tealAccent,
        ),
        body: GetBuilder<SetLocationGoToController>(builder:
            (controller)=>
            Container(
              child: Column(
                children: [
                  if(addAddressController.kGooglePlex!=null)
                    Expanded(child:
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        GoogleMap(
                          markers: addAddressController.markers.toSet(),
                          onTap: (latlong){
                            addAddressController.addMarkers(latlong);
                            print(latlong);
      
                          },
                          mapType: MapType.normal,
                          initialCameraPosition: addAddressController.kGooglePlex!,
                          onMapCreated: (GoogleMapController mapcontroller) {
                            addAddressController.completercontroller!.complete(mapcontroller);
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
