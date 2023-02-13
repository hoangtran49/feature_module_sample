import 'package:bloc/bloc.dart';
import 'package:ddd_arch/features/navigator.dart';
import 'package:ddd_arch/features/profile/data/repository/repository.dart';
import 'package:ddd_arch/features/profile/models/user.dart';
import 'package:ddd_arch/navigation/app_navigator.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this._profileRepo, this._appNavigator)
      : super(const ProfileState(null)) {
    on<RequestSubmitProfileEvent>(_onRequestSubmitProfile);
    on<LogoutEvent>(_onLogoutEvent);
  }

  final ProfileRepo _profileRepo;
  final AppNavigator _appNavigator;

  Future<void> _onRequestSubmitProfile(
      RequestSubmitProfileEvent event, Emitter<ProfileState> emit) async {
    final user = await _profileRepo.getUser();
    emit(ProfileState(user));
  }

  Future<void> _onLogoutEvent(
      LogoutEvent event, Emitter<ProfileState> emit) async {
    await _profileRepo.logout();
    await _appNavigator.replaceAll(Routes.home);
  }
}
