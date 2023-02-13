part of 'login_bloc.dart';

enum LoginStatus { init, loading, success, failure }

class LoginState extends Equatable {
  const LoginState({
    this.loginStatus = LoginStatus.init,
  });

  final LoginStatus loginStatus;

  @override
  List<Object?> get props => [loginStatus];
}
