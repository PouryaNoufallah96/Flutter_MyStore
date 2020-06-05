import 'dart:async';
import 'dart:developer' as developer;

import 'package:mystore_project/Category/category/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CategoryEvent {
  Stream<CategoryState> applyAsync(
      {CategoryState currentState, CategoryBloc bloc});
  final CategoryRepository _categoryRepository = CategoryRepository();
}

class UnCategoryEvent extends CategoryEvent {
  @override
  Stream<CategoryState> applyAsync(
      {CategoryState currentState, CategoryBloc bloc}) async* {
    yield UnCategoryState();
  }
}

class LoadCategoryEvent extends CategoryEvent {
  @override
  String toString() => 'LoadCategoryEvent';

  LoadCategoryEvent();

  @override
  Stream<CategoryState> applyAsync(
      {CategoryState currentState, CategoryBloc bloc}) async* {
    try {
      var categories = await _categoryRepository.getCategories();
      yield InCategoryState(categories);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadCategoryEvent', error: _, stackTrace: stackTrace);
      yield ErrorCategoryState();
    }
  }
}
