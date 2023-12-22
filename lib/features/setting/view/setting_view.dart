import 'package:flutter/material.dart';
import 'package:selivery_client/core/services/cache_storage_services.dart';
import 'package:selivery_client/features/setting/controller/setting_controller.dart';
import '../../../core/functions/global_function.dart';
import '../../../core/widgets/custom_image.dart';
import '../../../core/widgets/custom_sized_box.dart';
import '../../../core/widgets/responsive_text.dart';
import '../../../core/rescourcs/app_colors.dart';
import '../../../core/widgets/custom_appBar.dart';
import 'package:get/get.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  final controller = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: customAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            languageWidget(),
            const CustomSizedBox(value: .03),
            notificationWidget(),
            const CustomSizedBox(value: .03),
            settingWidget('assets/Man On Phone.png', ' تواصل معنا'),
            const CustomSizedBox(value: .03),
            logoutWidget(context),
          ],
        ),
      ),
    );
  }

  Container socialAccountWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xff262E2D),
      ),
      child: FittedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAssetsImage(
              path: 'assets/whatsApp.png',
              width: screenSize(context).width * .08,
              boxFit: BoxFit.fill,
            ),
            const ResponsiveText(
              text: 'واتساب',
              scaleFactor: .04,
              color: Colors.white,
            ),
            const ResponsiveText(
              text: '01115690625',
              scaleFactor: .04,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            CustomAssetsImage(
              path: 'assets/Group 22.png',
              width: screenSize(context).width * .08,
              boxFit: BoxFit.fill,
            ),
            const ResponsiveText(
              text: 'www.facebook.com/MahmoudAd.3?md',
              scaleFactor: .04,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget logoutWidget(BuildContext context) {
    return InkWell(
      onTap: ()async {
       await controller.logout();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.logout,
            color: Colors.red,
            size: screenSize(context).width * .07,
          ),
          const SizedBox(width: 5),
          const ResponsiveText(
            text: 'تسجيل الخروج',
            scaleFactor: .06,
            color: Colors.red,
          ),
        ],
      ),
    );
  }

  Widget settingWidget(String imagePath, String title) {
    return InkWell(
      onTap: () => controller.openWhatsApp(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomAssetsImage(path: imagePath),
          ResponsiveText(
            text: title,
            scaleFactor: .06,
          ),
        ],
      ),
    );
  }

  Row ringtoneWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomAssetsImage(path: 'assets/Musical Notes.png'),
            const ResponsiveText(
              text: 'نغمة رنين الإشعار',
              scaleFactor: .06,
            ),
          ],
        ),
        const Spacer(
          flex: 3,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xff262E2D),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.arrow_drop_down,
                color: AppColors.white,
              ),
              ResponsiveText(
                text: 'voice 1',
                scaleFactor: .04,
                color: AppColors.white,
              ),
            ],
          ),
        ),
        const Spacer(
          flex: 1,
        ),
      ],
    );
  }

  Widget notificationWidget() {
    return GetBuilder<SettingController>(
      builder: (controller) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomAssetsImage(path: 'assets/Doorbell.png'),
              const ResponsiveText(
                text: 'الإشعارات',
                scaleFactor: .06,
              ),
            ],
          ),
          const Spacer(
            flex: 3,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.primaryColor.withOpacity(.02)),
            child: Row(
              children: [
                InkWell(
                  onTap: () => controller.subscribe(context),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      color: CacheStorageServices().isEnalbed
                          ? Colors.green
                          : const Color(0xff262E2D),
                    ),
                    child: const ResponsiveText(
                      text: 'تفعيل',
                      scaleFactor: .04,
                      color: AppColors.white,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => controller.unSubscribe(context),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        topLeft: Radius.circular(8),
                      ),
                      color: CacheStorageServices().isEnalbed
                          ? AppColors.primaryColor.withOpacity(.3)
                          : Colors.green,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomAssetsImage(path: 'assets/No Audio.png'),
                        const SizedBox(width: 3),
                        const ResponsiveText(
                          text: 'كتم',
                          scaleFactor: .04,
                          color: AppColors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }

  Row languageWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomAssetsImage(path: 'assets/Geography.png'),
            const ResponsiveText(
              text: 'اللغه',
              scaleFactor: .06,
            ),
          ],
        ),
        const Spacer(
          flex: 3,
        ),
        const ResponsiveText(
          text: 'العربية',
          scaleFactor: .06,
        ),
        const Spacer(
          flex: 1,
        ),
      ],
    );
  }
}
