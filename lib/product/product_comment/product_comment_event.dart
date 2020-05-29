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
      if (bloc.forceRefresh) {
        bloc.mylist = [];
        bloc.isFinished = false;
        bloc.page = 0;
      }
      if (!bloc.lazyLoad) {
        var newComments = await _productCommentRepository.getComments(0);
        bloc.mylist.addAll(newComments);
        yield InProductCommentState(bloc.mylist);
      } else {
        if (!bloc.isFinished) {
          var newComments =
              await _productCommentRepository.getComments(bloc.page * 20);
          bloc.mylist.addAll(newComments);
          bloc.page++;
          if (newComments.length < 20) {
            bloc.isFinished = true;
          }
          yield InProductCommentState(bloc.mylist);
        }
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadProductCommentEvent', error: _, stackTrace: stackTrace);
      yield ErrorProductCommentState(_?.toString());
    } finally {
      bloc.forceRefresh = false;
    }
  }
}
