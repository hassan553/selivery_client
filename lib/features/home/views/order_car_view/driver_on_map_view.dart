import 'package:flutter/material.dart';
import '../../../../core/functions/global_function.dart';
import '../../../../core/rescourcs/app_colors.dart';
import '../../../../core/widgets/custom_appBar.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../../core/widgets/responsive_text.dart';
import 'tracking_driver_view.dart';

class DriverOnMapView extends StatelessWidget {
  const DriverOnMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarForSearch(context),
      body: InkWell(
        onTap: () => navigateTo(const TrackingDriverView()),
        child: Column(
          children: [
            Container(
              width: screenSize(context).width,
              height: screenSize(context).height * .1,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color(0xff16B0A4),
                    AppColors.white,
                  ],
                ),
              ),
              child: Row(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomAssetsImage(path: 'assets/Light On.png'),
                        const Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: ResponsiveText(
                            text: 'المركبات المتاحة والقريبة لك',
                            scaleFactor: .05,
                          ),
                        ),
                      ]),
                  const SizedBox(width: 10),
                  CustomAssetsImage(path: 'assets/taxi car.png'),
                ],
              ),
            ),
            Expanded(
              child: CustomAssetsImage(
                path: 'assets/Screenshot 2023-08-07 052845.png',
                boxFit: BoxFit.fill,
              ),
            )
          ],
        ),
      ),
    );
  }
}
