import 'package:flutter/material.dart';
import '../../../../controllers/setlocation.dart';
import '../../../../controllers/setlocationgoto.dart';
import '../../../../core/rescourcs/app_colors.dart';
import '../../../../core/widgets/custom_appBar.dart';
import '../../../../core/widgets/custom_image.dart';
import 'toSet_location_view.dart';
import 'package:get/get.dart';
import '../../../../core/functions/global_function.dart';
import '../../../../core/widgets/custom_sized_box.dart';
import '../../../../core/widgets/responsive_text.dart';

class GetLocationFromUserView extends StatefulWidget {
  const GetLocationFromUserView({super.key});

  @override
  State<GetLocationFromUserView> createState() =>
      _GetLocationFromUserViewState();
}

class _GetLocationFromUserViewState extends State<GetLocationFromUserView> {
  SetLocationGoToController setLocationGoToController =
      Get.put(SetLocationGoToController());
  SetLocationController setLocationController =
      Get.put(SetLocationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/Taxi rides to the destination.png',
              height: screenSize(context).height * .3,
              fit: BoxFit.fill,
            ),
          ),
          const CustomSizedBox(value: .02),
          InkWell(
            onTap: () => navigateTo(const ToSetLocation()),
            child: Container(
              width: screenSize(context).width,
              padding: const EdgeInsets.symmetric(vertical: 30),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: const Color(0xff0F534D),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomAssetsImage(path: 'assets/Worldwide Location.png'),
                  const SizedBox(width: 4),
                  const ResponsiveText(
                    text: 'تحديد الوجهة بنفسك',
                    scaleFactor: .05,
                    color: AppColors.white,
                  ),
                ],
              ),
            ),
          ),
          const CustomSizedBox(value: .02),
          
        ],
      ),
    );
  }
}
