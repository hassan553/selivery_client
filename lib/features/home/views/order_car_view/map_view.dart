import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:selivery_client/core/functions/global_function.dart';
import 'package:selivery_client/features/home/views/driverprofile.dart';
import '../../../../controllers/setlocation.dart';
import '../../../../controllers/setlocationgoto.dart';
import '../../../../controllers/setlocationwithdriver.dart';
import '../../../../core/widgets/custom_appBar.dart';
import '../../../../core/widgets/responsive_text.dart';

class MapScreen extends StatelessWidget {

  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SetLocationWithDriverController controllerDriver =
    Get.put(SetLocationWithDriverController());
    SetLocationController setLocationController =
    Get.put(SetLocationController());
    SetLocationGoToController setLocationGoToController =
    Get.put(SetLocationGoToController());
    return Scaffold(
      appBar: customAppBar(context),
      body: GetBuilder<SetLocationWithDriverController>(builder:
          (controller)=>
          Container(
            child: Column(
              children: [
                if(controllerDriver.kGooglePlex!=null)
                  Expanded(child:
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      GoogleMap(
                        markers: controllerDriver.markers.toSet(),
                        onTap: (latlong){
                          controllerDriver.addMarkers(latlong);
                        },
                        mapType: MapType.normal,
                        initialCameraPosition: controllerDriver.kGooglePlex!,
                        onMapCreated: (GoogleMapController mapcontroller) {
                          controllerDriver.completercontroller!.complete(mapcontroller);
                        },
                      ),
                      (setLocationController.lat != null &&
                          setLocationController.long !=null
                          && setLocationGoToController.lat2 !=null
                          && setLocationGoToController.long2 != null) ?
                      Positioned(
                        child: Container(),
                      )
                          : Container(
                        child: const Center(child:
                        Text("Please choose your location",style: TextStyle(
                            color: Colors.black,fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),)),
                      ),
                    ],
                  ) ),
                Container(
                  height: 40,
                  width: 60,
                  color: Colors.orange,
                  child: MaterialButton(
                    onPressed: (){
                       controller.requestTripDriver();
                      print("gggg");
                    },
                    child: Text("طلب"),
                  ),),
              ],
            ),
          )),
    );
  }
}
