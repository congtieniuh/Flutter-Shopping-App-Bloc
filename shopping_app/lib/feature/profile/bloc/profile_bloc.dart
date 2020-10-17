import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app/feature/profile/repository/profile_repository.dart';
import 'package:shopping_app/feature/profile/repository/profile_repository_firebase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileRepository _profileRepository;
  ProfileBloc() :
        _profileRepository = ProfileRepositoryFirebase(),
        super(ProfileInitial());

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if(event is LogoutEvent){
      yield* _mapLogoutEventToState();
    }
  }

  Stream<ProfileState> _mapLogoutEventToState() async* {
    _profileRepository.logout();

    yield LogoutFinished();
  }
}
