import 'package:flutter/widgets.dart';
import 'custom_button.dart';
import '../functions/global_function.dart';
import '../rescourcs/app_colors.dart';

class ErrorComponant extends StatelessWidget {
  final Function() function;
  final String message;
  const ErrorComponant(
      {super.key, required this.function, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          const SizedBox(height: 10),
          SizedBox(
            width: screenSize(context).width * .3,
            child: CustomButton(
              function: () {
                function();
              },
              title: 'اعاده المحاوله',
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
