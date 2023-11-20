import 'package:flutter/material.dart';
import 'package:selivery_client/features/auth/presentation/view/login_view.dart';
import '../../../core/functions/global_function.dart';
import '../../../core/rescourcs/app_colors.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void splashNavTimer() {
    Future.delayed(const Duration(seconds: 2), () {
      navigateOff(const ClientLoginView());
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
      body: splashBody(),
    );
  }

  Center splashBody() {
    return Center(
      child: Image.asset(
        'assets/logo.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
