import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:mystore_project/product/product_comment_form/index.dart';

class ProductCommentFormBloc
    extends Bloc<ProductCommentFormEvent, ProductCommentFormState> {
  ProductCommentFormBloc();
  @override
  Future<void> close() async {
    // dispose objects
    await super.close();
  }

  @override
  ProductCommentFormState get initialState => UnProductCommentFormState();

  @override
  Stream<ProductCommentFormState> mapEventToState(
    ProductCommentFormEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'ProductCommentFormBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
