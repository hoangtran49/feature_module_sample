import 'dart:convert';

import 'package:ddd_arch/shared/dto/user_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceKeys {
  const SharedPreferenceKeys._();

  static const accessToken = 'accessToken';
  static const refreshToken = 'refreshToken';
  static const currentUser = 'currentUser';
  static const isDarkMode = 'isDarkMode';
  static const deviceToken = 'deviceToken';
  static const isFirstLogin = 'isFirstLogin';
  static const isFirstLaunchApp = 'isFirstLaunchApp';
  static const languageCode = 'languageCode';
}

@lazySingleton
class AppPreference {
  AppPreference(this.prefs);

  final SharedPreferences prefs;

  bool get isFirstLogin =>
      prefs.getBool(SharedPreferenceKeys.isFirstLogin) ?? false;

  // ignore: avoid_positional_boolean_parameters
  Future<bool> saveIsFirstLogin(bool isFirstLogin) async {
    return prefs.setBool(SharedPreferenceKeys.isFirstLogin, isFirstLogin);
  }

  String get accessToken =>
      prefs.getString(SharedPreferenceKeys.accessToken) ?? '';

  bool get isLoggedIn => accessToken.isNotEmpty;

  Future<bool> saveAccessToken(String token) async {
    return prefs.setString(SharedPreferenceKeys.accessToken, token);
  }

  Future<void> saveUser(UserDto user) async {
    await prefs.setString(SharedPreferenceKeys.currentUser, json.encode(user));
  }

  Future<UserDto?> getCurrentUser() async {
    final userJson = prefs.getString(SharedPreferenceKeys.currentUser);

    if (userJson != null) {
      return UserDto.fromJson(json.decode(userJson) as Map<String, dynamic>);
    }
    return null;
  }

  Future<void> clearCurrentUser() async {
    await prefs.remove(SharedPreferenceKeys.currentUser);
  }
}
