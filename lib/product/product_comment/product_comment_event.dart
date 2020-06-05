import 'dart:async';
import 'dart:developer' as developer;
import 'package:mystore_project/product/product_comment/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProductCommentEvent {
  Stream<ProductCommentState> applyAsync(
      {ProductCommentState currentState, ProductCommentBloc bloc});
  final ProductCommentRepository _productCommentRepository =
      ProductCommentRepository();
}

class LoadProductCommentEvent extends ProductCommentEvent {
  @override
  String toString() => 'LoadProductCommentEvent';

  LoadProductCommentEvent();

  @override
  Stream<ProductCommentState> applyAsync(
      {ProductCommentState currentState, ProductCommentBloc bloc}) async* {
    await Future.delayed(Duration(seconds: 1));

    try {
      var comments = await _productCommentRepository.getComments();
      yield InProductCommentState(comments);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadProductCommentEvent', error: _, stackTrace: stackTrace);
      yield ErrorProductCommentState(_?.toString());
    }
  }
}
