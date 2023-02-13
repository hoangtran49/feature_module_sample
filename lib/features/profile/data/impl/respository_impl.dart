import 'package:ddd_arch/features/profile/data/repository/repository.dart';
import 'package:ddd_arch/features/profile/models/user.dart';
import 'package:ddd_arch/shared/preference/app_preference.dart';
import 'package:injectable/injectable.dart';

import '../mapper/user_mapper.dart';

@Singleton(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  ProfileRepoImpl(this._appPreference);

  final AppPreference _appPreference;

  @override
  Future<User?> getUser() async {
    final userCache = await _appPreference.getCurrentUser();
    if (userCache != null) {
      return UserMapper.fromUserDto(userCache);
    } else {
      return null;
    }
  }

  @override
  Future<void> logout() async {
    await _appPreference.clearCurrentUser();
  }
}
