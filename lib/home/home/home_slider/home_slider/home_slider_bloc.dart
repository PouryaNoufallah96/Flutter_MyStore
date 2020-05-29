import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:mystore_project/home/home/home_slider/home_slider/index.dart';

class HomeSliderBloc extends Bloc<HomeSliderEvent, HomeSliderState> {
  @override
  Future<void> close() async {
    // dispose objects
    await super.close();
  }

  @override
  HomeSliderState get initialState => UnHomeSliderState();

  @override
  Stream<HomeSliderState> mapEventToState(
    HomeSliderEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'HomeSliderBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
