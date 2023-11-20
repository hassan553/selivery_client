import 'package:flutter/material.dart';

import '../../../../../core/functions/global_function.dart';
import '../../../../../core/rescourcs/app_colors.dart';
import '../../../../../core/widgets/build_rich_text.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_image.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import '../../../../../core/widgets/custom_text_filed.dart';
import '../presentation/view/register_view.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenSize(context).height * .06),
              Align(
                  alignment: Alignment.center,
                  child: CustomAssetsImage(path: 'assets/car.png')),
              const Center(child: CustomRichText(color: AppColors.primaryColor,imagePath: 'assets/image.png',)),
              SizedBox(height: screenSize(context).height * .05),
              CustomTextFieldWidget(
                controller: TextEditingController(),
                hintText: 'البريد الاكتروني',
              ),
              SizedBox(height: screenSize(context).height * .03),
              CustomTextFieldWidget(
                controller: TextEditingController(),
                hintText: 'كلمه السر',
              ),
              SizedBox(height: screenSize(context).height * .02),
              CustomTextButton(function: () {},
                  color: AppColors.primaryColor,
               title: 'لا اتذكر كلمه المرور'),
              SizedBox(height: screenSize(context).height * .03),
              CustomButton(
                  function: () {},
                  color: AppColors.primaryColor,
                  title: 'تسجيل الدخوال'),
              SizedBox(height: screenSize(context).height * .03),
              Align(
                  alignment: Alignment.center,
                  child: CustomTextButton(
                      function: () {
                        navigateTo(ClientRegisterView());
                      },
                      color: AppColors.primaryColor,
                      title: 'انشاء حساب جديد')),
              SizedBox(height: screenSize(context).height * .03),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomAssetsImage(
                        path: 'assets/facebook.png',
                        width: 30,
                        height: 30,
                        boxFit: BoxFit.fill,
                      ),
                    )),
                    const SizedBox(width: 10),
                    Card(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomAssetsImage(
                        path: 'assets/google.png',
                        width: 30,
                        height: 30,
                        boxFit: BoxFit.fill,
                      ),
                    )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
