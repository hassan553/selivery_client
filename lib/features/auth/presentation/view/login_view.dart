import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/show_awesomeDialog.dart';
import '../../../../../core/widgets/custom_loading_widget.dart';
import '../../../../../core/widgets/visibility_icon.dart';
import '../../../home/views/main_view.dart';
import '../../data/data_source/client_auth_repo.dart';
import '../../../../../core/functions/global_function.dart';
import '../../../../../core/rescourcs/app_colors.dart';
import '../../../../../core/widgets/build_rich_text.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_image.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import '../../../../../core/widgets/custom_text_filed.dart';
import '../../../../../core/widgets/snack_bar_widget.dart';
import '../../cubit/login/client_login_cubit.dart';
import '../../forget_password/view/forget_password_view.dart';
import '../../verify_email/views/otp_view.dart';
import 'register_view.dart';

class ClientLoginView extends StatefulWidget {
  const ClientLoginView({super.key});

  @override
  State<ClientLoginView> createState() => _ClientLoginViewState();
}

class _ClientLoginViewState extends State<ClientLoginView> {
  final email = TextEditingController();
  final password = TextEditingController();
  var emailFocus = FocusNode();
  var passwordFocus = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isObscure = true;
  changeIcon() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocProvider(
        create: (context) => ClientLoginCubit(ClientAuthRepo()),
        child: BlocConsumer<ClientLoginCubit, ClientLoginState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = ClientLoginCubit.get(context);
            return Center(
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
                          controller: email,
                          hintText: 'البريد الاكتروني',
                          focusNode: emailFocus,
                          submit: (p0) => FocusScope.of(context)
                              .requestFocus(passwordFocus),
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
                          hintText: 'كلمه السر',
                          focusNode: passwordFocus,
                          obscure: isObscure,
                          suffixIcon:InkWell(
                            onTap:()=>changeIcon(),
                            child: Icon(isObscure?  Icons.visibility_off_outlined: Icons.visibility_outlined,color: AppColors.black)),
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
                        SizedBox(height: screenSize(context).height * .02),
                        CustomTextButton(
                            function: () =>
                                navigateTo(const ClientForgetPasswordView()),
                            color: AppColors.primaryColor,
                            title: 'لا اتذكر كلمه المرور'),
                        SizedBox(height: screenSize(context).height * .03),
                        BlocConsumer<ClientLoginCubit, ClientLoginState>(
                            listener: (context, state) {
                          if (state is ClientLoginSuccess) {
                            showSnackBarWidget(
                                context: context,
                                message: 'تم تسجيل الدخوال بنجاح',
                                requestStates: RequestStates.success);
                            navigateOff(MainView());
                          } else if (state is ClientSndCodeToEmailState) {
                            showSnackBarWidget(
                                context: context,
                                message:
                                    "لقد تم ارسال كود التحقق الي بريدك الاكتروني",
                                requestStates: RequestStates.success);
                            navigateOff(VerifyEmailOTPView(
                              email: email.text,
                              screen: MainView(),
                            ));
                          } else if (state is ClientLoginError) {
                            showErrorAwesomeDialog(
                                context, 'تنبيه', state.message);
                          }
                        }, builder: (context, state) {
                          if (state is ClientLoginLoading) {
                            return const CustomLoadingWidget();
                          }
                          return CustomButton(
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  BlocProvider.of<ClientLoginCubit>(context)
                                      .login(email.text.trim(),
                                          password.text.trim());
                                }
                                FocusManager.instance.primaryFocus!.unfocus();
                              },
                              color: AppColors.primaryColor,
                              title: 'تسجيل الدخوال');
                        }),
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
              ),
            );
          },
        ),
      ),
    );
  }
}
