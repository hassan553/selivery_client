// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../rescourcs/app_colors.dart';

class CustomAssetsImage extends StatelessWidget {
  final String path;
  double? width;
  double? height;
  BoxFit? boxFit;
  CustomAssetsImage({
    Key? key,
    required this.path,
    this.width,
    this.height,
    this.boxFit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: width,
      height: height,
      fit: boxFit,
    );
  }
}

class CustomNetworkImage extends StatelessWidget {
  final String? imagePath;
  final double? width;
  final double? height;
  final BoxFit? boxFit;
  const CustomNetworkImage({
    super.key,
    this.imagePath,
    this.width,
    this.height,
    this.boxFit,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imagePath??'',
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return CircularProgressIndicator(
          value: loadingProgress.expectedTotalBytes != null
              ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes!
              : null,
          color: AppColors.primaryColor,
        );
      },
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return const Icon(Icons.error);
      },
    );
  }
}
