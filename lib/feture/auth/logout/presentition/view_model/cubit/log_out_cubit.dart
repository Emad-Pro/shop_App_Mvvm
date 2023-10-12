import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_mvvm/core/shared_preferences/CacheHelper.dart';

import '../../../data/model/logout_model/logout_model.dart';
import '../../../data/repository/logout_repository.dart';

part 'log_out_state.dart';

class LogOutCubit extends Cubit<LogOutState> {
  LogOutCubit(this.logoutRepository) : super(LogOutInitial());
  LogoutRepository logoutRepository;
  Future<void> logoutUser() async {
    emit(LogOutLoadingState());
    final result = await logoutRepository.fetchLogiOutUser();
    result.fold((l) => emit(LogOutErorrState(l.erorrMessage)), (r) {
      CacheHelper.clearData(key: 'uId');
      return emit(LogOutLoadedState(r));
    });
  }
}
