import 'package:flutter/material.dart';
import 'package:selivery_client/features/home/views/order_car_view/googlemapforlaunch.dart';
import 'package:selivery_client/features/home/views/order_car_view/googlemapgoto.dart';
import '../../../../core/functions/global_function.dart';
import '../../../../core/rescourcs/app_colors.dart';
import '../../../../core/widgets/custom_appBar.dart';
import '../../../../core/widgets/custom_divider.dart';
import '../../../../core/widgets/custom_sized_box.dart';
import '../../../../core/widgets/responsive_text.dart';
import 'map_view.dart';

import '../../../../core/widgets/custom_image.dart';

class ToSetLocation extends StatelessWidget {
  const ToSetLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarForSearch(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const CustomSizedBox(value: .01),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ResponsiveText(
                  text: ' حدد وجهتك',
                  scaleFactor: .05,
                ),
                const SizedBox(width: 10),
                CustomAssetsImage(path: 'assets/Address.png'),
              ],
            ),
            const CustomSizedBox(value: .02),
            Container(
              width: screenSize(context).width,
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: const Color(0xffD9D9D9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                  onTap: () {
                    navigateTo(const SetLaunchLocation());
                  },
                  child: const Text("حدد موقع الاقلاع")),
            ),
            const CustomSizedBox(value: .02),
            Container(
              width: screenSize(context).width,
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: const Color(0xffD9D9D9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                  onTap: () {
                    navigateTo(const SetLaunchLocationGoTo());
                  },
                  child: const Text("حدد موقع الذهاب")),
            ),
            const CustomSizedBox(value: .02),
            Container(
              width: screenSize(context).width,
              padding: const EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                color: const Color(0xffD9D9D9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  const ResponsiveText(
                    text: 'تحديد السعر',
                    scaleFactor: .03,
                  ),
                  const SizedBox(width: 2),
                  Container(
                    width: screenSize(context).width * .1,
                    padding: const EdgeInsets.all(1),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.black)),
                    child: const Text('.......'),
                  ),
                  Container(
                    color: Colors.red,
                    child: const VerticalDivider(
                      thickness: 10,
                      color: Colors.black,
                    ),
                  ),
                  Checkbox(value: true, onChanged: (value) {}),
                  const ResponsiveText(
                    text: 'بدون تحديد سوف اتفق مع السائق',
                    scaleFactor: .03,
                  ),
                ],
              ),
            ),
            const CustomSizedBox(value: .03),
            InkWell(
              onTap: () => navigateTo(const MapScreen()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAssetsImage(
                    path: 'assets/Address.png',
                    boxFit: BoxFit.fill,
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () => navigateTo(const MapScreen()),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      width: screenSize(context).width * .8,
                      alignment: Alignment.topRight,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffD9D9D9)),
                      child: const ResponsiveText(
                        text: 'اختار السائق الاقرب لك',
                        scaleFactor: .05,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const CustomSizedBox(value: .01),
            const CustomDivider(),
            const CustomSizedBox(value: .02),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CustomAssetsImage(
                path: 'assets/Rectangle 197.png',
                boxFit: BoxFit.fill,
                height: screenSize(context).height * .3,
                width: screenSize(context).width,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
