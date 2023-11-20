import 'package:flutter/material.dart';
import '../../../../core/functions/global_function.dart';
import '../../../../core/widgets/custom_appBar.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../../core/widgets/custom_sized_box.dart';
import 'during_trip_map_view.dart';

import '../../../../core/rescourcs/app_colors.dart';
import '../../../../core/widgets/responsive_text.dart';

class DriverArriveToUserView extends StatelessWidget {
  const DriverArriveToUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E2B3C),
      appBar: customAppBar(context),
      body: InkWell(
        onTap: () => navigateTo(const DuringTripMapView()),
        child: Container(
          width: screenSize(context).width,
          height: screenSize(context).height,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color(0xff2AE5D7),
                Color(0xff1E2B3C),
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: screenSize(context).width * .15),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: CustomAssetsImage(
                        //width: screenSize(context).width * .3,
                        path: 'assets/Light On (1).png'),
                  ),
                ),
                const ResponsiveText(
                  text: 'لقد وصل السائق لك',
                  scaleFactor: .07,
                  color: AppColors.white,
                ),
                const CustomSizedBox(value: .04),
                CustomAssetsImage(path: 'assets/map marker.png'),
                CustomAssetsImage(path: 'assets/pngwing 11.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
