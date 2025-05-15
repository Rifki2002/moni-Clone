import 'package:get/get.dart';

class HomeController extends GetxController {
  final count = 0.obs;

  // ✅ This fixes the issue
  final selectedIndex = 0.obs;

  void increment() => count.value++;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
