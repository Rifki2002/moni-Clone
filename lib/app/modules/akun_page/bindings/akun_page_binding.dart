import 'package:get/get.dart';

import '../controllers/akun_page_controller.dart';

class AkunPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AkunPageController>(
      () => AkunPageController(),
    );
  }
}
