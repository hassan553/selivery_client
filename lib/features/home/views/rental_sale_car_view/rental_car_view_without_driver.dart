import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/carwithoutdrivers.dart';
import '../../../../core/class/statusrequst.dart';
import 'rental_car_owner_view.dart';
import '../../../../core/functions/global_function.dart';
import '../../../../core/rescourcs/app_colors.dart';
import '../../../../core/widgets/custom_appBar.dart';
import '../../../../core/widgets/custom_sized_box.dart';
import '../../../../core/widgets/responsive_text.dart';
import '../../widgets/order_rental_top_part_widget.dart';

class RentalCarViewWithoutDriver extends StatelessWidget {
  final String id;
  const RentalCarViewWithoutDriver({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    List images = [
      'assets/pngwing 4.png',
      'assets/pngwing 5.png',
      'assets/pngwing 8.png',
      'assets/pngwing 1.png',
      'assets/pngwing 2.png',
      'assets/pngwing 3.png',
      'assets/pngwing 9.png',
    ];
    Get.put(CarWithOutDriverController()..getcarswithoutdriver(id));
    return Scaffold(
      appBar: customAppBarForSearch(context),
      body: GetBuilder<CarWithOutDriverController>(builder:
          (controller){
        if(controller.statusRequest==StatusRequest.loading){
          return Center(child: CircularProgressIndicator());
        }else if(controller.carswithoutdriver.isEmpty){
          return Center(child: Text("لا يوجد سيارات متاحة الان",style: TextStyle(
              fontSize: 20,
              color: Colors.black
          ),));
        }else{
          return Column(
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
                      height: screenSize(context).height * .5,
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
                              Image.network(
                                "https://www.selivery-app.com/images/${controller.carswithoutdriver[index]['car']['images'][0]}",
                                width: p1.maxWidth * .6,
                                height: p1.maxHeight * .4,
                                fit: BoxFit.fill,
                              ),

                              const Divider(color: AppColors.white),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.only(right: 5),
                                            child: Column(
                                              children:  [
                                                const FittedBox(
                                                  child: ResponsiveText(
                                                    scaleFactor: .04,
                                                    text: "نوع السياره ",
                                                    color: AppColors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 3,
                                                ),
                                                FittedBox(
                                                  child: ResponsiveText(
                                                    scaleFactor: .04,
                                                    text: " ${controller.carswithoutdriver[index]['car']['type']}",
                                                    color: AppColors.black,
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
                                                    'سعر الإيجار في اليوم : ${controller.carswithoutdriver[index]['price']} جنية',
                                                    color: AppColors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            child: Column(
                                              children: [
                                                const FittedBox(
                                                  child: ResponsiveText(
                                                    scaleFactor: .04,
                                                    text: "المسافة المسموحه ",
                                                    color: AppColors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 3,
                                                ),
                                                const FittedBox(
                                                  child: ResponsiveText(
                                                    scaleFactor: .04,
                                                    text: " 150 كيلو ",
                                                    color: AppColors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 3,
                                                ),
                                                FittedBox(
                                                  child: ResponsiveText(
                                                    scaleFactor: .04,
                                                    text: 'تاريخ النشر : ${controller.carswithoutdriver[index]['publishDate']}',
                                                    color: AppColors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    InkWell(
                                      onTap: () =>
                                          navigateTo(
                                              RentalCarOwnerView(
                                                  fac:controller.carswithoutdriver[index]['facebookLink'] ,
                                                  tel: controller.carswithoutdriver[index]['telegramLink'],
                                                  ownerId:controller.carswithoutdriver[index]['userId'],
                                                  price:controller.carswithoutdriver[index]['price'],
                                                  phone:controller.carswithoutdriver[index]['phone'] ,
                                                  image: controller.carswithoutdriver[index]['car']['images'][0],
                                                  cartype:controller.carswithoutdriver[index]['car']['type'] ,
                                                  date:controller.carswithoutdriver[index]['publishDate'] ,
                                                  desc:controller.carswithoutdriver[index]['car']['description'] , ownername:controller.carswithoutdriver[index]['ownerName']
                                              )
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
                    itemCount: controller.carswithoutdriver.length,
                  ),
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
