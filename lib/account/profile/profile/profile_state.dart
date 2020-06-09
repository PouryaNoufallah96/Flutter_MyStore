import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  /// notify change state without deep clone state
  final int version;
  
  final List propss;
  ProfileState(this.version,[this.propss]);

  /// Copy object for use in action
  /// if need use deep clone
  ProfileState getStateCopy();

  ProfileState getNewVersion();

  @override
  List<Object> get props => ([version, ...propss ?? []]);
}

/// UnInitialized
class UnProfileState extends ProfileState {

  UnProfileState(int version) : super(version);

  @override
  String toString() => 'UnProfileState';

  @override
  UnProfileState getStateCopy() {
    return UnProfileState(0);
  }

  @override
  UnProfileState getNewVersion() {
    return UnProfileState(version+1);
  }
}

/// Initialized
class InProfileState extends ProfileState {
  final String hello;

  InProfileState(int version, this.hello) : super(version, [hello]);

  @override
  String toString() => 'InProfileState $hello';

  @override
  InProfileState getStateCopy() {
    return InProfileState(version, hello);
  }

  @override
  InProfileState getNewVersion() {
    return InProfileState(version+1, hello);
  }
}

class ErrorProfileState extends ProfileState {
  final String errorMessage;

  ErrorProfileState(int version, this.errorMessage): super(version, [errorMessage]);
  
  @override
  String toString() => 'ErrorProfileState';

  @override
  ErrorProfileState getStateCopy() {
    return ErrorProfileState(version, errorMessage);
  }

  @override
  ErrorProfileState getNewVersion() {
    return ErrorProfileState(version+1, 
    errorMessage);
  }
}
