import 'package:flutter/material.dart';
import '../../../core/functions/global_function.dart';

import '../../../core/rescourcs/app_colors.dart';
import '../../../core/widgets/responsive_text.dart';

class BuyRentalCarFormWidget extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  const BuyRentalCarFormWidget({super.key, required this.title, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FittedBox(
          child: ResponsiveText(
            text: title,
            scaleFactor: .05,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: screenSize(context).width * .6,
          child: TextField(
            controller: controller ,
            cursorColor: AppColors.black,
            decoration: InputDecoration(
              enabled: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
