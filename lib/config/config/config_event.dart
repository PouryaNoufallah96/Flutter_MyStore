import 'dart:async';
import 'dart:developer' as developer;

import 'package:mystore_project/config/config/index.dart';
import 'package:meta/meta.dart';
import 'package:mystore_project/utilities/mystore.dart';

@immutable
abstract class ConfigEvent {
  Stream<ConfigState> applyAsync({ConfigState currentState, ConfigBloc bloc});
}

class UnConfigEvent extends ConfigEvent {
  @override
  Stream<ConfigState> applyAsync(
      {ConfigState currentState, ConfigBloc bloc}) async* {
    yield UnConfigState();
  }
}

class DarkModeEvent extends ConfigEvent {
  final bool darkOn;
  DarkModeEvent(this.darkOn);
  @override
  String toString() => 'DarkModeEvent';

  @override
  Stream<ConfigState> applyAsync(
      {ConfigState currentState, ConfigBloc bloc}) async* {
    try {
      yield UnConfigState();
      bloc.darkModeOn = darkOn;
      MyStore.prefs.setBool(MyStore.darkModePref, darkOn);
      yield InConfigState();
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      yield new ErrorConfigState(_?.toString());
    }
  }
}

class LogoutEvent extends ConfigEvent {
  LogoutEvent();
  @override
  String toString() => 'LogoutEvent';

  @override
  Stream<ConfigState> applyAsync(
      {ConfigState currentState, ConfigBloc bloc}) async* {
    try {
      yield UnConfigState();
      bloc.username = "";
      MyStore.prefs.setString(MyStore.userNamePref, bloc.username);
      yield InConfigState();
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      yield new ErrorConfigState(_?.toString());
    }
  }
}

class LoadConfigEvent extends ConfigEvent {
  @override
  String toString() => 'LoadConfigEvent';

  LoadConfigEvent();

  @override
  Stream<ConfigState> applyAsync(
      {ConfigState currentState, ConfigBloc bloc}) async* {
    try {
      yield UnConfigState();
      var darkMode = MyStore.prefs.getBool(MyStore.darkModePref);
      darkMode == null ? bloc.darkModeOn = false : bloc.darkModeOn = darkMode;
      var userName = MyStore.prefs.getString(MyStore.userNamePref);
      userName == null ? bloc.username = "" : bloc.username = userName;
      yield InConfigState();
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadConfigEvent', error: _, stackTrace: stackTrace);
      yield ErrorConfigState(_?.toString());
    }
  }
}
