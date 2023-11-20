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
        LayoutBuilder(
          builder: (p0, p1) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FittedBox(
                  child: ResponsiveText(
                    text: title1,
                    scaleFactor: .25,
                    color: AppColors.primaryColor,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: CustomNetworkImage(
                    imagePath: image,
                    boxFit: BoxFit.fill,
                    width: 60,
                  ),
                ),
                FittedBox(
                  child: ResponsiveText(
                    text: title2,
                    scaleFactor: .25,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            );
          },
        ),
        ResponsiveText(
          text: name ?? 'hassan ',
          scaleFactor: .07,
          color: AppColors.primaryColor,
        ),
      ],
    );
  }
}
