import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valentines_day/app/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '''Valentine's Day App''',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 228, 60, 60)),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      getPages: appRoutes,
    );
  }
}
