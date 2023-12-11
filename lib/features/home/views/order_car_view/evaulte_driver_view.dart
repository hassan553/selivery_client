import 'package:flutter/material.dart';
import '../../../../core/rescourcs/app_colors.dart';
import '../../../../core/widgets/custom_sized_box.dart';

import '../../../../core/functions/global_function.dart';
import '../../../../core/widgets/custom_appBar.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../../core/widgets/responsive_text.dart';

class EvaluateDriverView extends StatelessWidget {
  const EvaluateDriverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E2B3C),
      appBar: customAppBarForSearch(context),
      body: Container(
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
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: screenSize(context).width * .06,
              backgroundColor: AppColors.white,
              child: Icon(
                Icons.check,
                //color: AppColors.white,
                size: screenSize(context).width * .06,
              ),
            ),
            const CustomSizedBox(value: .01),
            const ResponsiveText(
              text: 'لقد تم إنتهاء الرحلة',
              scaleFactor: .1,
              color: AppColors.white,
            ),
            const CustomSizedBox(value: .01),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomAssetsImage(
                    path: 'assets/Popular woman.png',
                    boxFit: BoxFit.fill,
                    //width: screenSize(context).width * .1,
                  ),
                  const SizedBox(width: 10),
                  const ResponsiveText(
                    text: 'قم بتقييم السائق',
                    scaleFactor: .06,
                    color: AppColors.white,
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ),
            const CustomSizedBox(value: .03),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: screenSize(context).width * .15,
                    backgroundImage: const AssetImage('assets/person.png'),
                  ),
                  const CustomSizedBox(value: .01),
                  const ResponsiveText(
                    scaleFactor: .06,
                    text: 'Hassan Marzouk',
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            const CustomSizedBox(value: .03),
            Container(
              width: screenSize(context).width * .5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.white,
              ),
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  driverEvaluate(
                      const Icon(
                        Icons.star,
                        color: Colors.red,
                      ),
                      'مقبول'),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                    ),
                    height: 50,
                  ),
                  driverEvaluate(
                      const Icon(
                        Icons.star,
                        color: Colors.blue,
                      ),
                      'جيد'),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                    ),
                    height: 50,
                  ),
                  driverEvaluate(
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      'رائع'),
                ],
              ),
            ),
            const CustomSizedBox(value: .02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const ResponsiveText(
                  text: 'شكرا لك',
                  scaleFactor: .06,
                  color: AppColors.white,
                  textAlign: TextAlign.end,
                ),
                const SizedBox(width: 10),
                Card(
                  child: CustomAssetsImage(
                    path: 'assets/Trust.png',
                    boxFit: BoxFit.fill,
                    //width: screenSize(context).width * .1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget driverEvaluate(Icon icon, String title) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            ResponsiveText(
              text: title,
              scaleFactor: .05,
              color: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
