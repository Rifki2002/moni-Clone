import 'package:get/get.dart';

import '../modules/akun_page/bindings/akun_page_binding.dart';
import '../modules/akun_page/views/akun_page_view.dart';
import '../modules/anggaran_page/bindings/anggaran_page_binding.dart';
import '../modules/anggaran_page/views/anggaran_page_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_page/bindings/home_page_binding.dart';
import '../modules/home_page/views/home_page_view.dart';
import '../modules/laporan_page/bindings/laporan_page_binding.dart';
import '../modules/laporan_page/views/laporan_page_view.dart';
import '../modules/login_page/bindings/login_page_binding.dart';
import '../modules/login_page/views/login_page_view.dart';
import '../modules/splash_screen.dart/bindings/splash_screen_dart_binding.dart';
import '../modules/splash_screen.dart/views/splash_screen_dart_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN_DART;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => const LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.HOME_PAGE,
      page: () => const HomePageView(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: _Paths.LAPORAN_PAGE,
      page: () => const LaporanPageView(),
      binding: LaporanPageBinding(),
    ),
    GetPage(
      name: _Paths.ANGGARAN_PAGE,
      page: () => const AnggaranPageView(),
      binding: AnggaranPageBinding(),
    ),
    GetPage(
      name: _Paths.AKUN_PAGE,
      page: () => const AkunPageView(),
      binding: AkunPageBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN_DART,
      page: () => const SplashPage(),
      binding: SplashScreenDartBinding(),
    ),
  ];
}
