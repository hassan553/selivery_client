import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/rescourcs/app_colors.dart';

class EditField extends StatelessWidget {
  final String prefix;
  final TextEditingController hint;
  final bool? isEnable;
  final String? Function(String?)? validate;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputType? type;
  const EditField(
      {super.key,
      required this.hint,
      required this.prefix,
      this.isEnable = true,
      this.validate,
      this.inputFormatter,this.type});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: hint,
      onChanged: (value) {},
      onTapOutside: (value) {
        FocusScope.of(context).unfocus();
      },
      inputFormatters: inputFormatter,
      keyboardType: type,
      validator: validate,
      style: const TextStyle(color: AppColors.black),
      textDirection: TextDirection.ltr,
      cursorColor: AppColors.black,
      decoration: InputDecoration(
        enabled: isEnable ?? true,
        prefixText: prefix,
        prefixStyle: const TextStyle(color: AppColors.black),
        prefixIcon: Icon(
          Icons.edit,
          size: 20,
          color: AppColors.black.withOpacity(.7),
        ),
        disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.black)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.black)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.black)),
      ),
    );
  }
}
