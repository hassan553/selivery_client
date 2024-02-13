import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selivery_client/features/home/views/trackingwithoutdestionation.dart';
import '../../../controllers/mytripcontroller.dart';
import '../../../core/class/statusrequst.dart';
import '../../../core/functions/global_function.dart';
import 'tracking.dart';
import '../../../core/functions/ratingdriver.dart';
import '../../../core/rescourcs/app_colors.dart';

class MyTrip extends StatelessWidget {
  final String id;
  const MyTrip({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    Get.put(MyTripController()..myTrip(id));
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: Text("رحالاتي",style: TextStyle(
            color: Colors.white,
            fontSize: 30
        ),),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: GetBuilder<MyTripController>(builder: (controller){
        if(controller.statusRequest==StatusRequest.loading){
          return Center(
            child: const CircularProgressIndicator(
              color: Colors.green,
            ),
          );
        } else if(controller.myTripsModel.status=="requested"){
          return Center(
            child: const Text("رحلتك في انتظار موافقة السائق",style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold
            ),),
          );
        }else if(controller.myTripsModel.status=="accepted"){
          return InkWell(
              onTap: (){
                if(controller.myTripsModel.destinationLocation==null){
                  //go to tracking withoutdestionation
                  navigateTo(TrackingWithoutDestinatnation(
                    pick1: controller.myTripsModel.pickupLocation!.coordinates!
                        .first,
                    pick2: controller.myTripsModel.pickupLocation!.coordinates!
                        .last,
                    devicetoken: controller.myTripsModel.driver!.deviceToken!,
                    id: controller.myTripsModel.driver!.sId!,
                  ));
                }else {
                  //go to tracking
                  navigateTo(Tracking(
                    pick1: controller.myTripsModel.pickupLocation!.coordinates!
                        .first,
                    pick2: controller.myTripsModel.pickupLocation!.coordinates!
                        .last,
                    des1: controller.myTripsModel.destinationLocation!
                        .coordinates!.first,
                    des2: controller.myTripsModel.destinationLocation!
                        .coordinates!.first,
                    devicetoken: controller.myTripsModel.driver!.deviceToken!,
                    id: controller.myTripsModel.driver!.sId!,
                  ));
                }
              },
              child: Text("تم الموافقة علي الرحلة والسائق في الطريق اليك ",style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
              ),));
        }
        else if(controller.myTripsModel.status=="arrived"){
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("لقد وصل السائق لك ",style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
              ),),
              //client make trip started
              MaterialButton(
                color: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),

                ),
                onPressed: ()async{
                  await controller.startTrip(controller.
                  myTripsModel.sId!);
                },child: const Text("بدا الرحلة",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),),),
            ],
          );
        }else if (controller.myTripsModel.status=="started"){
          return Center(
            child: Text(" تطبيق selivery يتمني ليك رحلة سعيدة",style: TextStyle(
                fontSize: 20,
                color: Colors.white
            ),),
          );

        }else if(controller.myTripsModel.status=="ended"){
          //client rate driver
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("تم الانتهاء من الرحلة",style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
              ),),
              MaterialButton(
                color: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),

                ),
                onPressed: (){
                  navigateTo(RatingScreen(id:controller.myTripsModel.
                  sId!.toString()));
                  // controller.acceptTrip(id);
                },child: const Text("تقييم السائق",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),),),
            ],
          );
        }else{
          return Center(
            child: Text(" تم الانتهاء من الرحلة بنجاح",style: TextStyle(
                fontSize: 20,
                color: Colors.white
            ),),
          );
        }
      },),
    );
  }
}
