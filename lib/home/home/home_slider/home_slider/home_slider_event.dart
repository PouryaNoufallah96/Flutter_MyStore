import 'dart:async';
import 'dart:developer' as developer;

import 'package:mystore_project/home/home/home_slider/home_slider/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeSliderEvent {
  Stream<HomeSliderState> applyAsync(
      {HomeSliderState currentState, HomeSliderBloc bloc});
  final HomeSliderRepository _homeSliderRepository = HomeSliderRepository();
}

class LoadHomeSliderEvent extends HomeSliderEvent {
  @override
  String toString() => 'LoadHomeSliderEvent';

  LoadHomeSliderEvent();

  @override
  Stream<HomeSliderState> applyAsync(
      {HomeSliderState currentState, HomeSliderBloc bloc}) async* {
    try {
      yield UnHomeSliderState();
      var sliders = await _homeSliderRepository.getSliders();
      yield InHomeSliderState(sliders);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadHomeSliderEvent', error: _, stackTrace: stackTrace);
      yield ErrorHomeSliderState(_?.toString());
    }
  }
}
