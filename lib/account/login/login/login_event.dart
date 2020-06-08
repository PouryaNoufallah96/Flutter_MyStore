import 'dart:async';
import 'dart:developer' as developer;
import 'package:mystore_project/account/login/login/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent {
  Stream<LoginState> applyAsync({LoginState currentState, LoginBloc bloc});
  final LoginRepository _loginRepository = LoginRepository();
}

class UnLoginEvent extends LoginEvent {
  @override
  Stream<LoginState> applyAsync(
      {LoginState currentState, LoginBloc bloc}) async* {
    yield UnLoginState();
  }
}

class InitLoginEvent extends LoginEvent {
  final String username;
  @override
  String toString() => 'InitLoginEvent';

  InitLoginEvent(this.username);

  @override
  Stream<LoginState> applyAsync(
      {LoginState currentState, LoginBloc bloc}) async* {
    try {
      yield LoadingLoginState();
      await Future.delayed(Duration(seconds: 2));
      //_loginRepository.test(isError);
      yield InLoginState();
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'InitLoginEvent', error: _, stackTrace: stackTrace);
      yield ErrorLoginState();
    }
  }
}
