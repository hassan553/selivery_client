import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selivery_client/core/class/statusrequst.dart';
import 'package:selivery_client/core/functions/global_function.dart';
import 'package:selivery_client/features/home/views/tracking.dart';

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
                if(controller.trips[index].status=="requested"){
                  return Center(
                    child: const Text("رحلتك في انتظار موافقة السائق",style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),),
                  );
                }else if(controller.trips[index].status=="accepted"){
                  return InkWell(
                    onTap: (){
                      //go to tracking
                       navigateTo( Tracking(
                         id: controller.trips[index].driver!,
                       ));
                    },
                      child: Text("تم الموافقة علي الرحلة والسائق في الطريق اليك ",style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                      ),));
                }
                else if(controller.trips[index].status=="arrived"){
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
                          trips[index].sId);
                        },child: const Text("بدا الرحلة",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),),),
                    ],
                  );
                }else if (controller.trips[index].status=="started"){
                  return Center(
                    child: Text(" تطبيق selivery يتمني ليك رحلة سعيدة",style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                    ),),
                  );

                }else if(controller.trips[index].status=="ended"){
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
                          RatingScreen(id:controller.trips[index].sId.toString());
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
              },
              separatorBuilder: (context,index)=>Container(),
              itemCount: controller.trips.length);
        }
      },),
    );
  }
}
