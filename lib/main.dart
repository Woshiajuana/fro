import 'package:flutter/material.dart';
import 'package:fro/app.dart';

import 'fro/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FroSp.init();

  runApp(const App());
}
