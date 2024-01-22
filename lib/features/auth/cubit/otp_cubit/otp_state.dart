part of 'otp_cubit.dart';

class OtpState extends Equatable {
  const OtpState();

  @override
  List<Object> get props => [];
}

class OtpInitial extends OtpState {}

class OtpLoadingState extends OtpState {}

class OtpSuccessState extends OtpState {}

class OtpErrorState extends OtpState {
  final String message;

  const OtpErrorState({required this.message});
}

class ResendOtpErrorState extends OtpState {
  final String message;

  const ResendOtpErrorState({required this.message});
}

class ResendOtpSuccessState extends OtpState {
  final String message;

  const ResendOtpSuccessState({required this.message});
}

class ResendOtpLoadingState extends OtpState {}
