part of 'client_register_cubit.dart';

class ClientRegisterState extends Equatable {
  const ClientRegisterState();

  @override
  List<Object> get props => [];
}

class ClientRegisterInitial extends ClientRegisterState {}
class ChangeIconState extends ClientRegisterState {}

class ClientRegisterLoading extends ClientRegisterState {}

class ClientRegisterSuccess extends ClientRegisterState {
  final String message;

  const ClientRegisterSuccess(this.message);
}

class ClientRegisterError extends ClientRegisterState {
  final String message;

  const ClientRegisterError(this.message);
}
class ClientGoogleRegisterLoading extends ClientRegisterState {}

class ClientGoogleRegisterSuccess extends ClientRegisterState {}

class ClientGoogleRegisterError extends ClientRegisterState {
  final String message;

  const ClientGoogleRegisterError(this.message);
}
