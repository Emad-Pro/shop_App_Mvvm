part of 'login_cubit.dart';

abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginLoadedState extends LoginState {
  final LoginModel loginModel;

  const LoginLoadedState(this.loginModel);
}

class LoginErorrState extends LoginState {
  final String erorrMassage;

  const LoginErorrState(this.erorrMassage);
}

class IsPasswordChangeState extends LoginState {}
