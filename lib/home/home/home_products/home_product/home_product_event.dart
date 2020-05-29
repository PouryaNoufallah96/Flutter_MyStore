import 'dart:async';
import 'dart:developer' as developer;

import 'package:mystore_project/home/home/home_products/home_product/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeProductEvent {
  Stream<HomeProductState> applyAsync(
      {HomeProductState currentState, HomeProductBloc bloc});
  final HomeProductRepository _homeProductRepository = HomeProductRepository();
}

class LoadHomeProductEvent extends HomeProductEvent {
  @override
  String toString() => 'LoadHomeProductEvent';

  LoadHomeProductEvent();

  @override
  Stream<HomeProductState> applyAsync(
      {HomeProductState currentState, HomeProductBloc bloc}) async* {
    try {
      yield UnHomeProductState();
      var products = await _homeProductRepository.getProducts();
      yield InHomeProductState(products);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadHomeProductEvent', error: _, stackTrace: stackTrace);
      yield ErrorHomeProductState(_?.toString());
    }
  }
}
