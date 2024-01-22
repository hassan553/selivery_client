import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/functions/checkinternet.dart';
import '../../data/data_source/verify_email_repo.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  final VerifyEmailAddressRepo _verifyEmailAddressRepo;

  OtpCubit(this._verifyEmailAddressRepo) : super(OtpInitial());

  static OtpCubit get(context) => BlocProvider.of(context);

  void verifyEmailWithCode(String email, String code) async {
    if (await checkInternet()) {
      emit(OtpLoadingState());
      final result =
          await _verifyEmailAddressRepo.clientVerifyEmailCode(email, code);
      result.fold((l) => emit(OtpErrorState(message: l)),
          (r) => emit(OtpSuccessState()));
    } else {
      emit(const OtpErrorState(message: 'لايوجد اتصال بالانترنت'));
    }
  }

  void resendEmailVerifyCode(String email) async {
    emit(ResendOtpLoadingState());
    final result = await _verifyEmailAddressRepo.clientResendEmailCode(email);
    result.fold((l) => emit(ResendOtpErrorState(message: l)),
        (r) => emit(ResendOtpSuccessState(message: r)));
  }
}
