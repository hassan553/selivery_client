import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/categorieslistforsales.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../../core/widgets/custom_sized_box.dart';
import '../../../../core/functions/global_function.dart';
import '../../../../core/widgets/custom_appBar.dart';
import '../../../../core/widgets/responsive_text.dart';
import '../../widgets/order_rental_top_part_widget.dart';
import 'buy_car_owner.dart';
import '../../../../core/rescourcs/app_colors.dart';

class OrderCarDetailsView extends StatelessWidget {
  final String id;
  const OrderCarDetailsView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesListForSalesController()..getCategories(id));
    List images = [
      'assets/pngwing 4.png',
      'assets/pngwing 5.png',
      'assets/pngwing 8.png',
      'assets/pngwing 1.png',
      'assets/pngwing 2.png',
      'assets/pngwing 3.png',
      'assets/pngwing 9.png',
    ];
    return Scaffold(
      appBar: customAppBarForSearch(context),
      body: GetBuilder<CategoriesListForSalesController>(
        builder: (controller) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomSizedBox(value: .03),
            topPartOrderOrRentalCarWidget(context, images),
            const CustomSizedBox(value: .02),
            Expanded(
              child: Scrollbar(
                child: ListView.builder(
                  itemBuilder: (context, index) => Container(
                    width: screenSize(context).width,
                    height: screenSize(context).height * .6,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: LayoutBuilder(
                      builder: (p0, p1) {
                        return Column(
                          children: [
                            Container(
                              child: Image.network(
                                'http://192.168.1.5:8000/${controller.categories[index]['car']['images'][0]}',
                                width: p1.maxWidth * .8,
                                height: p1.maxHeight * .6,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const Divider(color: AppColors.white),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FittedBox(
                                    child: ResponsiveText(
                                      scaleFactor: .04,
                                      text:
                                          "نوع السياره : ${controller.categories[index]['car']['type']}",
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  FittedBox(
                                    child: ResponsiveText(
                                      text:
                                          'السعر : ${controller.categories[index]['price']}',
                                      scaleFactor: .04,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  FittedBox(
                                    child: ResponsiveText(
                                      scaleFactor: .04,
                                      text:
                                          'تاريخ النشر : ${controller.categories[index]['publishDate']}',
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  InkWell(
                                    onTap: () => navigateTo(
                                      CarOwnerView(
                                        ownerId: controller.categories[index]
                                            ['userId'],
                                        phone: controller.categories[index]
                                            ['phone'],
                                        cartype: controller.categories[index]
                                            ['car']['type'],
                                        price: controller.categories[index]
                                            ['price'],
                                        date: controller.categories[index]
                                            ['publishDate'],
                                        desc: controller.categories[index]
                                            ['car']['description'],
                                        image: controller.categories[index]
                                            ['car']['images'][0],
                                      ),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(7),
                                      decoration: BoxDecoration(
                                        color: const Color(0xff014842),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const ResponsiveText(
                                        scaleFactor: .04,
                                        text: 'للطب والاستفار',
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  itemCount: controller.categories.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //
  // Container orderVehicleWidget(BuildContext context) {
  //   return Container(
  //     width: screenSize(context).width,
  //     height: screenSize(context).height * .6,
  //     margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  //     decoration: BoxDecoration(
  //       color: Colors.grey,
  //       borderRadius: BorderRadius.circular(20),
  //     ),
  //     child: LayoutBuilder(
  //       builder: (p0, p1) {
  //         return Column(
  //           children: [
  //             Container(
  //               child: CustomAssetsImage(
  //                 path: 'assets/Rectangle 159 (2).png',
  //                 width: p1.maxWidth * .8,
  //                 height: p1.maxHeight * .6,
  //                 boxFit: BoxFit.fill,
  //               ),
  //             ),
  //             const Divider(color: AppColors.white),
  //             Expanded(
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                 children: [
  //                   const FittedBox(
  //                     child: ResponsiveText(
  //                       scaleFactor: .04,
  //                       text: "نوع السياره : هونداي توسان 2022",
  //                       color: AppColors.black,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                   ),
  //                   const SizedBox(
  //                     height: 3,
  //                   ),
  //                   const FittedBox(
  //                     child: ResponsiveText(
  //                       text: 'السعر : 4000 جنيه',
  //                       scaleFactor: .04,
  //                       color: Colors.red,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                   ),
  //                   const SizedBox(
  //                     height: 3,
  //                   ),
  //                   const FittedBox(
  //                     child: ResponsiveText(
  //                       scaleFactor: .04,
  //                       text: 'تاريخ النشر : 1/3/2022',
  //                       color: AppColors.black,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                   ),
  //                   const SizedBox(
  //                     height: 5,
  //                   ),
  //                   InkWell(
  //                     onTap: () => navigateTo(const CarOwnerView()),
  //                     child: Container(
  //                       padding: const EdgeInsets.all(7),
  //                       decoration: BoxDecoration(
  //                         color: const Color(0xff014842),
  //                         borderRadius: BorderRadius.circular(8),
  //                       ),
  //                       child: const ResponsiveText(
  //                         scaleFactor: .04,
  //                         text: 'للطب والاستفار',
  //                         color: AppColors.white,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                   ),
  //                   const SizedBox(
  //                     height: 2,
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         );
  //       },
  //     ),
  //   );
  // }
}
