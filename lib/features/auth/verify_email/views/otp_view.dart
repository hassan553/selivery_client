import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/show_awesomeDialog.dart';
import '../../../../core/rescourcs/app_colors.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../../../../core/widgets/custom_sized_box.dart';
import '../../../../core/widgets/snack_bar_widget.dart';

import '../../../../core/functions/global_function.dart';
import '../../../../core/widgets/responsive_text.dart';
import '../../cubit/otp_cubit/otp_cubit.dart';
import '../../data/data_source/verify_email_repo.dart';

class VerifyEmailOTPView extends StatefulWidget {
  final Widget screen;
  final String email;

  const VerifyEmailOTPView(
      {super.key, required this.screen, required this.email});

  @override
  State<VerifyEmailOTPView> createState() => _VerifyEmailOTPViewState();
}

class _VerifyEmailOTPViewState extends State<VerifyEmailOTPView> {
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
    BlocProvider.of<OtpCubit>(context).resendEmailVerifyCode(email);
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
        create: (context) => OtpCubit(VerifyEmailAddressRepo()),
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

  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<OtpCubit, OtpState>(
              listener: (context, state) {
                if (state is OtpSuccessState) {
                  navigateOff(widget.screen);
                }
                if (state is OtpErrorState) {
                  showErrorAwesomeDialog(context, 'تنبيه', state.message);
                }
              },
              builder: (context, state) => state is OtpLoadingState
                  ? const CustomLoadingWidget()
                  : TextFormField(
                      controller: controller,
                      autofocus: true,
                      onFieldSubmitted: (value) {
                        if (formKey.currentState!.validate()) {
                          if (controller.text.length == 6) {
                            OtpCubit.get(context).verifyEmailWithCode(
                                widget.email, controller.text.trim());
                          } else {
                            showErrorAwesomeDialog(context, 'تنبيه',
                                "كود الدخال يجب ان لا يقل عن 6 احرف");
                          }
                        }
                      },
                      keyboardType: TextInputType.none,
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
                      OtpCubit.get(context)
                          .verifyEmailWithCode(widget.email, controller.text);
                    } else {
                      showErrorAwesomeDialog(context, 'تنبيه',
                          "كود الدخال يجب ان لا يقل عن 6 احرف");
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
