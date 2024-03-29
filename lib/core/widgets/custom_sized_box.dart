import 'package:flutter/material.dart';

import '../functions/global_function.dart';

class CustomSizedBox extends StatelessWidget {
  final double value;
  const CustomSizedBox({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize(context).height * value,
    );
  }
}
