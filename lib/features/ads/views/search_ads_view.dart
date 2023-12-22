import 'package:flutter/material.dart';
import 'package:selivery_client/core/widgets/custom_appBar.dart';
import 'package:selivery_client/core/widgets/custom_text_filed.dart';
import 'package:selivery_client/features/ads/controller/ads_controller.dart';
import 'package:selivery_client/features/ads/widgets/ads_widget.dart';
import 'package:get/get.dart';
import '../../../core/rescourcs/app_colors.dart';

class SearchAdsView extends StatefulWidget {
  const SearchAdsView({super.key});

  @override
  State<SearchAdsView> createState() => _SearchAdsViewState();
}

class _SearchAdsViewState extends State<SearchAdsView> {
  final searchController = TextEditingController();
  final controller = Get.find<AdsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  height: 70,
                  width: 60,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.primaryColor),
                  child: InkWell(
                      onTap: () => searchController.clear(),
                      child:
                          const Icon(Icons.clear, color: Colors.red, size: 35)),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomTextFieldWidget(
                      autoFocus: true,
                      onChange: (p0) {
                        controller.searchText.value = p0;
                      },
                      controller: searchController,
                      borderColor: AppColors.primaryColor,
                      hintText: 'ابحث'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(
                () => controller.filteredList.isEmpty
                    ? const Center(
                        child: Text(
                          'لا توجد بيانات',
                          style:
                              TextStyle(color: AppColors.black, fontSize: 25),
                        ),
                      )
                    : ListView.builder(
                        itemBuilder: (context, index) => customAdsWidget(
                            context, index, controller.filteredList[index]),
                        itemCount: controller.filteredList.length,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
