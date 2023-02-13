import 'package:ddd_arch/shared/dto/user_dto.dart';
import 'package:ddd_arch/shared/preference/app_preference.dart';
import 'package:injectable/injectable.dart';

import '../repo/login_repo.dart';

@Injectable(as: LoginRepo)
class LoginRepoImpl implements LoginRepo {
  LoginRepoImpl(this._appPreference);
  final AppPreference _appPreference;

  @override
  Future<void> login() async {
    await _appPreference.saveUser(const UserDto(
        firstName: 'Hoang', lastName: 'Tran', birthDay: '30/03/1997'));
  }
}
