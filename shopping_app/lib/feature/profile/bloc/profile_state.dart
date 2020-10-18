part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable{
  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class LogoutFinished extends ProfileState {}

class GetCurrentUserFinish extends ProfileState {
  final UserData userData;

  GetCurrentUserFinish(this.userData);

  @override
  List<Object> get props => [userData];
}
