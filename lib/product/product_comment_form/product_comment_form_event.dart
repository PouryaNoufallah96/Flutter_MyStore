import 'dart:async';
import 'dart:developer' as developer;

import 'package:mystore_project/product/product_comment_form/index.dart';
import 'package:meta/meta.dart';

import '../../models/comment.dart';

@immutable
abstract class ProductCommentFormEvent {
  Stream<ProductCommentFormState> applyAsync(
      {ProductCommentFormState currentState, ProductCommentFormBloc bloc});
  final ProductCommentFormRepository _productCommentFormRepository =
      ProductCommentFormRepository();
}

class UnProductCommentFormEvent extends ProductCommentFormEvent {
  @override
  Stream<ProductCommentFormState> applyAsync(
      {ProductCommentFormState currentState,
      ProductCommentFormBloc bloc}) async* {
    yield UnProductCommentFormState();
  }
}

class SendProductCommentFormEvent extends ProductCommentFormEvent {
  List<Comment> comments;
  Comment comment;
  @override
  String toString() => 'SendProductCommentFormEvent';

  SendProductCommentFormEvent(this.comments, this.comment);

  @override
  Stream<ProductCommentFormState> applyAsync(
      {ProductCommentFormState currentState,
      ProductCommentFormBloc bloc}) async* {
    try {
      yield SendingProductCommentFormState();
      await Future.delayed(Duration(seconds: 1));
      _productCommentFormRepository.sendAsync(this.comment, this.comments);
      yield SuccessProductCommentFormState();
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadProductCommentFormEvent',
          error: _,
          stackTrace: stackTrace);
      yield ErrorProductCommentFormState(0, _?.toString());
    }
  }
}
