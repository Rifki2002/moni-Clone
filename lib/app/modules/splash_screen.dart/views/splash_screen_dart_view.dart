import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:moni_clone/app/routes/app_pages.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Wait 0.5 seconds, then check auth
    Future.delayed(Duration(milliseconds: 2000), () {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.offAllNamed(Routes.LOGIN_PAGE);
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 300,
              width: 300,
            ),
            SizedBox(
              height: 200,
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
