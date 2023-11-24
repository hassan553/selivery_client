import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repository/client_profile_repo.dart';

import '../data/model/client_profile_model.dart';

part 'client_profile_state.dart';

class ClientProfileCubit extends Cubit<ClientProfileState> {
  final ClientProfileRepo _clientProfileRepo;
  final TextEditingController gander = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController age = TextEditingController(text: '0');
  final TextEditingController password = TextEditingController();

  ClientProfileCubit(this._clientProfileRepo) : super(ClientProfileInitial());

  static ClientProfileCubit get(context) => BlocProvider.of(context);
  ClientProfileModel? clientProfileModel;
  void setControllers() {
    name.text = clientProfileModel?.name ?? ' ';
    age.text = clientProfileModel?.age.toString() ?? '0';
    password.text = clientProfileModel?.password ?? ' ';
    phone.text = clientProfileModel?.phone ?? ' ';
    gander.text = clientProfileModel?.gander ?? ' ';
  }

  void getClientProfile() async {
    emit(ClientProfileLoading());
    final result = await _clientProfileRepo.getClientProfile();
    result.fold((l) => emit(ClientProfileError()), (r) {
      clientProfileModel = r;
      emit(ClientProfileSuccess(r));
    });
  }
  disposeControllers(){
     gander.dispose();
    name.dispose();
    age.dispose();
    password.dispose();
    phone.dispose();
  }

  updateControllerValue(String value) {
    return value;
  }

  void updateClientProfileInfo({
    String? name,
    String? gender,
    String? phone,
    int? age,
  }) async {
    emit(ClientUpdateProfileLoading());
    final result = await _clientProfileRepo.updateClientProfileInfo(
        age: age, gender: gender, name: name, phone: phone);
    result.fold((l) => emit(ClientUpdateProfileError()), (r) {
      clientProfileModel = r;
      print('model $clientProfileModel');
      emit(ClientUpdateProfileSuccess(r));
      getClientProfile();
    });
  }

  // updatePassword(String newPassword, String oldPassword) async {
  //   final result =
  //       await _clientProfileRepo.updateClientPassword(newPassword,oldPassword);
  //   result.fold((l) => emit(ClientUpdatePasswordError()), (r) {
  //     emit(ClientUpdatePasswordSuccess(r));
  //   });
  // }
}
