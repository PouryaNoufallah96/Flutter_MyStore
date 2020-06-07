import 'dart:async';
import 'dart:developer' as developer;

import 'package:mystore_project/search/search/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SearchEvent {
  Stream<SearchState> applyAsync({SearchState currentState, SearchBloc bloc});
  final SearchRepository _searchRepository = SearchRepository();
}

class UnSearchEvent extends SearchEvent {
  @override
  Stream<SearchState> applyAsync(
      {SearchState currentState, SearchBloc bloc}) async* {
    yield UnSearchState();
  }
}

class InitSearchEvent extends SearchEvent {
  final String search;
  @override
  String toString() => 'InitSearchEvent';

  InitSearchEvent(this.search);

  @override
  Stream<SearchState> applyAsync(
      {SearchState currentState, SearchBloc bloc}) async* {
    try {
      if (search.isEmpty) {
        yield UnSearchState();
      } else {
        yield SearchingState();
        var products = await _searchRepository.searchAsync(search);
        if (products.length == 0)
          yield NoSearchState();
        else
          yield InSearchState(products);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'InitSearchEvent', error: _, stackTrace: stackTrace);
      yield ErrorSearchState();
    }
  }
}
