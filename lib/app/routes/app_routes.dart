import 'package:get/get.dart';
import 'package:valentines_day/app/modules/home/bindings/home_binding.dart';
import 'package:valentines_day/app/modules/home/views/home_screen.dart';
import 'package:valentines_day/app/modules/home/views/splash_screen.dart';

List<GetPage> appRoutes = [
  GetPage(
    name: '/splash',
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: '/home',
    page: () => const HomeScreen(),
    binding: HomeBinding(),
  )
];
