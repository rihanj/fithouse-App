part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class RefreshState extends LoginState {}

class Loading extends LoginState {}

class Success extends LoginState {}

class SuccessOp extends LoginState {}

class LoadingOp extends LoginState {}

class LoadingSV extends LoginState {}

class Error extends LoginState {}

class NoInternet extends LoginState {}
