import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import '../functions/global_function.dart';

showAwesomeDialog(
    BuildContext context, String? title, String? description, Widget? screen) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.info,
    animType: AnimType.rightSlide,
    title: title,
    desc: description,
    btnCancelOnPress: () {},
    btnOkOnPress: () => screen == null ? null : navigateTo(screen),
  ).show();
}

showErrorAwesomeDialog(
  BuildContext context,
  String? title,
  String? description,
) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.info,
    animType: AnimType.rightSlide,
    title: title,
    desc: description,
    btnOkOnPress: () {},
  ).show();
}
