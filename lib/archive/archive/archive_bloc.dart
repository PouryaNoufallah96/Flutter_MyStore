import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:mystore_project/archive/archive/index.dart';

class ArchiveBloc extends Bloc<ArchiveEvent, ArchiveState> {
  @override
  Future<void> close() async {
    // dispose objects
    await super.close();
  }

  @override
  ArchiveState get initialState => UnArchiveState();

  @override
  Stream<ArchiveState> mapEventToState(
    ArchiveEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'ArchiveBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
