import 'package:bloc/bloc.dart';

import 'package:shop_app_mvvm/core/shared_preferences/CacheHelper.dart';
import 'package:shop_app_mvvm/core/user_data/uId.dart';

import '../../../data/model/data_login.dart';
import '../../../data/model/login_model.dart';
import '../../../data/repository/login_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepository) : super(LoginInitial());

  final LoginRepository loginRepository;
  Future<void> fetchLoginUser({required DataLogin dataLogin}) async {
    emit(LoginLoadingState());
    final response = await loginRepository.fetchLoginApp(dataLogin: dataLogin);
    response.fold((l) => emit(LoginErorrState(l.erorrMessage)), (r) {
      if (r.data != null) {
        CacheHelper.saveData(key: "uId", value: r.data!.token);
        CacheHelper.saveData(key: "userName", value: r.data!.name);
        UserData.uId = CacheHelper.getSaveData(key: 'uId') as String;
        UserData.userName = CacheHelper.getSaveData(key: "userName") as String;
      }
      return emit(LoginLoadedState(r));
    });
  }

  bool isPassword = true;
  void changeIsPasswordStatus() {
    if (isPassword) {
      isPassword = false;
    } else {
      isPassword = true;
    }
    emit(IsPasswordChangeState());
  }
}
