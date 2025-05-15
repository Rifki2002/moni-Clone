import 'package:get/get.dart';

import '../controllers/anggaran_page_controller.dart';

class AnggaranPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnggaranPageController>(
      () => AnggaranPageController(),
    );
  }
}
