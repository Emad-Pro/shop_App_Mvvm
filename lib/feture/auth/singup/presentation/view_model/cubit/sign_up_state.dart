part of 'sign_up_cubit.dart';

class SignUpState {
  const SignUpState();
}

class SignUpAccountLoadingState extends SignUpState {}

class SignUpAccountLoadedState extends SignUpState {
  final SignUpModel signUpModel;

  const SignUpAccountLoadedState(this.signUpModel);
}

class SignUpAccountErorrState extends SignUpState {
  final String erorrMessage;

  const SignUpAccountErorrState(this.erorrMessage);
}

class SignUpAccountShowHidePasswordState extends SignUpState {}
