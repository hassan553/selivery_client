import 'package:flutter/material.dart';

import '../../../core/functions/global_function.dart';
import '../../../core/widgets/custom_image.dart';
import '../../../core/widgets/responsive_text.dart';

class RentalBuyCarAddImageWidget extends StatelessWidget {
  const RentalBuyCarAddImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FittedBox(
                    child: ResponsiveText(
                      text: 'صور السياره',
                      scaleFactor: .05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: screenSize(context).width * .6,
                    height: screenSize(context).height * .12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: CustomAssetsImage(path: 'assets/add_image.png'),
                  ),
                ],
              );
  }
}