import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:mystore_project/account/login/login/index.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  Future<void> close() async {
    // dispose objects
    await super.close();
  }

  @override
  LoginState get initialState => UnLoginState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoginBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
