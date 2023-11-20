import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/functions/checkinternet.dart';
import '../../data/data_source/client_auth_repo.dart';

part 'client_login_state.dart';

class ClientLoginCubit extends Cubit<ClientLoginState> {
  final ClientAuthRepo clientLoginRepo;
  ClientLoginCubit(this.clientLoginRepo) : super(ClientLoginInitial());
  static ClientLoginCubit get(context) => BlocProvider.of(context);
  bool isObscure = true;
  void changeIcon() {
    isObscure = !isObscure;
    emit(ChangeIconState());
  }

  void login(String email, String password) async {
    if (await checkInternet()) {
      emit(ClientLoginLoading());
      final result = await clientLoginRepo.clientLoginRepo(email, password);
      result.fold(
        (l) => emit(ClientLoginError(l)),
        (r) {
          if (r == 'LoggedIn successfully') {
            emit(ClientLoginSuccess(r));
          } else {
            emit(ClientSndCodeToEmailState());
          }
        },
      );
    } else {
      emit(const ClientLoginError("لا يوجد اتصال بالانترنت"));
    }
  }
}
