// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ddd_arch/features/authen/blocs/login_bloc/login_bloc.dart'
    as _i11;
import 'package:ddd_arch/features/authen/data/impl/login_repo_impl.dart' as _i8;
import 'package:ddd_arch/features/authen/data/repo/login_repo.dart' as _i7;
import 'package:ddd_arch/features/navigator.dart' as _i4;
import 'package:ddd_arch/features/profile/blocs/profile_bloc/profile_bloc.dart'
    as _i12;
import 'package:ddd_arch/features/profile/data/impl/respository_impl.dart'
    as _i10;
import 'package:ddd_arch/features/profile/data/repository/repository.dart'
    as _i9;
import 'package:ddd_arch/navigation/app_navigator.dart' as _i3;
import 'package:ddd_arch/shared/preference/app_preference.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import 'locator.dart' as _i13;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final serviceModule = _$ServiceModule();
  gh.singleton<_i3.AppNavigator>(_i4.NavigatorImpl());
  await gh.factoryAsync<_i5.SharedPreferences>(
    () => serviceModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i6.AppPreference>(
      () => _i6.AppPreference(gh<_i5.SharedPreferences>()));
  gh.factory<_i7.LoginRepo>(() => _i8.LoginRepoImpl(gh<_i6.AppPreference>()));
  gh.singleton<_i9.ProfileRepo>(_i10.ProfileRepoImpl(gh<_i6.AppPreference>()));
  gh.factory<_i11.LoginBloc>(() => _i11.LoginBloc(
        gh<_i7.LoginRepo>(),
        gh<_i3.AppNavigator>(),
      ));
  gh.factory<_i12.ProfileBloc>(() => _i12.ProfileBloc(
        gh<_i9.ProfileRepo>(),
        gh<_i3.AppNavigator>(),
      ));
  return getIt;
}

class _$ServiceModule extends _i13.ServiceModule {}
