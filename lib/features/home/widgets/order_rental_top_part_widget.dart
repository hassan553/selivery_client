import 'package:flutter/material.dart';

import '../../../core/functions/global_function.dart';
import '../../../core/rescourcs/app_colors.dart';
import '../../../core/widgets/custom_image.dart';
import '../../../core/widgets/custom_sized_box.dart';
import '../../../core/widgets/responsive_text.dart';

Column topPartOrderOrRentalCarWidget(
    BuildContext context, List<dynamic> images) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ResponsiveText(
            text: 'جميع الماركات',
            scaleFactor: .05,
          ),
          const SizedBox(width: 10),
          CustomAssetsImage(path: 'assets/91YDvYuNrVL 1.png'),
        ],
      ),
      const CustomSizedBox(value: .02),
      Container(
        width: screenSize(context).width,
        height: screenSize(context).height * .06,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.primaryColor),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: CustomAssetsImage(
                path: images[0],
                boxFit: BoxFit.fill,
              ),
            ),
            const SizedBox(width: 3),
            Expanded(
              child: CustomAssetsImage(
                path: images[1],
                boxFit: BoxFit.fill,
              ),
            ),
            const SizedBox(width: 3),
            Expanded(
              child: CustomAssetsImage(
                path: images[2],
                boxFit: BoxFit.fill,
              ),
            ),
            const SizedBox(width: 3),
            Expanded(
              child: CustomAssetsImage(
                path: images[3],
                boxFit: BoxFit.fill,
              ),
            ),
            const SizedBox(width: 3),
            Expanded(
              child: CustomAssetsImage(
                path: images[4],
                boxFit: BoxFit.fill,
              ),
            ),
            const SizedBox(width: 3),
            Expanded(
              child: CustomAssetsImage(
                path: images[5],
                boxFit: BoxFit.fill,
              ),
            ),
            const SizedBox(width: 3),
            Expanded(
              child: CustomAssetsImage(
                path: images[6],
                boxFit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
