import 'package:flutter/material.dart';
import 'orders_details_view.dart';

import '../../../../core/functions/global_function.dart';
import '../../../../core/rescourcs/app_colors.dart';
import '../../../../core/widgets/custom_appBar.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../../core/widgets/custom_sized_box.dart';
import '../../../../core/widgets/responsive_text.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E2B3C),
      appBar: customAppBarForSearch(context),
      body: Container(
        width: screenSize(context).width,
        height: screenSize(context).height,
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ResponsiveText(
                text: 'الأحدث',
                scaleFactor: .08,
                color: AppColors.white,
              ),
              const CustomSizedBox(value: .02),
              Expanded(
                child: ListView(
                  children: [
                    ordersWidget(
                        context, 'assets/person.png', 'hassan', 'منذ 1 دقيقة'),
                    const CustomSizedBox(value: .01),
                    ordersWidget(context, 'assets/Ellipse 55.png', 'محمود احمد',
                        'منذ 20 دقيقة'),
                    const CustomSizedBox(value: .01),
                    ordersWidget(context, 'assets/Ellipse 59.png', 'حسن محمد',
                        'منذ 1 يوم'),
                    const CustomSizedBox(value: .01),
                    ordersWidget(context, 'assets/Ellipse 60.png',
                        'mohamed ahmed', 'منذ 12 دقيقة'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ordersWidget(
      BuildContext context, String imagePath, String name, String time) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: screenSize(context).width * .08,
          child: CustomAssetsImage(
            boxFit: BoxFit.fill,
            path: imagePath,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: ResponsiveText(
                  text: 'لقدطلبك $name',
                  scaleFactor: .05,
                  color: AppColors.white,
                ),
              ),
              ResponsiveText(
                text: time,
                scaleFactor: .04,
                color: AppColors.white,
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        InkWell(
          onTap: () => navigateTo(const OrdersDetailsScreen()),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color(0xffDFECEB),
                  Color(0xff16B0A4),
                ],
              ),
            ),
            child: const ResponsiveText(
              text: 'التفاصيل',
              scaleFactor: .04,
              color: AppColors.black,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Icon(
          Icons.close,
          color: AppColors.white,
          size: screenSize(context).width * .08,
        ),
      ],
    );
  }
}
