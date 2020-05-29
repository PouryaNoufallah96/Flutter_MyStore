import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mystore_project/models/product.dart';

@immutable
abstract class HomeProductState extends Equatable {
  HomeProductState([Iterable props]) : super();
  HomeProductState getStateCopy();
}

/// UnInitialized
class UnHomeProductState extends HomeProductState {
  UnHomeProductState() : super();

  @override
  String toString() => 'UnHomeProductState';

  @override
  UnHomeProductState getStateCopy() {
    return UnHomeProductState();
  }

  @override
  List<Object> get props => [];
}

/// Initialized
class InHomeProductState extends HomeProductState {
  final List<Product> products;
  InHomeProductState(this.products) : super();

  @override
  String toString() => 'InHomeProductState';

  @override
  InHomeProductState getStateCopy() {
    return InHomeProductState(products);
  }

  @override
  List<Object> get props => [products];
}

class ErrorHomeProductState extends HomeProductState {
  final String errorMessage;

  ErrorHomeProductState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorHomeProductState';

  @override
  ErrorHomeProductState getStateCopy() {
    return ErrorHomeProductState(errorMessage);
  }

  @override
  List<Object> get props => [errorMessage];
}
