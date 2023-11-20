import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/functions/checkinternet.dart';
import '../../data/data_source/forgetpassword_repo.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordRepo _forgetPasswordRepo;

  ForgetPasswordCubit(this._forgetPasswordRepo)
      : super(ForgetPasswordInitial());

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

  void sendEmail(String email) async {
    if (await checkInternet()) {
      emit(ForgetPasswordLoadingState());
      final result = await _forgetPasswordRepo
          .sendForgetPasswordVerificationCodeToEmail(email);
      result.fold((l) => emit(ForgetPasswordErrorState(message: l)),
          (r) => emit(ForgetPasswordSuccessState()));
    } else {
      emit(const ForgetPasswordErrorState(message: "لا يوجد اتصال بالانترنت"));
    }
  }

  void reSendForgetPasswordVerificationCodeToEmail(String email) async {
    await _forgetPasswordRepo
        .reSendForgetPasswordVerificationCodeToEmail(email);
    emit(ReSendForgetPasswordVerificationCodeToEmailState());
  }

  void verifyEmailWithCode(String email, int code) async {
    if(await checkInternet()){
    emit(ForgetPasswordOTPCodeLoadingState());
    final result =
        await _forgetPasswordRepo.verifyClientForgetPasswordCode(email, code);
    result.fold((l) => emit(ForgetPasswordOTPErrorState(message: l)),
        (r) => emit(ForgetPasswordOTPSuccessState()));
         } else {
      emit(const ForgetPasswordOTPErrorState(
          message: "لا يوجد اتصال بالانترنت"));
    }

  }

  void newPassword(String password) async {
    if (await checkInternet()) {
      emit(NewForgetPasswordLoadingState());
      final result = await _forgetPasswordRepo.sentNewPassword(password);
      result.fold((l) => emit(NewForgetPasswordErrorState(message: l)),
          (r) => emit(NewForgetPasswordSuccessState()));
    } else {
      emit(const NewForgetPasswordErrorState(
          message: "لا يوجد اتصال بالانترنت"));
    }
  }
}
