import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/akun_page_controller.dart';

class AkunPageView extends GetView<AkunPageController> {
  const AkunPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AkunPageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AkunPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
