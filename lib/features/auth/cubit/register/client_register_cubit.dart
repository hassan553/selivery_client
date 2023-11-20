import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/functions/checkinternet.dart';

import '../../data/data_source/client_auth_repo.dart';

part 'client_register_state.dart';

class ClientRegisterCubit extends Cubit<ClientRegisterState> {
  final ClientAuthRepo clientRegisterRepo;
  ClientRegisterCubit(this.clientRegisterRepo) : super(ClientRegisterInitial());
  static ClientRegisterCubit get(context) => BlocProvider.of(context);
  bool isObscure = true;
  void changeIcon() {
    isObscure = !isObscure;
    emit(ChangeIconState());
  }
  void register(String name, String email, String password) async {
    if (await checkInternet()) {
      emit(ClientRegisterLoading());
      final result =
          await clientRegisterRepo.clientRegisterRepo(name, email, password);
      result.fold(
        (l) => emit(ClientRegisterError(l)),
        (r) => emit(ClientRegisterSuccess(r)),
      );
    } else {
      emit(const ClientRegisterError("لا يوجد اتصال بالانترنت"));
    }
  }
}
