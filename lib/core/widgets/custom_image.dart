import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../contants/api.dart';
import '../rescourcs/app_colors.dart';

class CustomAssetsImage extends StatelessWidget {
  final String? path;
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
      path??'',
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
  String checkImage(String? image) {
    try {
      if (image == null) {
        return '';
      }
      String i = '${baseUri}images\\$image';
      print(i);
      if (i == baseUri) {
        return '';
      }
      return i;
    } on PlatformException catch (e) {
      print('e${e.toString()}');
      return '';
    } catch (error) {
      print(error.toString());
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    print('image$imagePath');
    return Image.network(
      checkImage(imagePath),
      fit: boxFit,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
            color: AppColors.primaryColor,
          ),
        );
      },
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return const Icon(Icons.error);
      },
    );
  }
}
