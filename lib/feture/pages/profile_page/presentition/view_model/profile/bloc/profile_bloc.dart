import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_mvvm/core/enum.dart';

import '../../../../../profile_page/data/model/change_password_model/change_password/change_password.dart';
import '../../../../../profile_page/data/model/change_password_model/send_change_password_model.dart';
import '../../../../../profile_page/data/model/profile_model/profile_model.dart';
import '../../../../../profile_page/data/model/update_profile_model/update_profile_model.dart';
import '../../../../../profile_page/data/repository/home_repsitory.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepsitory profileRepository;
  ProfileBloc(this.profileRepository) : super(const ProfileState()) {
    on<ProfileUserDataEvent>(_fetchUserData);
    on<ProfileUserUpdateEvent>(_fetchUpdateUserProfileData);
    on<ProfileUserChangePasswordEvent>(_fetchChangePasswordProfile);
  }

  FutureOr<void> _fetchUserData(
      ProfileUserDataEvent event, Emitter<ProfileState> emit) async {
    final result = await profileRepository.fetchUserProfile();
    result.fold(
      (l) {
        emit(state.copyWith(
            profileUserDataMessage: l.erorrMessage,
            profileUserDataState: RequestState.erorrState));
      },
      (r) {
        emit(
          state.copyWith(
              profileUserDataState: RequestState.loadedState,
              profileUserModel: r),
        );
      },
    );
  }

  FutureOr<void> _fetchChangePasswordProfile(
      ProfileUserChangePasswordEvent event, Emitter<ProfileState> emit) async {
    final result = await profileRepository.fetchChanePasswordUserProfile(
        data: event.sendChangePasswordModel);
    result.fold(
      (l) => emit(state.copyWith(
          profileUserChangePasswordMessage: l.erorrMessage,
          profileUserChangePasswordState: RequestState.erorrState)),
      (r) => emit(state.copyWith(
          profileUserChangePasswordState: RequestState.loadedState,
          profileUserChangePasswordModel: r)),
    );
  }

  FutureOr<void> _fetchUpdateUserProfileData(
      ProfileUserUpdateEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(profileUserUpdateDataState: RequestState.loadingState));
    final result = await profileRepository.fetchUpdateUserProfile(
        data: event.updateProfileModel);
    result.fold(
      (l) => emit(state.copyWith(
          profileUserUpdateDataMessage: l.erorrMessage,
          profileUserUpdateDataState: RequestState.erorrState)),
      (r) {
        if (r.status == true) {
          emit(state.copyWith(
              profileUserDataState: RequestState.loadedState,
              profileUserModel: r));
        }
        emit(state.copyWith(
          profileUpdateModel: r,
          profileUserUpdateDataState: RequestState.loadedState,
        ));
      },
    );
  }
}
