import 'package:flutter/material.dart';

import '../../../../core/rescourcs/app_colors.dart';
import '../../../../core/widgets/custom_image.dart';

class GoogleSignWidget extends StatelessWidget {
  final void Function()? onTap;
  const GoogleSignWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
          color: AppColors.primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "تسجيل الدخوال بستخدام ",
                  style: TextStyle(color: AppColors.white),
                ),
                const SizedBox(width: 10),
                CustomAssetsImage(
                  path: 'assets/google.png',
                  width: 30,
                  height: 30,
                  boxFit: BoxFit.fill,
                ),
              ],
            ),
          )),
    );
  }
}
