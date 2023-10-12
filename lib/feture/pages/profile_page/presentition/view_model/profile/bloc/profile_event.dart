part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileUserDataEvent extends ProfileEvent {}

class ProfileUserUpdateEvent extends ProfileEvent {
  final UpdateProfileModel updateProfileModel;

  const ProfileUserUpdateEvent(this.updateProfileModel);
}

class ProfileUserChangePasswordEvent extends ProfileEvent {
  final SendChangePasswordModel sendChangePasswordModel;

  const ProfileUserChangePasswordEvent(this.sendChangePasswordModel);
}
