import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ConfigState extends Equatable {
  ConfigState();
}

/// UnInitialized
class UnConfigState extends ConfigState {
  UnConfigState();

  @override
  String toString() => 'UnConfigState';

  @override
  List<Object> get props => [];
}

/// Initialized
class InConfigState extends ConfigState {
  InConfigState();

  @override
  String toString() => 'InConfigState';

  @override
  List<Object> get props => [];
}

class ErrorConfigState extends ConfigState {
  final String errorMessage;

  ErrorConfigState(this.errorMessage);

  @override
  String toString() => 'ErrorConfigState';

  @override
  List<Object> get props => [errorMessage];
}
