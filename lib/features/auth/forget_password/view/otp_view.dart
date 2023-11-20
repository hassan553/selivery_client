import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selivery_client/features/auth/cubit/forget_password/forget_password_cubit.dart';
import '../../../../../../core/rescourcs/app_colors.dart';
import '../../../../../../core/widgets/custom_image.dart';
import '../../../../../../core/widgets/custom_loading_widget.dart';
import '../../../../../../core/widgets/custom_sized_box.dart';
import '../../../../../../core/widgets/show_awesomeDialog.dart';
import '../../../../../../core/widgets/snack_bar_widget.dart';
import '../../data/data_source/forgetpassword_repo.dart';
import '../../../../../../core/functions/global_function.dart';
import '../../../../../../core/widgets/responsive_text.dart';

class OTPView extends StatefulWidget {
  final Widget screen;
  final String email;

  const OTPView({super.key, required this.screen, required this.email});

  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  bool _isResendEnabled = false;
  int _resendCooldown = 6 * 60; // 6 minutes in seconds
  Timer? _resendCooldownTimer;

  @override
  void initState() {
    super.initState();
    _startResendCooldownTimer();
  }

  void _startResendCooldownTimer() {
    _resendCooldownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_resendCooldown > 0) {
          _resendCooldown--;
        } else {
          _isResendEnabled = false;
          _resendCooldownTimer?.cancel();
        }
      });
    });
  }

  void _handleResendCode(String email) {
    BlocProvider.of<ForgetPasswordCubit>(context)
        .reSendForgetPasswordVerificationCodeToEmail(email);
    setState(() {
      _isResendEnabled = true;
      _resendCooldown = 6 * 60; // Reset the cooldown
      _startResendCooldownTimer();
    });
  }

  @override
  void dispose() {
    _resendCooldownTimer?.cancel();
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
              alignment: Alignment.center,
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ResponsiveText(
                      text:
                          'لقد أرسلنا رسالة نصية قصيرة تحتوي على رمز إلى البريد الذي أدخلته',
                      fontWeight: FontWeight.bold,
                      scaleFactor: .05,
                      color: AppColors.white,
                    ),
                    const CustomSizedBox(value: .07),
                    CustomAssetsImage(
                      path: 'assets/orderCar.png',
                      width: screenSize(context).width * .8,
                    ),
                    TextButton(
                      onPressed: _isResendEnabled
                          ? () => _handleResendCode(widget.email)
                          : null,
                      child: Text(
                        _isResendEnabled
                            ? 'Resend Verification Code'
                            : 'Resend in $_resendCooldown seconds',
                        style: TextStyle(
                          color: _isResendEnabled ? Colors.blue : Colors.grey,
                        ),
                      ),
                    ),
                    NumericKeyboardScreen(
                        screen: widget.screen, email: widget.email),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

class NumericKeyboardScreen extends StatefulWidget {
  final Widget screen;
  final String email;

  const NumericKeyboardScreen(
      {super.key, required this.screen, required this.email});

  @override
  _NumericKeyboardScreenState createState() => _NumericKeyboardScreenState();
}

class _NumericKeyboardScreenState extends State<NumericKeyboardScreen> {
  final controller = TextEditingController();

  void _onKeyPressed(String value) {
    setState(() {
      controller.text += value;
    });
  }

  void _onDeletePressed() {
    setState(() {
      if (controller.text.isNotEmpty) {
        controller.text =
            controller.text.substring(0, controller.text.length - 1);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
              listener: (context, state) {
                if (state is ForgetPasswordOTPSuccessState) {
                  navigateOff(widget.screen);
                }
                if (state is ForgetPasswordOTPErrorState) {
                  showErrorAwesomeDialog(context, 'تنبيه', state.message);
                }
              },
              builder: (context, state) => state
                      is ForgetPasswordOTPCodeLoadingState
                  ? const CustomLoadingWidget()
                  : TextFormField(
                      controller: controller,
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      focusNode: FocusScopeNode(canRequestFocus: false),
                      cursorColor: AppColors.white,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.white)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.white)),
                      ),
                    ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildKeyboardButton('1'),
                _buildKeyboardButton('2'),
                _buildKeyboardButton('3'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildKeyboardButton('4'),
                _buildKeyboardButton('5'),
                _buildKeyboardButton('6'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildKeyboardButton('7'),
                _buildKeyboardButton('8'),
                _buildKeyboardButton('9'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildKeyboardButton('تم', onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (controller.text.length == 6) {
                      int intValue = int.parse(controller.text);
                      ForgetPasswordCubit.get(context)
                          .verifyEmailWithCode(widget.email, intValue);
                    } else {
                      showSnackBarWidget(
                          context: context,
                          message: "كود الدخال يجب ان لا يقل عن 6 احرف",
                          requestStates: RequestStates.error);
                    }
                  }
                }),
                _buildKeyboardButton('0'),
                _buildKeyboardButton('حذف', onPressed: _onDeletePressed),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeyboardButton(String label, {VoidCallback? onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
        ),
        onPressed: onPressed ?? () => _onKeyPressed(label),
        child: Text(
          label,
          style: const TextStyle(color: AppColors.black),
        ),
      ),
    );
  }
}
