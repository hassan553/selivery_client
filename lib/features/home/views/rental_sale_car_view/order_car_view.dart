import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selivery_client/core/contants/api.dart';

import '../../../../controllers/categoriescontroller.dart';
import '../../../../core/functions/global_function.dart';
import '../../../../core/rescourcs/app_colors.dart';
import '../../../../core/widgets/custom_appBar.dart';
import '../../../../core/widgets/responsive_text.dart';
import '../../../../core/widgets/show_awesomeDialog.dart';
import '../order_car_view/with_driver_or_not view.dart';
import '../sale_buy_form/rental_car_form_view.dart';
import '../sale_buy_form/sale_car_form_view.dart';
import 'order_car_details.dart';

class OrderCarView extends StatefulWidget {
  final bool isRental;
  const OrderCarView({super.key, required this.isRental});

  @override
  State<OrderCarView> createState() => _OrderCarViewState();
}

class _OrderCarViewState extends State<OrderCarView> {
  List images = [
    'assets/buyCar.png',
    'assets/Rectangle 158 (3).png',
    'assets/Rectangle 158 (2).png',
    'assets/Rectangle 159 (1).png',
  ];
  List titles = [
    'سيارات',
    'دراجات بخارية',
    'ميكروباص',
    'دراجة',
  ];
  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesController());
    return Scaffold(
      appBar: customAppBarForSearch(context),
      body: GetBuilder<CategoriesController>(
        builder: (controller) => Center(
          child: ListView.builder(
            itemBuilder: (context, index) => InkWell(
              onTap: () => navigateTo(widget.isRental
                  ? WithDriverOrNotView(
                      catId: controller.categories[index]['_id'],
                    )
                  : OrderCarDetailsView(
                      id: controller.categories[index]['_id'],
                    )),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 3),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5),
                        BlendMode.srcATop,
                      ),
                      child: Image.network(
                        "${baseUri}images\\${controller.categories[index]['image']}",
                        fit: BoxFit.fill,
                        height: screenSize(context).height * .2,
                        width: screenSize(context).width,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset('assets/tap.png'),
                        const SizedBox(width: 10),
                        ResponsiveText(
                          scaleFactor: .08,
                          text: "${controller.categories[index]['name']}",
                          color: AppColors.white,
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 12,
                      left: 3,
                      child: InkWell(
                        onTap: () => showAwesomeDialog(
                            context,
                            'رساله تنبيه',
                            'الان سوف تقوم باضافة مركبه',
                            widget.isRental
                                ? RentalCarFormView(
                                    catId: controller.categories[index]['_id'],
                                  )
                                : SaleCarFormView(
                                    catId: controller.categories[index]['_id'],
                                  )),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade400,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.blue,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 5),
                              ResponsiveText(
                                scaleFactor: .035,
                                text: "اضافة مركبه",
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            itemCount: controller.categories.length,
          ),
        ),
      ),
    );
  }

  // orderCarWidget(context, String imagePath, String title,id) {
  //   return InkWell(
  //     onTap: () => navigateTo(widget.isRental?const
  //     WithDriverOrNotView():  OrderCarDetailsView(id:id ,)),
  //     child: Padding(
  //       padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 3),
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
  //               fit: BoxFit.fill,
  //               height: screenSize(context).height * .2,
  //               width: screenSize(context).width,
  //             ),
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.end,
  //             children: [
  //               Image.asset('assets/tap.png'),
  //               const SizedBox(width: 10),
  //               ResponsiveText(
  //                 scaleFactor: .08,
  //                 text: title,
  //                 color: AppColors.white,
  //               ),
  //             ],
  //           ),
  //           Positioned(
  //             bottom: 12,
  //             left: 3,
  //             child: InkWell(
  //               onTap: () => showAwesomeDialog(
  //                   context, 'رساله تنبيه', 'الان سوف تقوم باضافة مركبه'
  //                   ,widget.isRental? RentalCarFormView():  SaleCarFormView()),
  //               child: Container(
  //                 padding: const EdgeInsets.all(4),
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(8),
  //                   color: Colors.grey.shade400,
  //                 ),
  //                 child:  Row(
  //                   mainAxisSize: MainAxisSize.min,
  //                   children:const  [
  //                     CircleAvatar(
  //                       radius: 18,
  //                       backgroundColor: Colors.blue,
  //                       child: Icon(
  //                         Icons.add,
  //                         color: Colors.white,
  //                       ),
  //                     ),
  //                     SizedBox(width: 5),
  //                     ResponsiveText(
  //                       scaleFactor: .035,
  //                       text: "اضافة مركبه",
  //                       color: AppColors.black,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
