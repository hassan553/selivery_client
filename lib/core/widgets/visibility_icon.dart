import 'package:flutter/material.dart';

import '../rescourcs/app_colors.dart';

class VisibilityIconWidget extends StatefulWidget {
  bool isObscure;
  VisibilityIconWidget({super.key,required this.isObscure});

  @override
  State<VisibilityIconWidget> createState() => _VisibilityIconWidgetState();
}

class _VisibilityIconWidgetState extends State<VisibilityIconWidget> {

  void changeIcon() {
    setState(() {
      widget.isObscure = !widget.isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        changeIcon();
      },
      color: AppColors.black,
      icon: widget.isObscure
          ? const Icon(Icons.visibility_off_outlined)
          : const Icon(Icons.visibility_outlined),
    );
  }
}
