import 'dart:async';
import 'dart:developer' as developer;

import 'package:mystore_project/account/profile/profile/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProfileEvent {
  Stream<ProfileState> applyAsync(
      {ProfileState currentState, ProfileBloc bloc});
  final ProfileRepository _profileRepository = ProfileRepository();
}

class UnProfileEvent extends ProfileEvent {
  @override
  Stream<ProfileState> applyAsync({ProfileState currentState, ProfileBloc bloc}) async* {
    yield UnProfileState(0);
  }
}

class LoadProfileEvent extends ProfileEvent {
   
  final bool isError;
  @override
  String toString() => 'LoadProfileEvent';

  LoadProfileEvent(this.isError);

  @override
  Stream<ProfileState> applyAsync(
      {ProfileState currentState, ProfileBloc bloc}) async* {
    try {
      yield UnProfileState(0);
      await Future.delayed(Duration(seconds: 1));
      _profileRepository.test(isError);
      yield InProfileState(0, 'Hello world');
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadProfileEvent', error: _, stackTrace: stackTrace);
      yield ErrorProfileState(0, _?.toString());
    }
  }
}
