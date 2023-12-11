import 'package:flutter/material.dart';
import '../../../../core/functions/global_function.dart';
import '../../../../core/rescourcs/app_colors.dart';
import '../../../../core/widgets/custom_appBar.dart';
import '../../../../core/widgets/responsive_text.dart';
import '../../widgets/rental_buy_car_add_image.dart';
import '../../widgets/rental_buy_car_form_widget.dart';

class RentalCarFormView extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController faceLinkController = TextEditingController();
  TextEditingController telController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descController = TextEditingController();
  RentalCarFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarForSearch(context),
      body: Container(
        width: screenSize(context).width,
        height: screenSize(context).height,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              AppColors.white.withOpacity(.5),
              AppColors.primaryColor,
              AppColors.primaryColor,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              BuyRentalCarFormWidget(
                title: 'الاسم',
                controller: nameController,
              ),
              const SizedBox(height: 10),
              BuyRentalCarFormWidget(
                title: 'السن',
                controller: ageController,
              ),
              const SizedBox(height: 10),
              BuyRentalCarFormWidget(
                title: 'رقم الموبايل',
                controller: phoneController,
              ),
              const SizedBox(height: 10),
              BuyRentalCarFormWidget(
                title: 'لينك الفيس بوك',
                controller: faceLinkController,
              ),
              const SizedBox(height: 10),
              BuyRentalCarFormWidget(
                title: 'لينك التليجرام',
                controller: telController,
              ),
              const SizedBox(height: 10),
              BuyRentalCarFormWidget(
                title: 'نوع السياره',
                controller: typeController,
              ),
              const SizedBox(height: 10),
              BuyRentalCarFormWidget(
                title: 'سعر السياره',
                controller: priceController,
              ),
              const SizedBox(height: 10),
              BuyRentalCarFormWidget(
                title: 'تفاصيل السياره',
                controller: descController,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const FittedBox(
                    child: ResponsiveText(
                      text: 'طلبات الإيجار',
                      scaleFactor: .05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: screenSize(context).width * .6,
                    //height: screenSize(context).height * .15,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.black),
                    ),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          ResponsiveText(
                            text: '1-',
                            scaleFactor: .05,
                            fontWeight: FontWeight.bold,
                          ),
                          ResponsiveText(
                            text: '2-',
                            scaleFactor: .05,
                            fontWeight: FontWeight.bold,
                          ),
                          ResponsiveText(
                            text: '3-',
                            scaleFactor: .05,
                            fontWeight: FontWeight.bold,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: ResponsiveText(
                                text: '+',
                                scaleFactor: .05,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                              ),
                            ),
                          )
                        ]),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const RentalBuyCarAddImageWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
