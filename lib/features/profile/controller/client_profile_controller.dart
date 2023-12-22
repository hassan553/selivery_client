import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selivery_client/core/functions/checkinternet.dart';
import 'package:selivery_client/core/widgets/snack_bar_widget.dart';

import '../../../core/services/cache_storage_services.dart';
import '../data/model/client_profile_model.dart';
import '../data/repository/client_profile_repo.dart';

class ClientProfileController extends GetxController {
  ClientProfileRepo clientProfileRepo = ClientProfileRepo();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController ageController = TextEditingController(text: '0');
  final TextEditingController password = TextEditingController(text: '*****');

  bool isLoading = false;
  String errorMessage = '';
  ClientProfileModel? clientProfileModel;
  void getClientProfile() async {
    print("this token ${CacheStorageServices().token}");
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
        errorMessage = '';
      });
    } else {
      errorMessage = 'لا يوجد اتصال بالانترنت';
    }
    update();
  }

  bool changePassIsLoading = false;
  void changePassword(
      {required context,
      required String newPassword,
      required String oldPassord}) async {
    if (await checkInternet()) {
      changePassIsLoading = true;
      update();
      final result = await clientProfileRepo.updateClientPassword(
          newPassword: newPassword, oldPassword: oldPassord);
      result.fold((l) {
        changePassIsLoading = false;
        showSnackBarWidget(
            context: context, message: l, requestStates: RequestStates.error);
      }, (r) {
        changePassIsLoading = false;
        showSnackBarWidget(
            context: context,
            message: 'تم التغير بنجاح',
            requestStates: RequestStates.success);
      });
    } else {
      showSnackBarWidget(
          context: context,
          message: 'لا يوجد اتصال بالانترنت',
          requestStates: RequestStates.error);
    }
    update();
  }

  bool updateProfileLoading = false;
  void updateProfile(
      {required context,
      required String name,
      required String phone,
      required String gender,
      required String age}) async {
    if (await checkInternet()) {
      updateProfileLoading = true;
      update();
      final result = await clientProfileRepo.updateClientProfileInfo(
          age: int.parse(age), gender: gender, name: name, phone: phone);
      result.fold((l) {
        updateProfileLoading = false;
        showSnackBarWidget(
            context: context, message: l, requestStates: RequestStates.error);
      }, (r) {
        updateProfileLoading = false;
        showSnackBarWidget(
            context: context,
            message: 'تم التغير بنجاح',
            requestStates: RequestStates.success);
        getClientProfile();
      });
    } else {
      showSnackBarWidget(
          context: context,
          message: 'لا يوجد اتصال بالانترنت',
          requestStates: RequestStates.error);
    }
    update();
  }

  bool changeImageLoding = false;
  changePicture(context) async {
    if (await checkInternet()) {
      try {
        changeImageLoding = true;
        update();
        await clientProfileRepo.pickClientImage();
        changeImageLoding = false;
        showSnackBarWidget(
            context: context,
            message: 'تم التغير بنجاح',
            requestStates: RequestStates.success);
      } catch (error) {
        changeImageLoding = false;
        showSnackBarWidget(
            context: context,
            message: "لقد حدث خطا",
            requestStates: RequestStates.error);
      }
    } else {
      showSnackBarWidget(
          context: context,
          message: 'لا يوجد اتصال بالانترنت',
          requestStates: RequestStates.error);
    }
    update();
  }

  void setControllers() {
    try {
      nameController.text = clientProfileModel?.name ?? '';
      ageController.text = clientProfileModel?.age.toString() ?? '';
      password.text = '********';
      phoneController.text = clientProfileModel?.phone ?? '';
      genderController.text = clientProfileModel?.gander ?? '';
      update();
    } catch (error) {}
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
    nameController.dispose();
    genderController.dispose();
    phoneController.dispose();
    password.dispose();
    super.dispose();
  }
}
