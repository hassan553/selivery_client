import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/functions/global_function.dart';
import '../../../../../../core/rescourcs/app_colors.dart';
import '../../../../../../core/widgets/custom_image.dart';
import '../../../../../../core/widgets/custom_loading_widget.dart';
import '../../../../../../core/widgets/custom_sized_box.dart';
import '../../../../../../core/widgets/responsive_text.dart';
import '../../../../../../core/widgets/show_awesomeDialog.dart';
import '../../cubit/forget_password/forget_password_cubit.dart';
import 'new_password_view.dart';
import 'otp_view.dart';

import '../../../../../../core/widgets/snack_bar_widget.dart';
import '../../data/data_source/forgetpassword_repo.dart';

class ClientForgetPasswordView extends StatefulWidget {
  const ClientForgetPasswordView({super.key});

  @override
  State<ClientForgetPasswordView> createState() =>
      _ClientForgetPasswordViewState();
}

class _ClientForgetPasswordViewState extends State<ClientForgetPasswordView> {
  final controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ForgetPasswordCubit(ForgetPasswordRepo()),
        child: InkWell(
          onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
          child: Container(
            width: screenSize(context).width,
            height: screenSize(context).height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  Color(0xff1E2B3C),
                  Color(0xff16B0A4),
                ])),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const CustomSizedBox(value: .05),
                        Image.asset('assets/logo.png',
                            height: 80, fit: BoxFit.fill),
                        CustomAssetsImage(
                            path: 'assets/One-time password on the phone.png'),
                        const Align(
                          alignment: Alignment.topRight,
                          child: ResponsiveText(
                            text: 'البريد الإلكتروني',
                            fontWeight: FontWeight.bold,
                            scaleFactor: .05,
                            color: AppColors.white,
                          ),
                        ),
                        const CustomSizedBox(value: .01),
                        TextFormField(
                          textDirection: TextDirection.ltr,
                          controller: controller,
                          validator: (String? value) {
                            if (value == null) {
                              return 'قيمة فارغة غير صالحة';
                            }
                            if (!value.contains('@')) {
                              return 'الرجاء إدخال بريد إلكتروني صحيح';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            fillColor: AppColors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: AppColors.white),
                            ),
                            prefixIcon:
                                const Icon(Icons.email, color: Colors.black),
                          ),
                        ),
                        const CustomSizedBox(value: .05),
                        BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
                          listener: (context, state) {
                            if (state is ForgetPasswordSuccessState) {
                              showSnackBarWidget(
                                  context: context,
                                  message:
                                      'لقد ارسالنا رمز التحقق الي بريدك الاكتروني',
                                  requestStates: RequestStates.success);
                              navigateOff(OTPView(
                                email: controller.text,
                                screen: const NewPasswordView(),
                              ));
                            } else if (state is ForgetPasswordErrorState) {
                              showErrorAwesomeDialog(
                              context, 'تنبيه', state.message);
                            }
                          },
                          builder: (context, state) {
                            return state is ForgetPasswordLoadingState
                                ? const CustomLoadingWidget()
                                : InkWell(
                                    onTap: () {
                                      if (formKey.currentState!.validate()) {
                                        ForgetPasswordCubit.get(context)
                                            .sendEmail(controller.text.trim());
                                      }
                                      FocusManager.instance.primaryFocus!
                                          .unfocus();
                                    },
                                    child: Container(
                                      width: screenSize(context).width,
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: const Color(0xff3B4F68)),
                                      child:const  Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children:  [
                                          Icon(
                                            Icons.check_box,
                                            color: AppColors.white,
                                          ),
                                          SizedBox(width: 5),
                                          ResponsiveText(
                                            text: ' إرسال البريد',
                                            fontWeight: FontWeight.bold,
                                            scaleFactor: .05,
                                            color: AppColors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
