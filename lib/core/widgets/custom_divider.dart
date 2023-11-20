import 'package:flutter/material.dart';

import '../rescourcs/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.black,
    );
  }
}
