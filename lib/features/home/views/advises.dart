import 'package:flutter/material.dart';
import '../../../core/rescourcs/app_colors.dart';

import '../../../core/functions/global_function.dart';
import 'order_car_view/category_get_location_from_user_view.dart';

class AdvisesScreen extends StatefulWidget {
  const AdvisesScreen({super.key});

  @override
  State<AdvisesScreen> createState() => _AdvisesScreenState();
}

class _AdvisesScreenState extends State<AdvisesScreen> {

  void splashNavTimer() {
    Future.delayed(const Duration(seconds: 5), () {
      navigateOff(const GetLocationFromUserView());
    });
  }

  @override
  void initState() {
    splashNavTimer();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: Text("إرشادات",style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
        leading: Container(),
        backgroundColor: AppColors.primaryColor,
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("1: تعرف على السائق من خلال صفحتة الشخصية",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),),
            Divider(),
            Text("2: انظر الي تقييم السائق وعدد الرحالات التي قام بها",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),),
            Divider(),
            Text("3: لا تنسى تقييم السائق ورأيك به ",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),),
            Divider(),
            Text("4: في حالة وجود اى مشكلة يمكنك التواصل معنا",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),),
          ],
        ),
      ),
    );

  }
}
