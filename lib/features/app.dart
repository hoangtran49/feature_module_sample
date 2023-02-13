import 'package:ddd_arch/features/home/home_page.dart';
import 'package:ddd_arch/features/navigator.dart';
import 'package:ddd_arch/l10n/l10n.dart';
import 'package:ddd_arch/locator.dart';
import 'package:ddd_arch/navigation/app_navigator.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final navigatorKey =
        (getIt.get<AppNavigator>() as NavigatorImpl).navigatorKey;
    return MaterialApp(
      navigatorKey: navigatorKey,
      routes: Routes.routes,
      initialRoute: Routes.home,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
    );
  }
}
