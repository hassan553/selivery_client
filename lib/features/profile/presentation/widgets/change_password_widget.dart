import 'package:flutter/material.dart';
import 'package:selivery_client/core/widgets/custom_loading_widget.dart';

import '../../../../core/rescourcs/app_colors.dart';
import '../../../../core/widgets/custom_sized_box.dart';
import '../../../../core/widgets/responsive_text.dart';
import '../../controller/client_profile_controller.dart';
import 'package:get/get.dart';

class MyDialog extends StatefulWidget {
  const MyDialog({super.key});

  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  final controller = Get.find<ClientProfileController>();
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  var newPasswordFocus = FocusNode();
  var confirmNewPasswordFocus = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isObscure = true;

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    newPasswordFocus.dispose();
    confirmNewPasswordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        height: 450.0,
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'تغير كلمه المرور',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 25),
              const Align(
                alignment: Alignment.topRight,
                child: ResponsiveText(
                  text: ' كلمة السر القديمه',
                  fontWeight: FontWeight.bold,
                  scaleFactor: .05,
                  color: AppColors.black,
                ),
              ),
              TextFormField(
                controller: oldPasswordController,
                focusNode: newPasswordFocus,
                onFieldSubmitted: (value) => FocusScope.of(context)
                    .requestFocus(confirmNewPasswordFocus),
                validator: (String? value) {
                  if (value == null) {
                    return 'قيمه فارغه';
                  }

                  return null;
                },
                textDirection: TextDirection.rtl,
                obscureText: isObscure,
                decoration: InputDecoration(
                  fillColor: AppColors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: AppColors.black),
                  ),
                  prefixIcon: const Icon(Icons.lock, color: Colors.black),
                ),
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.topRight,
                child: ResponsiveText(
                  text: ' كلمة السر الجديده',
                  fontWeight: FontWeight.bold,
                  scaleFactor: .05,
                  color: AppColors.black,
                ),
              ),
              TextFormField(
                obscureText: isObscure,
                controller: newPasswordController,
                focusNode: confirmNewPasswordFocus,
                validator: (String? value) {
                  if (value == null) {
                    return 'قيمه فارغه';
                  }
                  if (value.length < 6) {
                    return 'كلمة مرور قصيرة . على الأقل 6 خانات';
                  }
                  return null;
                },
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  fillColor: AppColors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: AppColors.black),
                  ),
                  prefixIcon: const Icon(Icons.lock, color: Colors.black),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: isObscure,
                    onChanged: (bool? value) {
                      setState(() {
                        isObscure = value ?? true;
                      });
                    },
                  ),
                  const Text('اخفاء كلمة المرور'),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GetBuilder<ClientProfileController>(
                    builder: (controller) => controller.changePassIsLoading
                        ? const CustomLoadingWidget()
                        : ElevatedButton(
                            style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all<Size>(
                                  const Size(100, 50)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.primaryColor),
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                controller.changePassword(
                                    context: context,
                                    newPassword:
                                        newPasswordController.text.trim(),
                                    oldPassord:
                                        oldPasswordController.text.trim());
                              }
                            },
                            child: const Text('حفظ'),
                          ),
                  ),
                  const SizedBox(width: 25),
                  ElevatedButton(
                    style: ButtonStyle(
                      fixedSize:
                          MaterialStateProperty.all<Size>(const Size(100, 50)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('اغلاق'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
