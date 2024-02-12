import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../binding.dart';
import '../core/rescourcs/app_colors.dart';
import '../core/rescourcs/app_theme.dart';
import '../features/splash/presentation/splash.dart';


class SeliveryClient extends StatelessWidget {
  const SeliveryClient({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor
    ));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MyBinding(),
      title: 'Selivery',
      theme: appTheme(),
      textDirection: TextDirection.rtl,
      home: SplashView(),
    );
  }
}
