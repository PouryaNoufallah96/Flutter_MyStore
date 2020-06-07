import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:mystore_project/config/config/index.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  bool darkModeOn = false;
  String username = "";

  @override
  Future<void> close() async {
    await super.close();
  }

  @override
  ConfigState get initialState => UnConfigState();

  @override
  Stream<ConfigState> mapEventToState(
    ConfigEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'ConfigBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
