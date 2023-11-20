import 'package:flutter/material.dart';
import '../../../core/functions/global_function.dart';
import '../../../core/widgets/custom_appBar.dart';
import '../../../core/widgets/custom_image.dart';

class TripView extends StatelessWidget {
  const TripView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomAssetsImage(
            path: 'assets/unnamed 1.png',
            width: screenSize(context).width,
            height: screenSize(context).height,
            boxFit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
