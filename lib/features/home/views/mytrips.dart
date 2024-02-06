import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selivery_client/features/home/views/mytrip.dart';
import '../../../core/class/statusrequst.dart';
import '../../../core/functions/global_function.dart';
import 'tracking.dart';

import '../../../controllers/mytrips.dart';
import '../../../core/functions/ratingdailog.dart';
import '../../../core/functions/ratingdriver.dart';
import '../../../core/rescourcs/app_colors.dart';

class MyTrips extends StatelessWidget {
  const MyTrips({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(MyTripsController());

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
      body: GetBuilder<MyTripsController>(builder: (controller){
        if(controller.statusRequest==StatusRequest.loading){
          return Center(
            child: const CircularProgressIndicator(
              color: Colors.green,
            ),
          );
        }
        else if(controller.trips.isEmpty){
          return Center(
            child: Text("لا يوجد رحالات لديك قم الان بعمل رحلة واستمتع بسرعة التوصيل",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white
            ),),
          );
        }
        else{
          return ListView.separated(
              itemBuilder: (context,index){
                //print(controller.trips[index].sId!);
                return InkWell(
                  onTap: (){
                    navigateTo(MyTrip(id: controller.trips[index].sId!,));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Text("تتبع تفاصيل الرحلة",style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                    ),),
                  ),
                );
              },
              separatorBuilder: (context,index)=>Container(),
              itemCount: controller.trips.length);
        }
      },),
    );
  }
}
