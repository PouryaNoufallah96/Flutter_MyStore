import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mystore_project/models/product.dart';

@immutable
abstract class HomeSliderState extends Equatable {
  HomeSliderState([Iterable props]) : super();
  HomeSliderState getStateCopy();
}

/// UnInitialized
class UnHomeSliderState extends HomeSliderState {
  UnHomeSliderState() : super();

  @override
  String toString() => 'UnHomeSliderState';

  @override
  UnHomeSliderState getStateCopy() {
    return UnHomeSliderState();
  }

  @override
  List<Object> get props => [];
}

/// Initialized
class InHomeSliderState extends HomeSliderState {
  final List<Product> sliders;
  InHomeSliderState(this.sliders) : super();

  @override
  String toString() => 'InHomeSliderState';

  @override
  InHomeSliderState getStateCopy() {
    return InHomeSliderState(sliders);
  }

  @override
  List<Object> get props => [sliders];
}

class ErrorHomeSliderState extends HomeSliderState {
  final String errorMessage;

  ErrorHomeSliderState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorHomeSliderState';

  @override
  ErrorHomeSliderState getStateCopy() {
    return ErrorHomeSliderState(errorMessage);
  }

  @override
  List<Object> get props => [errorMessage];
}
