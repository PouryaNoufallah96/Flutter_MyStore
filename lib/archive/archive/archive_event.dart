import 'dart:async';
import 'dart:developer' as developer;

import 'package:mystore_project/archive/archive/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ArchiveEvent {
  Stream<ArchiveState> applyAsync(
      {ArchiveState currentState, ArchiveBloc bloc});
  final ArchiveRepository _archiveRepository = ArchiveRepository();
}

class UnArchiveEvent extends ArchiveEvent {
  @override
  Stream<ArchiveState> applyAsync(
      {ArchiveState currentState, ArchiveBloc bloc}) async* {
    yield UnArchiveState();
  }
}

class LoadArchiveEvent extends ArchiveEvent {
  @override
  String toString() => 'LoadArchiveEvent';

  LoadArchiveEvent();

  @override
  Stream<ArchiveState> applyAsync(
      {ArchiveState currentState, ArchiveBloc bloc}) async* {
    try {
      yield UnArchiveState();
      var archives = await _archiveRepository.getArchivedAsync();
      if (archives == null)
        yield NoArchiveState();
      else
        yield InArchiveState(archives);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadArchiveEvent', error: _, stackTrace: stackTrace);
      yield ErrorArchiveState();
    }
  }
}
