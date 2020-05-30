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
  @override
  String toString() => 'SendProductCommentFormEvent';

  SendProductCommentFormEvent();

  @override
  Stream<ProductCommentFormState> applyAsync(
      {ProductCommentFormState currentState,
      ProductCommentFormBloc bloc}) async* {
    try {
      yield SendingProductCommentFormState();
      await Future.delayed(Duration(seconds: 1));
      var comment = new Comment(
          id: 0,
          author: bloc.name,
          comment: bloc.message,
          image:
              "https://lh3.googleusercontent.com/-hdBoSkVmD_Y/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuclOcK2iS_dwGuwHbbjE1ahTi49uKQ/photo.jpg?sz=46");
      _productCommentFormRepository.sendAsync(comment);
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
