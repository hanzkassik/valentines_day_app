import 'dart:io';

import 'package:flutter/material.dart';
import 'package:valentines_day/app/my_app.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows) {
    await windowManager.ensureInitialized();
    windowManager.setMinimumSize(const Size(500, 700));
    windowManager.setSize(const Size(500, 1000));
  }

  runApp(const MyApp());
}
