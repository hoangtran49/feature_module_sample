import 'package:bloc/bloc.dart';
import 'package:ddd_arch/features/authen/data/repo/login_repo.dart';
import 'package:ddd_arch/features/navigator.dart';
import 'package:ddd_arch/navigation/app_navigator.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._loginRepo, this._appNavigator) : super(const LoginState()) {
    on<InitLoginEvent>(_initLoginEvent);
    on<SubmitLoginEvent>(_submitLoginEvent);
  }

  final LoginRepo _loginRepo;
  final AppNavigator _appNavigator;

  Future<void> _initLoginEvent(
      InitLoginEvent event, Emitter<LoginState> emit) async {}

  Future<void> _submitLoginEvent(
    SubmitLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginState(loginStatus: LoginStatus.loading));

    await _loginRepo.login();
    await await Future.delayed(const Duration(seconds: 2));

    emit(const LoginState(loginStatus: LoginStatus.success));
    _appNavigator.showErrorSnackBar('Login success');
    await await Future.delayed(const Duration(seconds: 2));
    await _appNavigator.replaceAll(Routes.home);
  }
}
