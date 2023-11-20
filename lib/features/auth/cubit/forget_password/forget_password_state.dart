part of 'forget_password_cubit.dart';

class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();

  @override
  List<Object> get props => [];
}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoadingState extends ForgetPasswordState {}

class ForgetPasswordSuccessState extends ForgetPasswordState {}

class ForgetPasswordErrorState extends ForgetPasswordState {
  final String message;
  const ForgetPasswordErrorState({required this.message});
}

class ReSendForgetPasswordVerificationCodeToEmailState
    extends ForgetPasswordState {}

class ForgetPasswordOTPCodeLoadingState extends ForgetPasswordState {}

class ForgetPasswordOTPSuccessState extends ForgetPasswordState {}

class ForgetPasswordOTPErrorState extends ForgetPasswordState {
  final String message;
  const ForgetPasswordOTPErrorState({required this.message}); 
}

class NewForgetPasswordLoadingState extends ForgetPasswordState {}

class NewForgetPasswordSuccessState extends ForgetPasswordState {}

class NewForgetPasswordErrorState extends ForgetPasswordState {
  final String message;
  const NewForgetPasswordErrorState({required this.message});
}
