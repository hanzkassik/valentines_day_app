import 'package:flutter/material.dart';
import 'package:valentines_day/app/my_app.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  await windowManager.ensureInitialized();

  windowManager.setMinimumSize(const Size(500, 700));

  runApp(const MyApp());
}
