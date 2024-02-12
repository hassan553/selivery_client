import 'package:flutter/material.dart';

import '../../../../core/functions/global_function.dart';
import '../../../../core/widgets/custom_appBar.dart';
import '../../../../core/widgets/custom_divider.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../../core/widgets/custom_sized_box.dart';
import '../../../../core/widgets/responsive_text.dart';
import 'map_view.dart';

class ConnectWithDriverView extends StatelessWidget {
  const ConnectWithDriverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: customAppBar(context),
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
                        text: 'حدد الموقع علي الخريطة',
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
                path: 'assets/city map with route.png',
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
