import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:mystore_project/product/product_comment/index.dart';

class ProductCommentBloc
    extends Bloc<ProductCommentEvent, ProductCommentState> {
  @override
  Future<void> close() async {
    await super.close();
  }

  @override
  ProductCommentState get initialState => UnProductCommentState();

  @override
  Stream<ProductCommentState> mapEventToState(
    ProductCommentEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'ProductCommentBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
