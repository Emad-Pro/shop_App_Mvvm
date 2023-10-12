part of 'log_out_cubit.dart';

abstract class LogOutState extends Equatable {
  const LogOutState();

  @override
  List<Object> get props => [];
}

class LogOutInitial extends LogOutState {}

class LogOutLoadingState extends LogOutState {}

class LogOutLoadedState extends LogOutState {
  final LogoutModel logoutModel;

  const LogOutLoadedState(this.logoutModel);
}

class LogOutErorrState extends LogOutState {
  final String erorrMessage;

  const LogOutErorrState(this.erorrMessage);
}
