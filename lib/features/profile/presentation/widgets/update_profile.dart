import 'package:flutter/material.dart';

import '../../../../core/rescourcs/app_colors.dart';

class UpdateProfile extends StatelessWidget {
  final void Function()? function;
  const UpdateProfile({super.key,this.function});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: function,
      height: 50,
      minWidth: 80,
      color: AppColors.primaryColor,
      child: const Text(
        'تعديل الملف الشخصي',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
