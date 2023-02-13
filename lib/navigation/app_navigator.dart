import 'package:flutter/material.dart';

import 'app_popup_info.dart';
import 'app_route_info.dart';

abstract class AppNavigator {
  const AppNavigator();

  Future<T?> pushNamed<T extends Object>(String nameRoute);

  Future<void> pushReplacementName(String nameRoute);

  Future<T?> replaceAll<T extends Object>(String nameRoute);

  // bool get canPopSelfOrChildren;

  // int get currentBottomTab;

  // String getCurrentRouteName({bool useRootNavigator = false});

  // void popUntilRootOfCurrentBottomTab();

  // void navigateToBottomTab(int index, {bool notify = true});

  // Future<T?> push<T extends Object?>(AppRouteInfo appRouteInfo);

  // Future<void> pushAll(List<AppRouteInfo> listAppRouteInfo);

  // Future<T?> replace<T extends Object?>(AppRouteInfo appRouteInfo);

  // Future<void> replaceAll(List<AppRouteInfo> listAppRouteInfo);

  // Future<bool> pop<T extends Object?>({
  //   T? result,
  //   bool useRootNavigator = false,
  // });

  // Future<T?> popAndPush<T extends Object?, R extends Object?>(
  //   AppRouteInfo appRouteInfo, {
  //   R? result,
  //   bool useRootNavigator = false,
  // });

  // Future<void> popAndPushAll(List<AppRouteInfo> listAppRouteInfo,
  //     {bool useRootNavigator = false});

  // void popUntilRoot({bool useRootNavigator = false});

  // void popUntilRouteName(String routeName);

  // bool removeUntilRouteName(String routeName);

  // bool removeAllRoutesWithName(String routeName);

  // bool removeLast();

  // Future<T?> showDialog<T extends Object?>(
  //   AppPopupInfo appPopupInfo, {
  //   bool barrierDismissible = true,
  //   bool useSafeArea = false,
  //   bool useRootNavigator = true,
  // });

  // Future<T?> showGeneralDialog<T extends Object?>(
  //   AppPopupInfo appPopupInfo, {
  //   Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
  //       transitionBuilder,
  //   Duration transitionDuration = const Duration(seconds: 3),
  //   bool barrierDismissible = true,
  //   Color barrierColor = const Color(0x80000000),
  //   bool useRootNavigator = true,
  // });

  // Future<T?> showModalBottomSheet<T extends Object?>(
  //   AppPopupInfo appPopupInfo, {
  //   bool isScrollControlled = false,
  //   bool useRootNavigator = false,
  //   bool isDismissible = true,
  //   bool enableDrag = true,
  //   Color barrierColor = Colors.black54,
  //   Color? backgroundColor,
  // });

  void showErrorSnackBar(String message, {Duration? duration});

  void showSuccessSnackBar(String message, {Duration? duration});
}
