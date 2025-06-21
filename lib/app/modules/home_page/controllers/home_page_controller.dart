import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  //TODO: Implement HomePageController

  final count = 0.obs;
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

  void increment() => count.value++;
}

class AuthController extends GetxController {
  final user = FirebaseAuth.instance.currentUser;

  String get email => user?.email ?? 'No Email';
  String get name => user?.displayName ?? 'No Name';
}
