import 'package:get/get.dart';
import '../../../core/functions/checkinternet.dart';
import '../../../core/functions/global_function.dart';
import '../../../core/services/cache_storage_services.dart';
import '../../auth/data/data_source/google_sigin.dart';
import '../../auth/presentation/view/login_view.dart';
import '../../profile/controller/client_profile_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/contants/strings.dart';
import '../../../core/helper/notifictions_helper.dart';
import '../../../core/widgets/snack_bar_widget.dart';

class SettingController extends GetxController {
  void openWhatsApp() async {
    try {
      final url = Uri.parse('https://wa.me/+965 6663 0325');
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

  final _clientController = Get.find<ClientProfileController>();
  logout() {
    if (_clientController.clientProfileModel?.googleId != null) {
      googleLogOut();
    }
    CacheStorageServices().clear();
    navigateOff(const ClientLoginView());
  }
}
