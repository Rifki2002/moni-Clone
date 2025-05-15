import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/laporan_page_controller.dart';

class LaporanPageView extends GetView<LaporanPageController> {
  const LaporanPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LaporanPageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LaporanPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
