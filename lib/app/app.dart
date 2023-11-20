import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selivery_client/binding.dart';

import '../core/rescourcs/app_theme.dart';
import '../features/splash/presentation/splash.dart';


class SeliveryClient extends StatelessWidget {
  const SeliveryClient({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MyBinding(),
      title: 'Selivery ',
      theme: appTheme(),
      textDirection: TextDirection.rtl,
      home:const  SplashView(),
    );
  } 
}

 