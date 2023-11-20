part of 'client_profile_cubit.dart';

class ClientProfileState extends Equatable {
  const ClientProfileState();

  @override
  List<Object> get props => [];
}

class ClientProfileInitial extends ClientProfileState {}

class ClientProfileLoading extends ClientProfileState {}

class ClientProfileError extends ClientProfileState {}

class ClientProfileSuccess extends ClientProfileState {
  final ClientProfileModel? clientModel;

  const ClientProfileSuccess(this.clientModel);
}

class ClientUpdateProfileLoading extends ClientProfileState {}

class ClientUpdateProfileError extends ClientProfileState {}

class ClientUpdateProfileSuccess extends ClientProfileState {
  final ClientProfileModel? clientModel;

  const ClientUpdateProfileSuccess(this.clientModel);
}

class ClientUpdatePasswordError extends ClientProfileState {}

class ClientUpdatePasswordSuccess extends ClientProfileState {
  final String message;
  const ClientUpdatePasswordSuccess(this.message);
}
