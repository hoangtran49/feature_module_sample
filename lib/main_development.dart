import 'package:ddd_arch/bootstrap.dart';
import 'package:flutter/material.dart';

import 'features/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await bootstrap(() => const App());
}
