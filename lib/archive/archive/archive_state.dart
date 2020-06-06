import 'package:equatable/equatable.dart';
import 'package:mystore_project/models/product.dart';

abstract class ArchiveState extends Equatable {
  ArchiveState();

  @override
  List<Object> get props => [];
}

/// UnInitialized
class UnArchiveState extends ArchiveState {
  UnArchiveState() : super();

  @override
  String toString() => 'UnArchiveState';
}

/// Initialized
class InArchiveState extends ArchiveState {
  List<Product> archives = [];
  InArchiveState(this.archives) : super();

  @override
  String toString() => 'InArchiveState';
}

class ErrorArchiveState extends ArchiveState {
  ErrorArchiveState() : super();

  @override
  String toString() => 'ErrorArchiveState';
}

class NoArchiveState extends ArchiveState {
  NoArchiveState() : super();

  @override
  String toString() => 'NoArchiveState';
}
