import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../rescourcs/app_colors.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final plateForm = Theme.of(context).platform;
    return Center(
      child: plateForm == TargetPlatform.android
          ? CircularProgressIndicator(color: AppColors.primaryColor)
          : CupertinoActivityIndicator(color: AppColors.primaryColor),
    );
  }
}
