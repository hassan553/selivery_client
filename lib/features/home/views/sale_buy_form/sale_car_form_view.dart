import 'package:flutter/material.dart';
import '../../../../controllers/addcarforsale.dart';
import '../../../../core/functions/global_function.dart';
import '../../../../core/rescourcs/app_colors.dart';
import '../../../../core/widgets/custom_appBar.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/custom_image.dart';
import '../../../../core/widgets/responsive_text.dart';
import '../../widgets/rental_buy_car_add_image.dart';
import '../../widgets/rental_buy_car_form_widget.dart';
import 'package:http/http.dart' as http;

class SaleCarFormView extends StatefulWidget {
  final String catId;

  const SaleCarFormView({super.key, required this.catId});

  @override
  State<SaleCarFormView> createState() => _SaleCarFormViewState(catId);
}

class _SaleCarFormViewState extends State<SaleCarFormView> {
  TextEditingController nameController = TextEditingController();

  TextEditingController ageController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController faceLinkController = TextEditingController();

  TextEditingController telController = TextEditingController();

  TextEditingController typeController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  TextEditingController descController = TextEditingController();
  TextEditingController CarNameController = TextEditingController();
  final String catId;

  _SaleCarFormViewState(this.catId);


  @override
  Widget build(BuildContext context) {
    AddCarForSaleController controller = Get.put(AddCarForSaleController());
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
                SizedBox(height: 15),
                BuyRentalCarFormWidget(
                  title: 'الاسم',
                  controller: nameController,
                ),
                //SizedBox(height: 10),
                //BuyRentalCarFormWidget(title: 'السن',controller: ageController,),
                SizedBox(height: 10),
                BuyRentalCarFormWidget(
                  title: 'رقم الموبايل',
                  controller: phoneController,
                ),
                SizedBox(height: 10),
                BuyRentalCarFormWidget(
                  title: 'لينك الفيس بوك',
                  controller: faceLinkController,
                ),
                SizedBox(height: 10),
                BuyRentalCarFormWidget(
                  title: 'لينك التليجرام',
                  controller: telController,
                ),
                // SizedBox(height: 10),
                // BuyRentalCarFormWidget(title: 'نوع السياره',
                //   controller: typeController,),
                SizedBox(height: 10),
                BuyRentalCarFormWidget(
                  title: 'سعر السياره',
                  controller: priceController,
                ),
                SizedBox(height: 10),
                BuyRentalCarFormWidget(
                  title: 'اسم السيارة',
                  controller: CarNameController,
                ),
                SizedBox(height: 10),
                BuyRentalCarFormWidget(
                  title: 'تفاصيل السياره',
                  controller: descController,
                ),
                SizedBox(height: 10),
                //RentalBuyCarAddImageWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FittedBox(
                      child: ResponsiveText(
                        text: 'صور السياره',
                        scaleFactor: .05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                        onTap: () async {
                          await controller.uploadfile();
                        },
                        child: Container(
                          width: screenSize(context).width * .6,
                          height: screenSize(context).height * .12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: GetBuilder<AddCarForSaleController>(
                            builder: (controller) => controller.file == null
                                ? CustomAssetsImage(
                                    path: 'assets/add_image.png')
                                : Image.file(controller.file!),
                          ),
                        )),
                  ],
                ),
                SizedBox(height: 10),

                MaterialButton(
                  onPressed: () {
                    controller.addCarData(
                        nameController.text,
                        phoneController.text,
                        faceLinkController.text,
                        telController.text,
                        priceController.text,
                        CarNameController.text,
                        descController.text,
                        catId);

                  },
                  child: Text("أضافة"),
                ),
              ],
            ),
          )),
    );
  }
}
