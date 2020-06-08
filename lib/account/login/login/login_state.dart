import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  LoginState();
}

/// UnInitialized
class UnLoginState extends LoginState {
  UnLoginState() : super();

  @override
  String toString() => 'UnLoginState';

  @override
  List<Object> get props => [];
}

/// Initialized
class InLoginState extends LoginState {
  InLoginState() : super();

  @override
  String toString() => 'InLoginState';

  @override
  List<Object> get props => [];
}

/// Initialized
class LoadingLoginState extends LoginState {
  LoadingLoginState() : super();

  @override
  String toString() => 'LoadingLoginState';

  @override
  List<Object> get props => [];
}

class ErrorLoginState extends LoginState {
  ErrorLoginState() : super();

  @override
  String toString() => 'ErrorLoginState';

  @override
  List<Object> get props => [];
}
