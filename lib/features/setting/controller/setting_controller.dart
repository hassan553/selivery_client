import 'package:get/get.dart';
import 'package:selivery_client/core/functions/checkinternet.dart';
import 'package:selivery_client/core/services/cache_storage_services.dart';
import 'package:selivery_client/core/widgets/show_awesomeDialog.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/contants/strings.dart';
import '../../../core/helper/notifictions_helper.dart';
import '../../../core/widgets/snack_bar_widget.dart';

class SettingController extends GetxController {
  void openWhatsApp() async {
    try {
      final url = Uri.parse('https://wa.me/+201003208297');
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'لقد حدث خطا';
      }
    } catch (error) {}
  }

  subscribe(context) async {
    if (await checkInternet()) {
      FirebaseMessagingService.subscribeToTopic(topic);
      CacheStorageServices().setTopic(true);
    } else {
      showSnackBarWidget(
          context: context,
          message: 'لا يوجد اتصال بالانترنت',
          requestStates: RequestStates.error);
    }
    update();
  }

  unSubscribe(context) async {
    if (await checkInternet()) {
      FirebaseMessagingService.unsubscribeFromTopic(topic);
      CacheStorageServices().setTopic(false);
    } else {
      showSnackBarWidget(
          context: context,
          message: 'لا يوجد اتصال بالانترنت',
          requestStates: RequestStates.error);
    }
    update();
  }
}
