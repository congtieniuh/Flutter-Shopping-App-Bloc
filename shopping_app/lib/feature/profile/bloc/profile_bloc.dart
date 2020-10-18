import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app/feature/auth/model/user_app.dart';
import 'package:shopping_app/feature/profile/repository/profile_repository.dart';
import 'package:shopping_app/feature/profile/repository/firebase_profile_repository.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileRepository _profileRepository;

  ProfileBloc()
      : _profileRepository = FirebaseProfileRepository(),
        super(ProfileInitial());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event,) async* {
    if (event is LogoutEvent) {
      yield* _mapLogoutEventToState();
    } else if (event is GetCurrentUser) {
      yield* _mapGetCurrentUserEventToState();
    }
  }

  Stream<ProfileState> _mapLogoutEventToState() async* {
    _profileRepository.logout();

    yield LogoutFinished();
  }

  Stream<ProfileState> _mapGetCurrentUserEventToState() async* {
    var userData = await _profileRepository.getUserInfo();
    yield GetCurrentUserFinish(userData);
  }


}
