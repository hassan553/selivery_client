import 'package:flutter/material.dart';
import '../../../core/rescourcs/app_colors.dart';

import '../../../core/functions/global_function.dart';

class CategoryItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final bool isRental;
  final Widget screen;
  const CategoryItem(
      {super.key,
      required this.isRental,
      required this.imagePath,
      required this.title,required this.screen});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateTo(screen),
      child: Container(
            width: screenSize(context).width,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Stack(
              alignment: Alignment.center,
              children: [
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.srcATop,
                  ),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.fill,
                    height: screenSize(context).height*.2,
                    width: screenSize(context).width,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/tap.png'),
                    const SizedBox(width: 10),
                    Text(
                      title,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        
      
    );
  }
}
