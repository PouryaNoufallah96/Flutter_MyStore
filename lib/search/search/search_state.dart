import 'package:equatable/equatable.dart';
import 'package:mystore_project/models/product.dart';

abstract class SearchState extends Equatable {
  SearchState();
}

/// UnInitialized
class UnSearchState extends SearchState {
  UnSearchState() : super();

  @override
  List<Object> get props => [];
}

/// Initialized
class InSearchState extends SearchState {
  List<Product> products = [];
  InSearchState(this.products) : super();

  get archives => null;

  @override
  String toString() => 'InSearchState';
  @override
  List<Object> get props => [];
}

class ErrorSearchState extends SearchState {
  ErrorSearchState() : super();

  @override
  String toString() => 'ErrorSearchState';
  @override
  List<Object> get props => [];
}

class SearchingState extends SearchState {
  SearchingState() : super();

  @override
  String toString() => 'SearchingState';
  @override
  List<Object> get props => [];
}

class NoSearchState extends SearchState {
  NoSearchState() : super();

  @override
  String toString() => 'NoSearchState';
  @override
  List<Object> get props => [];
}
