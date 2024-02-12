import 'package:flutter/material.dart';
import 'driver_arrive_to_user.dart';

import '../../../../core/functions/global_function.dart';
import '../../../../core/rescourcs/app_colors.dart';
import '../../../../core/widgets/custom_appBar.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../../core/widgets/responsive_text.dart';

class TrackingDriverView extends StatelessWidget {
  const TrackingDriverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: customAppBar(context),
      body: InkWell(
        onTap: () => navigateTo(const DriverArriveToUserView()),
        child: Stack(
          children: [
            CustomAssetsImage(
              path: 'assets/Screenshot 2023-08-09 051528.png',
              width: screenSize(context).width,
              height: screenSize(context).height,
              boxFit: BoxFit.fill,
            ),
            Positioned(
              top: 0,
              child: Container(
                width: screenSize(context).width,
                height: screenSize(context).height * .1,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: CustomAssetsImage(path: 'assets/Thumbs Up.png'),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: ResponsiveText(
                        text: 'لقد وافق محمود علي رحلتك',
                        scaleFactor: .05,
                      ),
                    ),
                    const SizedBox(width: 2),
                    CustomAssetsImage(
                        path:
                            'assets/Yellow taxi car and phone with a map.png'),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: screenSize(context).width,
                height: screenSize(context).height * .1,
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: Colors.white,
                ),
                child: LayoutBuilder(
                  builder: (p0, p1) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomAssetsImage(path: 'assets/pngwing 12.png'),
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 30,
                            backgroundColor: AppColors.primaryColor,
                            child: ResponsiveText(
                              text: '20\n ثانية',
                              scaleFactor: .05,
                              color: AppColors.white,
                            ),
                          ),
                          CustomAssetsImage(path: 'assets/Arrow 3.png'),
                          const CircleAvatar(
                            radius: 30,
                            backgroundColor: AppColors.primaryColor,
                            child: ResponsiveText(
                              text: '3\n دقائق',
                              scaleFactor: .05,
                              color: AppColors.white,
                            ),
                          ),
                          CustomAssetsImage(path: 'assets/Arrow 3.png'),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.primaryColor,
                            ),
                            child: const ResponsiveText(
                              text: '900 متر',
                              scaleFactor: .05,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
