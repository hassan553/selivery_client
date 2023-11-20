import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String title;
  double fontSize;
  Color? color;
  FontWeight? fontWeight;
  CustomText(
      {super.key,
      required this.title,
      this.fontWeight,
      this.color,
      this.fontSize=16});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}
