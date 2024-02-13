import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/custom_appBar.dart';
import '../../../core/widgets/custom_loading_widget.dart';
import '../../../core/widgets/error_componant.dart';
import '../controller/ads_controller.dart';
import '../widgets/ads_widget.dart';

class AllAdsView extends StatefulWidget {
  const AllAdsView({super.key});

  @override
  State<AllAdsView> createState() => _AllAdsViewState();
}

class _AllAdsViewState extends State<AllAdsView> {
  final controller = Get.put(AdsController());
  @override
  void initState() {
    super.initState();
    controller.getAllAdsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(150),
      //   child: InkWell(
      //     onTap: () => navigateTo(const SearchAdsView()),
      //     child: customAppBarForSearch(context),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Obx(
          () => controller.isLoading.value
              ? const CustomLoadingWidget()
              : controller.allAdsList.isEmpty
                  ? ErrorComponant(
                      function: controller.getAllAdsData,
                      message: controller.allAdsDataError.value)
                  : ListView.builder(
                      itemBuilder: (context, index) => customAdsWidget(
                          context, index, controller.allAdsList[index]),
                      itemCount: controller.allAdsList.length,
                    ),
        ),
      ),
    );
  }
}
