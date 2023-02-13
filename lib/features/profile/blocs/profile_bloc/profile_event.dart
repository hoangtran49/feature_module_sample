part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RequestSubmitProfileEvent extends ProfileEvent {}

class LogoutEvent extends ProfileEvent {}
