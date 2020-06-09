import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:mystore_project/account/profile/profile/index.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  // todo: check singleton for logic in project
  static final ProfileBloc _profileBlocSingleton = ProfileBloc._internal();
  factory ProfileBloc() {
    return _profileBlocSingleton;
  }
  ProfileBloc._internal();
  
  @override
  Future<void> close() async{
    // dispose objects
    await super.close();
  }

  @override
  ProfileState get initialState => UnProfileState(0);

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'ProfileBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
