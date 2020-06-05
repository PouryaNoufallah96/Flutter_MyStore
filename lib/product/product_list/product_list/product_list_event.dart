import 'dart:async';
import 'dart:developer' as developer;

import 'package:mystore_project/product/product_list/product_list/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProductListEvent {
  Stream<ProductListState> applyAsync(
      {ProductListState currentState, ProductListBloc bloc});
  final ProductListRepository _productListRepository = ProductListRepository();
}

class UnProductListEvent extends ProductListEvent {
  @override
  Stream<ProductListState> applyAsync(
      {ProductListState currentState, ProductListBloc bloc}) async* {
    yield UnProductListState();
  }
}

class LoadProductListEvent extends ProductListEvent {
  @override
  String toString() => 'LoadProductListEvent';

  LoadProductListEvent();

  @override
  Stream<ProductListState> applyAsync(
      {ProductListState currentState, ProductListBloc bloc}) async* {
    try {
      if (bloc.forceRefresh) {
        bloc.mylist = [];
        bloc.isFinished = false;
        bloc.page = 0;
      }
      if (!bloc.isFinished) {
        var newProducts =
            await _productListRepository.getProducts(bloc.page * 10);
        bloc.mylist.addAll(newProducts);
        bloc.page++;
        if (newProducts.length < 10) {
          bloc.isFinished = true;
        }
        yield InProductListState(bloc.mylist);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadProductListEvent', error: _, stackTrace: stackTrace);
      yield ErrorProductListState();
    } finally {
      bloc.forceRefresh = false;
    }
  }
}
