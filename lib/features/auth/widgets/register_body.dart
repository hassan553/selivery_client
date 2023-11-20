import 'package:flutter/material.dart';
import '../../../../../core/functions/global_function.dart';
import '../../../../../core/rescourcs/app_colors.dart';
import '../../../../../core/widgets/build_rich_text.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_image.dart';
import '../../../../../core/widgets/custom_text_filed.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenSize(context).height * .06),
            Align(
                alignment: Alignment.center,
                child: CustomAssetsImage(path: 'assets/car.png')),
            const Center(child: CustomRichText(color: AppColors.lightGreen,imagePath: 'assets/image2.png',)),
            SizedBox(height: screenSize(context).height * .05),
            CustomTextFieldWidget(
              controller: TextEditingController(),
              hintText: 'الاسم',
            ),
            SizedBox(height: screenSize(context).height * .03),
            CustomTextFieldWidget(
              controller: TextEditingController(),
              hintText: 'البريد الاكتروني',
            ),
            SizedBox(height: screenSize(context).height * .03),
            CustomTextFieldWidget(
              controller: TextEditingController(),
              hintText: 'كلمه السر',
            ),
            SizedBox(height: screenSize(context).height * .05),
            CustomButton(
                function: () {},
                color: AppColors.primaryColor,
                title: 'انشاء الحساب'),
            SizedBox(height: screenSize(context).height * .03),
          ],
        ),
      ),
    );
  }
}
