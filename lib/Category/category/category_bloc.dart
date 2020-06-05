import 'dart:async';
import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'package:mystore_project/Category/category/index.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  @override
  Future<void> close() async {
    await super.close();
  }

  @override
  CategoryState get initialState => UnCategoryState();

  @override
  Stream<CategoryState> mapEventToState(
    CategoryEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'CategoryBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
