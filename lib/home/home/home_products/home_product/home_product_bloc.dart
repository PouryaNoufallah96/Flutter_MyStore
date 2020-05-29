import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:mystore_project/home/home/home_products/home_product/index.dart';

class HomeProductBloc extends Bloc<HomeProductEvent, HomeProductState> {
  @override
  Future<void> close() async {
    await super.close();
  }

  @override
  HomeProductState get initialState => UnHomeProductState();

  @override
  Stream<HomeProductState> mapEventToState(
    HomeProductEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'HomeProductBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
