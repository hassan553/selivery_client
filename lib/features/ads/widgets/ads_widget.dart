import 'package:flutter/material.dart';
import '../../../core/functions/global_function.dart';
import '../../../core/rescourcs/app_colors.dart';
import '../../../core/widgets/custom_image.dart';
import '../../../core/widgets/responsive_text.dart';
import '../model/ads_model.dart';
import 'web_view_widget.dart';

Column customAdsWidget(BuildContext context, int index, AdsModel model) {
    return Column(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
              color: AppColors.primaryColor,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ResponsiveText(
              text: '# الإعلان ${index + 1} ',
              scaleFactor: .04,
              color: AppColors.black,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Align(alignment: Alignment.centerRight, child: Text(model.name ?? '')),
        const SizedBox(height: 8),
        Align(
            alignment: Alignment.centerRight,
            child: Text(model.description ?? '')),
        const SizedBox(height: 8),
        SizedBox(
          width: screenSize(context).width,
          height: 120,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox.expand(
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.primaryColor)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CustomNetworkImage(
                      imagePath: model.image,
                      boxFit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () => navigateTo(WebPage(link: model.link ?? '')),
                child: Card(
                  elevation: 10,
                  semanticContainer: true,
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox(
                      width: 80,
                      child: Image.asset(
                        'assets/Screenshot 2023-11-05 224007.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // const CustomSizedBox(value: .02),
        // Row(
        //   children: [
        //     Expanded(
        //       child: Container(
        //         height: 50,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10),
        //           color: AppColors.primaryColor,
        //         ),
        //         padding:
        //             const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        //         child: FittedBox(
        //           child: Row(
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             children: [
        //                CustomAssetsImage(
        //                   width: 20,
        //                   path: 'assets/Natural User Interface 5.png'),
        //               ResponsiveText(
        //                 text: 'عدد النقرات :${model.views} ',
        //                 scaleFactor: .03,
        //                 color: AppColors.white,
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //     const SizedBox(width: 3),
        //     Container(
        //       height: 50,
        //       width: 1,
        //       color: Colors.black,
        //     ),
        //     const SizedBox(width: 3),
        //     Expanded(
        //       child: InkWell(
        //         onTap: () {
        //         },
        //         child: Container(
        //           height: 50,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //             color: Colors.red,
        //           ),
        //           padding:
        //               const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        //           child: const FittedBox(
        //             child: Row(
        //               children: [
        //                 ResponsiveText(
        //                   text: 'حذف الإعلان ',
        //                   scaleFactor: .03,
        //                   color: AppColors.white,
        //                 ),
        //                 Icon(
        //                   Icons.delete,
        //                   color: AppColors.white,
        //                   size: 20,
        //                 )
        //               ],
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        // const SizedBox(height: 20),
      ],
    );
  }
