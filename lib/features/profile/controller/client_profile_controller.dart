import 'package:get/get.dart';
import 'package:selivery_client/core/functions/checkinternet.dart';

import '../data/model/client_profile_model.dart';
import '../data/repository/client_profile_repo.dart';

class ClientProfileController extends GetxController {
  ClientProfileRepo clientProfileRepo = ClientProfileRepo();
  bool isLoading = false;
  String errorMessage = '';
  ClientProfileModel? clientProfileModel;
  void getClientProfile() async {
    if (await checkInternet()) {
      isLoading = true;
      update();
      final result = await clientProfileRepo.getClientProfile();
      result.fold((l) {
        isLoading = false;
        errorMessage = l;
      }, (r) {
        isLoading = false;
        clientProfileModel = r;
      });
    } else {
      errorMessage = 'لا يوجد اتصال بالانترنت';
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getClientProfile();
  }
}
