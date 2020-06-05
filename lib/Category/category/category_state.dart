import 'package:equatable/equatable.dart';

import 'category_model.dart';

abstract class CategoryState extends Equatable {
  CategoryState();

  @override
  List<Object> get props => [];
}

/// UnInitialized
class UnCategoryState extends CategoryState {
  UnCategoryState() : super();

  @override
  String toString() => 'UnCategoryState';
}

/// Initialized
class InCategoryState extends CategoryState {
  List<CategoryModel> categories = [];
  InCategoryState(this.categories) : super();

  @override
  String toString() => 'InCategoryState';
}

class ErrorCategoryState extends CategoryState {
  ErrorCategoryState() : super();

  @override
  String toString() => 'ErrorCategoryState';
}
