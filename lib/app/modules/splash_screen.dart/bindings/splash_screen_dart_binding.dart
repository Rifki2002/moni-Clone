import 'package:get/get.dart';

import '../controllers/splash_screen_dart_controller.dart';

class SplashScreenDartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashScreenDartController>(
      () => SplashScreenDartController(),
    );
  }
}
