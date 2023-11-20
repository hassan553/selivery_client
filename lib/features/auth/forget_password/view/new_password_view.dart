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
import '../../data/data_source/forgetpassword_repo.dart';

import '../../../../../../core/widgets/snack_bar_widget.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({super.key});

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();
  var newPasswordFocus = FocusNode();
  var confirmNewPasswordFocus = FocusNode();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    newPasswordFocus.dispose();
    confirmNewPasswordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
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
                          text: ' كلمة السر الجديدة',
                          fontWeight: FontWeight.bold,
                          scaleFactor: .05,
                          color: AppColors.white,
                        ),
                      ),
                      const CustomSizedBox(value: .01),
                      TextFormField(
                        controller: newPasswordController,
                        focusNode: newPasswordFocus,
                        obscureText: true,
                        onFieldSubmitted: (value) => FocusScope.of(context)
                            .requestFocus(confirmNewPasswordFocus),
                        validator: (String? value) {
                          if (value == null) {
                            return 'قيمه فارغه';
                          }
                          if (value.length < 6) {
                            return 'كلمة مرور قصيرة . على الأقل 6 خانات';
                          }
                          return null;
                        },
                        textDirection: TextDirection.ltr,
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
                      const CustomSizedBox(value: .03),
                      const Align(
                        alignment: Alignment.topRight,
                        child: ResponsiveText(
                          text: 'تأكيد كلمة السر',
                          fontWeight: FontWeight.bold,
                          scaleFactor: .05,
                          color: AppColors.white,
                        ),
                      ),
                      const CustomSizedBox(value: .01),
                      TextFormField(
                        obscureText: true,
                        controller: confirmNewPasswordController,
                        focusNode: confirmNewPasswordFocus,
                        validator: (String? value) {
                          if (value == null) {
                            return 'قيمه فارغه';
                          }
                          if (value != newPasswordController.text) {
                            return 'يجب ان تعيد كلمه المرور';
                          }
                          return null;
                        },
                        textDirection: TextDirection.ltr,
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
                      BlocProvider(
                        create: (context) =>
                            ForgetPasswordCubit(ForgetPasswordRepo()),
                        child: BlocConsumer<ForgetPasswordCubit,
                            ForgetPasswordState>(
                          listener: (context, state) {
                            if (state is NewForgetPasswordSuccessState) {
                              showSnackBarWidget(
                                  context: context,
                                  message: 'تم تغير كلمه السر بنجاح',
                                  requestStates: RequestStates.success);
                             // navigateOff(MainView());
                            } else if (state is NewForgetPasswordErrorState) {
                              showErrorAwesomeDialog(
                                  context, 'تنبيه', state.message);
                            }
                          },
                          builder: (context, state) {
                            return state is NewForgetPasswordLoadingState
                                ? const CustomLoadingWidget()
                                : InkWell(
                                    onTap: () {
                                      if (formKey.currentState!.validate()) {
                                        ForgetPasswordCubit.get(context)
                                            .newPassword(newPasswordController
                                                .text
                                                .trim());
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
                                          color: const Color(0xff3FD227)),
                                      child: const ResponsiveText(
                                        text: ' حفظ',
                                        scaleFactor: .05,
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  );
                          },
                        ),
                      ),
                    ],
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
