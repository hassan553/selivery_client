import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selivery_client/core/functions/checkinternet.dart';

import '../data/model/client_profile_model.dart';
import '../data/repository/client_profile_repo.dart';

class ClientProfileController extends GetxController {
  ClientProfileRepo clientProfileRepo = ClientProfileRepo();
  final TextEditingController gander = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController age = TextEditingController(text: '0');
  final TextEditingController password = TextEditingController();

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
    void setControllers() {
    name.text = clientProfileModel?.name ?? ' ';
    age.text = clientProfileModel?.age.toString() ?? '0';
    password.text = clientProfileModel?.password ?? ' ';
    phone.text = clientProfileModel?.phone ?? ' ';
    gander.text = clientProfileModel?.gander ?? ' ';
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getClientProfile();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    name.dispose();
    gander.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
