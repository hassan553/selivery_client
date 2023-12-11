import 'package:flutter/material.dart';
import '../../../../core/functions/global_function.dart';
import '../../../../core/rescourcs/app_colors.dart';
import '../../../../core/widgets/custom_appBar.dart';
import '../../../../core/widgets/custom_image.dart';
import 'driver_on_map_view.dart';

import '../../../../core/widgets/responsive_text.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarForSearch(context),
      body: Stack(
        children: [
          CustomAssetsImage(
            path: 'assets/unnamed 1.png',
            width: screenSize(context).width,
            height: screenSize(context).height,
            boxFit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: screenSize(context).width,
              padding: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.3),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () => navigateTo(const DriverOnMapView()),
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.white,
                      child: CircleAvatar(
                        radius: 27,
                        backgroundColor: Colors.green,
                        child: ResponsiveText(
                          text: 'تنفيذ',
                          scaleFactor: .05,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => pop(),
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.white,
                      child: CircleAvatar(
                        radius: 27,
                        backgroundColor: Colors.red,
                        child: ResponsiveText(
                          text: 'إلغاء',
                          scaleFactor: .05,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
