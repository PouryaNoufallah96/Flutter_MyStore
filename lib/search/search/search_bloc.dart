import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:mystore_project/search/search/index.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  @override
  Future<void> close() async {
    // dispose objects
    await super.close();
  }

  @override
  SearchState get initialState => UnSearchState();

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'SearchBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
