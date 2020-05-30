import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:mystore_project/models/comment.dart';
import 'package:mystore_project/product/product_comment/index.dart';

class ProductCommentBloc
    extends Bloc<ProductCommentEvent, ProductCommentState> {
  // static final ProductCommentBloc _productCommentBlocSingleton =
  //     ProductCommentBloc._internal();
  // factory ProductCommentBloc() {
  //   return _productCommentBlocSingleton;
  // }
  //ProductCommentBloc._internal();
  var forceRefresh = false;
  var page = 0;
  var isFinished = false;
  List<Comment> mylist = new List();

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
