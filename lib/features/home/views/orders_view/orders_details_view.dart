import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_appBar.dart';
import '../../../../core/widgets/custom_image.dart';

import '../../../../core/functions/global_function.dart';
import '../../../../core/rescourcs/app_colors.dart';
import '../../../../core/widgets/custom_sized_box.dart';
import '../../../../core/widgets/responsive_text.dart';

class OrdersDetailsScreen extends StatelessWidget {
  const OrdersDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: screenSize(context).width * .15,
              backgroundImage: const AssetImage('assets/Ellipse 59.png'),
            ),
            const CustomSizedBox(value: .01),
            const ResponsiveText(
              scaleFactor: .05,
              text: ' hassan hashem',
              color: AppColors.black,
              fontWeight: FontWeight.w500,
            ),
            const CustomSizedBox(value: .04),
            Container(
              width: screenSize(context).width * .8,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 2, color: AppColors.primaryColor)),
              child: FittedBox(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      infoWidget(
                        'assets/Location.png',
                        'موقع الإقلال : شارع الجمهورية',
                      ),
                      infoWidget(
                        'assets/Location.png',
                        'موقع الوصول : شارع النميس',
                      ),
                      infoWidget(
                        'assets/Hang Up.png',
                        'رقم العميل : 01115690652',
                      ),
                      infoWidget(
                        'assets/Us Dollar Circled.png',
                        'السعر المحدد : 25 جنيهاً',
                      ),
                    ]),
              ),
            ),
          
          
            const CustomSizedBox(value: .03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green),
                    child: const ResponsiveText(
                      text: 'قبول',
                      scaleFactor: .04,
                      color: AppColors.white,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red),
                    child: const ResponsiveText(
                      text: 'رفض',
                      scaleFactor: .04,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row infoWidget(
    String imagePath,
    String title,
  ) {
    return Row(
      children: [
        CustomAssetsImage(
          path: imagePath,
        ),
        const SizedBox(width: 5),
        ResponsiveText(
          scaleFactor: .05,
          text: title,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
