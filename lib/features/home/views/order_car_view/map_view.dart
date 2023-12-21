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
<<<<<<< HEAD
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
=======
      appBar: customAppBarForSearch(context),
      body: Stack(
        children: [
          CustomAssetsImage(
            path: 'assets/unnamed 1.png',
            width: screenSize(context).width,
            height: screenSize(context).height,
            boxFit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: screenSize(context).width,
              padding: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.3),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () => navigateTo(const DriverOnMapView()),
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.white,
                      child: CircleAvatar(
                        radius: 27,
                        backgroundColor: Colors.green,
                        child: ResponsiveText(
                          text: 'تنفيذ',
                          scaleFactor: .05,
                          color: AppColors.white,
                        ),
>>>>>>> e75399400b10bf81a5d06800a8e1111972736177
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
