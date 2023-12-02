import 'package:flutter/material.dart';

import '../../../../core/rescourcs/app_colors.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../../core/widgets/responsive_text.dart';

class TopTitleWidget extends StatelessWidget {
  final String title1;
  final String title2;
  final String? image;
  final String? name;

  const TopTitleWidget(
      {super.key,
      required this.title1,
      required this.title2,
      this.name,
      this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FittedBox(
              child: Text(
                title1,
                style: const TextStyle(
                    color: AppColors.primaryColor, fontSize: 50),
              ),
            ),
            SizedBox(
              width: 150,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CustomNetworkImage(
                  imagePath: image ?? '',
                  boxFit: BoxFit.fill,
                ),
              ), // Replace with your image path
            ),
            FittedBox(
              child: Text(
                title2,
                style: const TextStyle(
                    color: AppColors.primaryColor, fontSize: 50),
              ),
            ),
          ],
        ),
        Text(
          name ?? '',
          style: const TextStyle(color: AppColors.primaryColor, fontSize: 30),
        ),
      ],
    );
  }
}
