import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final dynamic keyboard;
  final dynamic iconData;
  final dynamic valid;
  final bool obscure;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final void Function(String)? submit;
  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscure = false,
    this.iconData,
    this.focusNode,
    this.keyboard,
    this.valid,
    this.submit,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      validator: valid,
      focusNode: focusNode,
      onFieldSubmitted: submit,
      controller: controller,
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.black),
      obscureText: obscure,
      keyboardType: keyboard,
      onTapOutside:(e)=> FocusManager.instance.primaryFocus!.unfocus(),
      decoration: InputDecoration(
        filled: true,
        hintText: hintText,
        fillColor: Colors.white,
        prefixIcon: Icon(
          iconData,
          color: Colors.black38,
          size: 25,
        ),
        suffixIcon: suffixIcon,
        hintStyle: const TextStyle(color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }
}
