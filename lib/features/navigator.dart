import 'package:ddd_arch/features/authen/views/login_page.dart';
import 'package:ddd_arch/features/home/home_page.dart';
import 'package:ddd_arch/features/profile/views/profile_page.dart';
import 'package:ddd_arch/navigation/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AppNavigator)
class NavigatorImpl extends AppNavigator {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get currentState => navigatorKey.currentState!;

  @override
  Future<T?> pushNamed<T extends Object>(String nameRoute) {
    return currentState.pushNamed(nameRoute);
  }

  @override
  Future<void> pushReplacementName(String nameRoute) {
    return currentState.pushReplacementNamed(nameRoute);
  }

  @override
  void showErrorSnackBar(String message, {Duration? duration}) {
    final snackBar = SnackBar(
      content: Text(message),
    );

    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(snackBar);
  }

  @override
  void showSuccessSnackBar(String message, {Duration? duration}) {
    // TODO: implement showSuccessSnackBar
  }

  @override
  Future<T?> replaceAll<T extends Object>(String nameRoute) {
    return currentState.pushNamedAndRemoveUntil(nameRoute, (route) => false);
  }
}

class Routes {
  Routes._();

  static const String login = '/login';
  static const String home = '/home';
  static const String profile = '/profile';

  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => const HomePage(),
    login: (BuildContext context) => const LoginPage(),
    profile: (BuildContext context) => const ProfilePage()
  };
}
