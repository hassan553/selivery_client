import 'package:flutter/material.dart';

import '../../../core/functions/global_function.dart';
import '../../../core/rescourcs/app_colors.dart';
import '../../../core/widgets/custom_appBar.dart';
import '../../../core/widgets/custom_divider.dart';
import '../../../core/widgets/custom_image.dart';
import '../../../core/widgets/custom_sized_box.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/widgets/responsive_text.dart';
import '../../profile/presentation/widgets/top_title.dart';

class DriverProfile extends StatelessWidget {
  final String name;
  final String image;
  const DriverProfile({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body:driverProfileBody(context)
    );
  }

  SingleChildScrollView driverProfileBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
        child: SizedBox(
          width: screenSize(context).width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             TopTitleWidget(title1: 'سا',
                title2: 'ئق',
                image: "http://192.168.1.10:8000/$image}",
                name:name??'',
              ),
              const CustomDivider(),
              driverCV(),
              const CustomDivider(),
              driverEvaulte(),
              const CustomDivider(),
              carType(),
              const CustomDivider(),
              const CustomSizedBox(value: .03),
            ],
          ),
        ),
      ),
    );
  }

  Row carType() {
    return Row(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              title: 'نوع السيارة',
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            CustomText(
              title: 'Kia cerato',
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.primaryColor)),
            child: CustomAssetsImage(
              path: 'assets/buyCar.png',
              height: 60,
              boxFit: BoxFit.fill,
            ),
          ),
        )
      ],
    );
  }

  Row driverEvaulte() {
    return Row(
      children: [
        CustomText(
          title: 'التقيم',
          fontSize: 16,
        ),
        const SizedBox(width: 10),
        const Icon(
          Icons.arrow_forward,
          color: AppColors.primaryColor,
        ),
        Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                driverEvaluate(
                    const Icon(
                      Icons.star,
                      color: Colors.red,
                    ),
                    'مقبول'),
                driverEvaluate(
                    const Icon(
                      Icons.star,
                      color: Colors.blue,
                    ),
                    'جيد'),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomText(title: '50%', fontSize: 8),
                    driverEvaluate(
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        'رائع'),
                    CustomText(title: '50 تفاعل', fontSize: 8),
                  ],
                )
              ],
            )),
      ],
    );
  }

  Row driverCV() {
    return Row(
      children: [
        const ResponsiveText(
          scaleFactor: .03,
          text: 'السيرة الذاتيه',
        ),
        const SizedBox(width: 10),
            Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(.7),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(5),
            child: const Text(
              "",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }

  Widget driverEvaluate(Icon icon, String title) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        CustomText(
          title: title,
          fontSize: 14,
        ),
      ],
    );
  }
}
