import 'package:flutter/material.dart';
import '../../../../core/rescourcs/app_colors.dart';
import '../../../../core/widgets/custom_image.dart';

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
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title1,
              style:
                  const TextStyle(color: AppColors.primaryColor, fontSize: 50),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 100,
              height: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CustomNetworkImage(
                  imagePath: image,
                  boxFit: BoxFit.fill,
                ),
              ), // Replace with your image path
            ),
            const SizedBox(width: 8),
            Text(
              title2,
              style:
                  const TextStyle(color: AppColors.primaryColor, fontSize: 50),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          name ?? '',
          style: const TextStyle(color: AppColors.primaryColor, fontSize: 30),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
