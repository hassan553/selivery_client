import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/dataforownercarsale.dart';
import '../../../../core/class/statusrequst.dart';

import '../../../../core/functions/global_function.dart';
import '../../../../core/rescourcs/app_colors.dart';
import '../../../../core/widgets/custom_appBar.dart';
import '../../../../core/widgets/custom_divider.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../../core/widgets/custom_sized_box.dart';
import '../../../../core/widgets/responsive_text.dart';

class CarOwnerView extends StatelessWidget {
  final String ownerId;
  final String phone;
  final String cartype;
  final int price;
  final String date;
  final String image;
  final String desc;
  const CarOwnerView(
      {super.key,
      required this.ownerId,
      required this.phone,
      required this.cartype,
      required this.price,
      required this.date,
      required this.image,
      required this.desc});

  @override
  Widget build(BuildContext context) {
    Get.put(OwnerCarForSaleController()..getownerdata(ownerId));
    print(ownerId);
    return GetBuilder<OwnerCarForSaleController>(
        builder: (controller) => Scaffold(
              appBar: customAppBarForSearch(context),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: controller.statusRequest == StatusRequest.loading
                      ? const Center(child: CircularProgressIndicator())
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircleAvatar(
                                    radius: screenSize(context).width * .15,
                                    child: Image.network(
                                      'http://192.168.1.10:8000/${controller.ownerModel.image}',
                                      width: 50,
                                      height: 60,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  const CustomSizedBox(value: .01),
                                  const ResponsiveText(
                                    scaleFactor: .05,
                                    text: 'مالك السياره',
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                            const CustomSizedBox(value: .02),
                            ResponsiveText(
                              scaleFactor: .05,
                              text: 'الاسم : ${controller.ownerModel.name} ',
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            const CustomSizedBox(value: .01),
                            const ResponsiveText(
                              scaleFactor: .05,
                              text: 'السن : 23 سنة',
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            const CustomSizedBox(value: .01),
                            Row(
                              children: [
                                FittedBox(
                                  child: ResponsiveText(
                                    scaleFactor: .05,
                                    text: 'رقم الموبيل : ${phone} ',
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                CustomAssetsImage(
                                    height: screenSize(context).height * .05,
                                    width: screenSize(context).width * .05,
                                    boxFit: BoxFit.fill,
                                    path: 'assets/whatsApp.png'),
                              ],
                            ),
                            const CustomSizedBox(value: .01),
                            FittedBox(
                              child: Row(
                                children: [
                                  const ResponsiveText(
                                    scaleFactor: .05,
                                    text:
                                        "للينك الفيس بوك : http:/forexample.com ",
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  CustomAssetsImage(
                                    height: screenSize(context).height * .05,
                                    width: screenSize(context).width * .05,
                                    boxFit: BoxFit.fill,
                                    path: 'assets/facebook.png',
                                  ),
                                ],
                              ),
                            ),
                            const CustomSizedBox(value: .01),
                            FittedBox(
                              child: Row(
                                children: [
                                  const ResponsiveText(
                                    scaleFactor: .05,
                                    text:
                                        "للينك  التليجرام  : http:/forexample.com ",
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  CustomAssetsImage(
                                      height: screenSize(context).height * .05,
                                      width: screenSize(context).width * .05,
                                      boxFit: BoxFit.fill,
                                      path: 'assets/telegram.png'),
                                ],
                              ),
                            ),
                            const CustomSizedBox(value: .02),
                            Container(
                              width: screenSize(context).width,
                              height: screenSize(context).height * .15,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            FittedBox(
                                              child: ResponsiveText(
                                                scaleFactor: .04,
                                                text:
                                                    "نوع السياره : ${cartype}",
                                                color: AppColors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            FittedBox(
                                              child: ResponsiveText(
                                                text: 'السعر :${price} جنيه',
                                                scaleFactor: .04,
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            FittedBox(
                                              child: ResponsiveText(
                                                scaleFactor: .04,
                                                text: 'تاريخ النشر :${date}',
                                                color: AppColors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 4, top: 4),
                                    child: Image.network(
                                      "http://192.168.1.10:8000/$image",
                                      width: screenSize(context).width * .5,
                                      height: screenSize(context).height * .2,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const CustomSizedBox(value: .01),
                            const ResponsiveText(
                              scaleFactor: .04,
                              text: "تفاصيل السياره ",
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            //const CustomSizedBox(value: .0),
                            const CustomDivider(),
                            ResponsiveText(
                              scaleFactor: .04,
                              text: "$desc",
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            const CustomSizedBox(value: .01),
                            const CustomDivider(),
                            const ResponsiveText(
                              scaleFactor: .04,
                              text: "صور السياره",
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            const CustomSizedBox(value: .01),
                            GridView(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 16 / 9,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                              ),
                              children: [
                                Image.network(
                                  'http://192.168.1.10:8000/$image',
                                  width: 50,
                                  height: 60,
                                  fit: BoxFit.fill,
                                )
                                // CustomAssetsImage(
                                //   path: 'assets/buyCar.png',
                                //   boxFit: BoxFit.fill,
                                // ),
                                // CustomAssetsImage(
                                //   path: 'assets/buyCar.png',
                                //   boxFit: BoxFit.fill,
                                // ),
                                // CustomAssetsImage(
                                //   path: 'assets/buyCar.png',
                                //   boxFit: BoxFit.fill,
                                // ),
                                // CustomAssetsImage(
                                //   path: 'assets/buyCar.png',
                                //   boxFit: BoxFit.fill,
                                // ),
                              ],
                            )
                          ],
                        ),
                ),
              ),
            ));
  }
}
