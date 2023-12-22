import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../rescourcs/app_colors.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;

    return Center(
      child: platform == TargetPlatform.iOS
          ? const CircularProgressIndicator(color: AppColors.primaryColor)
          : const CupertinoActivityIndicator(
              color: AppColors.primaryColor,
            ),
    );
  }
}
