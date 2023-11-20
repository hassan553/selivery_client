import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_loading_widget.dart';
import '../../../../../core/widgets/show_awesomeDialog.dart';
import '../../cubit/register/client_register_cubit.dart';
import '../../../../../core/functions/global_function.dart';
import '../../../../../core/rescourcs/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_image.dart';
import '../../../../../core/widgets/custom_text_filed.dart';
import '../../../../../core/widgets/snack_bar_widget.dart';


import '../../../../../core/widgets/build_rich_text.dart';

import '../../data/data_source/client_auth_repo.dart';

class ClientRegisterView extends StatefulWidget {
  const ClientRegisterView({super.key});

  @override
  State<ClientRegisterView> createState() => _ClientRegisterViewState();
}

class _ClientRegisterViewState extends State<ClientRegisterView> {
  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  var emailFocus = FocusNode();
  var passwordFocus = FocusNode();
  var nameFocus = FocusNode();

  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    nameFocus.dispose();
    name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocProvider(
        create: (context) => ClientRegisterCubit(ClientAuthRepo()),
        child: InkWell(
          onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenSize(context).height * .06),
                      Align(
                          alignment: Alignment.center,
                          child: CustomAssetsImage(
                              path: 'assets/Young man ordering taxi.png')),
                      const Center(
                          child: CustomRichText(
                        color: AppColors.primaryColor,
                        imagePath: 'assets/image.png',
                      )),
                      SizedBox(height: screenSize(context).height * .05),
                      CustomTextFieldWidget(
                        controller: name,
                        focusNode: nameFocus,
                        submit: (p0) =>
                            FocusScope.of(context).requestFocus(emailFocus),
                        hintText: 'الاسم',
                        valid: (String? value) {
                          if (value == null) {
                            return 'قيمة فارغة غير صالحة';
                          }
                        },
                      ),
                      SizedBox(height: screenSize(context).height * .03),
                      CustomTextFieldWidget(
                        controller: email,
                        hintText: 'البريد الاكتروني',
                        focusNode: emailFocus,
                        submit: (p0) =>
                            FocusScope.of(context).requestFocus(passwordFocus),
                        valid: (String? value) {
                          if (value == null) {
                            return 'قيمة فارغة غير صالحة';
                          }
                          if (!value.contains('@')) {
                            return 'الرجاء إدخال بريد إلكتروني صحيح';
                          }
                        },
                      ),
                      SizedBox(height: screenSize(context).height * .03),
                      CustomTextFieldWidget(
                        controller: password,
                        obscure: true,
                        hintText: 'كلمه السر',
                        focusNode: passwordFocus,
                        valid: (String? value) {
                          if (value == null) {
                            return 'قيمه فارغه';
                          }
                          if (value.length < 6) {
                            return 'كلمة مرور قصيرة . على الأقل 6 خانات';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: screenSize(context).height * .05),
                      BlocConsumer<ClientRegisterCubit, ClientRegisterState>(
                          listener: (context, state) {
                        if (state is ClientRegisterSuccess) {
                          showSnackBarWidget(
                              context: context,
                              message: 'تم انشاء الحساب بنجاح',
                              requestStates: RequestStates.success);
                          // navigateOff(VerifyEmailOTPView(
                          //   email: email.text,
                          //   screen: MainView(),
                          // ));
                        } else if (state is ClientRegisterError) {
                          
                        showErrorAwesomeDialog(
                              context, 'تنبيه', state.message);
                        }
                      }, builder: (context, state) {
                        if (state is ClientRegisterLoading) {
                          return const CustomLoadingWidget();
                        }
                        return CustomButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<ClientRegisterCubit>(context)
                                    .register(
                                        name.text.trim(),
                                        email.text.trim(),
                                        password.text.trim());
                              }
                              FocusManager.instance.primaryFocus!.unfocus();
                            },
                            color: AppColors.primaryColor,
                            title: 'ان شاء حساب');
                      }),
                      SizedBox(height: screenSize(context).height * .03),
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
