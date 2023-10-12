import 'package:bloc/bloc.dart';

import 'package:shop_app_mvvm/feture/auth/singup/data/model/sign_up_model/sign_up_model.dart';
import 'package:shop_app_mvvm/feture/auth/singup/data/repository/signUp_repository.dart';

import '../../../data/model/sign_up_model/data.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepository signUpRepository;
  bool? isPassword = true;
  SignUpCubit(this.signUpRepository) : super(const SignUpState());
  Future<void> fetchSignUpAccount({required DataSignUp dataSignUp}) async {
    emit(SignUpAccountLoadingState());
    final result = await signUpRepository.fetchSignUpApp(dataSignUp: dataSignUp);
    result.fold((l) => emit(SignUpAccountErorrState(l.erorrMessage)),
        (r) => emit(SignUpAccountLoadedState(r)));
  }

  void showHidePassword() {
    if (isPassword == true) {
      isPassword = false;
      emit(SignUpAccountShowHidePasswordState());
    } else {
      isPassword = true;
      emit(SignUpAccountShowHidePasswordState());
    }
    emit(SignUpAccountShowHidePasswordState());
  }
}
