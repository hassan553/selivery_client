import 'package:flutter/material.dart';
import '../../../../core/functions/global_function.dart';

import '../../../../core/widgets/custom_appBar.dart';
import '../../../../core/widgets/custom_sized_box.dart';
import '../rental_sale_car_view/rental_car_view_without_driver.dart';

import '../../../../core/rescourcs/app_colors.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../../core/widgets/responsive_text.dart';
import '../rental_sale_car_view/rental_car_view_with_driver.dart';

class WithDriverOrNotView extends StatelessWidget {
  final String catId;
   WithDriverOrNotView({super.key, required this.catId});

  @override
  Widget build(BuildContext context) {
    print("catid for rent $catId");
    return Scaffold(
      appBar: customAppBar(context),
      body: ListView(
        children: [
          const CustomSizedBox(value: .02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ResponsiveText(
                text: 'أختار المناسب لك',
                scaleFactor: .05,
              ),
              const SizedBox(width: 10),
              CustomAssetsImage(path: 'assets/91YDvYuNrVL 1.png'),
            ],
          ),
          const CustomSizedBox(value: .04),
          InkWell(
            onTap: () => navigateTo( RentalCarViewWithoutDriver(id:catId,)),
            child: Container(
              width: screenSize(context).width,
              decoration: BoxDecoration(
                //color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5),
                      BlendMode.srcATop,
                    ),
                    child: Image.asset(
                      "assets/Rectangle 156.png",
                      height: screenSize(context).height * .3,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/tap.png'),
                      const SizedBox(width: 10),
                      Text(
                        " بدون سائق ",
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const CustomSizedBox(value: .02),
        InkWell(
          onTap: () => navigateTo( RentalCarViewWithDriver(id: catId,)),
          child: Container(
            width: screenSize(context).width,
            decoration: BoxDecoration(
              //color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Stack(
              alignment: Alignment.center,
              children: [
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.srcATop,
                  ),
                  child: Image.asset(
                    "assets/Rectangle 156.png",
                    height: screenSize(context).height * .3,
                    fit: BoxFit.fill,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/tap.png'),
                    const SizedBox(width: 10),
                    Text(
                      "  بسائق ",
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        ],
      ),
    );
  }

  // Widget selectDriverOptionWidget(
  //     BuildContext context, String title, String imagePath) {
  //   return InkWell(
  //     onTap: () => navigateTo(const RentalCarView()),
  //     child: Container(
  //       width: screenSize(context).width,
  //       decoration: BoxDecoration(
  //           //color: Colors.black.withOpacity(0.5),
  //           borderRadius: BorderRadius.circular(10)),
  //       margin: const EdgeInsets.symmetric(horizontal: 5),
  //       child: Stack(
  //         alignment: Alignment.center,
  //         children: [
  //           ColorFiltered(
  //             colorFilter: ColorFilter.mode(
  //               Colors.black.withOpacity(0.5),
  //               BlendMode.srcATop,
  //             ),
  //             child: Image.asset(
  //               imagePath,
  //               height: screenSize(context).height * .3,
  //               fit: BoxFit.fill,
  //             ),
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Image.asset('assets/tap.png'),
  //               const SizedBox(width: 10),
  //               Text(
  //                 title,
  //                 style: const TextStyle(
  //                   color: AppColors.white,
  //                   fontSize: 30,
  //                   fontWeight: FontWeight.w300,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
