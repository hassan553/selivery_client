import 'package:flutter/material.dart';

import '../../../../core/functions/global_function.dart';
import '../../../../core/rescourcs/app_colors.dart';
import '../../../../core/widgets/custom_appBar.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../../core/widgets/responsive_text.dart';
import 'evaulte_driver_view.dart';

class DuringTripMapView extends StatelessWidget {
  const DuringTripMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: customAppBar(context),
      body: InkWell(
        onTap: () => navigateTo(const EvaluateDriverView()),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomAssetsImage(
              path: 'assets/WhatsApp Image 2023-08-07 at 1 1.png',
              width: screenSize(context).width,
              height: screenSize(context).height,
              boxFit: BoxFit.fill,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              width: screenSize(context).width,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor, //Color(0xff014842),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: screenSize(context).width * .06,
                    backgroundColor: AppColors.white,
                    child: Icon(
                      Icons.close,
                      color: AppColors.black.withOpacity(.7),
                    ),
                  ),
                  const Spacer(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      ResponsiveText(
                        text: '7 دقائق',
                        scaleFactor: .05,
                        color: AppColors.white,
                      ),
                      ResponsiveText(
                        text: '2 كيلو متر',
                        scaleFactor: .05,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomAssetsImage(
                    path: 'assets/Compass.png',
                    width: screenSize(context).width * .15,
                    boxFit: BoxFit.fill,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
