part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {

}

class LogoutEvent extends ProfileEvent {

  @override
  List<Object> get props => [];

}

class GetCurrentUser extends ProfileEvent {

  @override
  List<Object> get props => [];

}

