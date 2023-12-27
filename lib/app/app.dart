import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:selivery_client/binding.dart';
import 'package:selivery_client/core/rescourcs/app_colors.dart';
import 'package:selivery_client/features/home/views/main_view.dart';
import '../core/functions/google_sign.dart';
import '../core/functions/ratingdriver.dart';
import '../core/rescourcs/app_theme.dart';
import '../features/splash/presentation/splash.dart';
import 'package:selivery_client/models/message_model.dart';
import 'package:selivery_client/controllers/chat_controller.dart';

class SeliveryClient extends StatelessWidget {
  const SeliveryClient({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor, // Replace with your desired color
    ));

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MyBinding(),
      title: 'Selivery',
      theme: appTheme(),
      textDirection: TextDirection.rtl,
      home:  MainView(),
    );
  }
}
