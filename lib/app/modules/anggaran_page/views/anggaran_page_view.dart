import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/anggaran_page_controller.dart';

class AnggaranPageView extends GetView<AnggaranPageController> {
  const AnggaranPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnggaranPageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AnggaranPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
