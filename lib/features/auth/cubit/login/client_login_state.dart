part of 'client_login_cubit.dart';

class ClientLoginState extends Equatable {
  const ClientLoginState();

  @override
  List<Object> get props => [];
}

class ClientLoginInitial extends ClientLoginState {}

class ChangeIconState extends ClientLoginState {}

class ClientSndCodeToEmailState extends ClientLoginState {}

class ClientLoginLoading extends ClientLoginState {}

class ClientLoginSuccess extends ClientLoginState {
  final String message;

  const ClientLoginSuccess(this.message);
}

class ClientLoginError extends ClientLoginState {
  final String message;

  const ClientLoginError(this.message);
}
