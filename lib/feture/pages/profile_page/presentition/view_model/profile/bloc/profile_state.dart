part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final RequestState profileUserDataState;
  final String profileUserDataMessage;
  final ProfileModel? profileUserModel;
  final RequestState profileUserUpdateDataState;
  final String profileUserUpdateDataMessage;
  final ProfileModel? profileUpdateModel;
  final RequestState profileUserChangePasswordState;
  final String profileUserChangePasswordMessage;
  final ChangePasswordModel? profileUserChangePasswordModel;
  const ProfileState({
    this.profileUserDataMessage = '',
    this.profileUserModel,
    this.profileUserUpdateDataState = RequestState.loadedState,
    this.profileUserUpdateDataMessage = '',
    this.profileUpdateModel,
    this.profileUserChangePasswordState = RequestState.loadingState,
    this.profileUserChangePasswordMessage = '',
    this.profileUserChangePasswordModel,
    this.profileUserDataState = RequestState.loadingState,
  });

  ProfileState copyWith({
    RequestState? profileUserDataState,
    String? profileUserDataMessage,
    ProfileModel? profileUserModel,
    String? profileUserUpdateDataMessage,
    ProfileModel? profileUpdateModel,
    String? profileUserChangePasswordMessage,
    ChangePasswordModel? profileUserChangePasswordModel,
    RequestState? profileUserChangePasswordState,
    RequestState? profileUserUpdateDataState,
  }) {
    return ProfileState(
      profileUserDataState: profileUserDataState ?? this.profileUserDataState,
      profileUserDataMessage:
          profileUserDataMessage ?? this.profileUserDataMessage,
      profileUserModel: profileUserModel ?? this.profileUserModel,
      profileUserUpdateDataState:
          profileUserUpdateDataState ?? this.profileUserUpdateDataState,
      profileUserUpdateDataMessage:
          profileUserUpdateDataMessage ?? this.profileUserUpdateDataMessage,
      profileUpdateModel: profileUpdateModel ?? this.profileUpdateModel,
      profileUserChangePasswordState:
          profileUserChangePasswordState ?? this.profileUserChangePasswordState,
      profileUserChangePasswordMessage: profileUserChangePasswordMessage ??
          this.profileUserChangePasswordMessage,
      profileUserChangePasswordModel:
          profileUserChangePasswordModel ?? this.profileUserChangePasswordModel,
    );
  }

  @override
  List<Object?> get props => [
        profileUserDataState,
        profileUserDataMessage,
        profileUserModel,
        profileUpdateModel,
        profileUserUpdateDataMessage,
        profileUserUpdateDataState,
        profileUserChangePasswordModel,
        profileUserChangePasswordMessage,
        profileUserChangePasswordState
      ];
}
