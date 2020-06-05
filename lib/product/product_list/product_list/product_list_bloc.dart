import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:mystore_project/models/product.dart';
import 'package:mystore_project/product/product_list/product_list/index.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  var forceRefresh = false;
  var page = 0;
  var isFinished = false;
  List<Product> mylist = new List();

  @override
  Future<void> close() async {
    // dispose objects
    await super.close();
  }

  @override
  ProductListState get initialState => UnProductListState();

  @override
  Stream<ProductListState> mapEventToState(
    ProductListEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'ProductListBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
