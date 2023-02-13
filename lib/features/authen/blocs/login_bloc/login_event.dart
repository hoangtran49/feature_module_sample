part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitLoginEvent extends LoginEvent {}

class SubmitLoginEvent extends LoginEvent {}
