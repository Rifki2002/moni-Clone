import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moni_clone/app/modules/akun_page/views/akun_page_view.dart';
import 'package:moni_clone/app/modules/anggaran_page/views/anggaran_page_view.dart';
import 'package:moni_clone/app/modules/home_page/views/home_page_view.dart';
import 'package:moni_clone/app/modules/laporan_page/views/laporan_page_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Obx(() {
            switch (controller.selectedIndex.value) {
              case 0:
                return HomePageView();
              case 1:
                return const Center(child: Text('Add Page'));
              case 2:
                return LaporanPageView();
              case 3:
                return AnggaranPageView();
              case 4:
                return AkunPageView();
              default:
                return const Center(child: Text('Unknown Page'));
            }
          }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.selectedIndex.value = 1;
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.blue,
          shape: const CircleBorder(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Colors.black12,
          shape: const CircularNotchedRectangle(),
          notchMargin: 6.0,
          child: Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Home Button
                GestureDetector(
                  onTap: () => controller.selectedIndex.value = 0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: controller.selectedIndex.value == 0
                            ? Colors.blue
                            : Colors.grey,
                      ),
                      Text(
                        'Beranda',
                        style: TextStyle(
                          color: controller.selectedIndex.value == 0
                              ? Colors.blue
                              : Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => controller.selectedIndex.value = 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.insert_chart_rounded,
                        color: controller.selectedIndex.value == 2
                            ? Colors.blue
                            : Colors.grey,
                      ),
                      Text(
                        'Laporan',
                        style: TextStyle(
                          color: controller.selectedIndex.value == 2
                              ? Colors.blue
                              : Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 40), // Space for FAB

                GestureDetector(
                  onTap: () => controller.selectedIndex.value = 3,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.pie_chart,
                        color: controller.selectedIndex.value == 3
                            ? Colors.blue
                            : Colors.grey,
                      ),
                      Text(
                        'Anggaran',
                        style: TextStyle(
                          color: controller.selectedIndex.value == 3
                              ? Colors.blue
                              : Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                // Profile Button
                GestureDetector(
                  onTap: () => controller.selectedIndex.value = 4,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        color: controller.selectedIndex.value == 4
                            ? Colors.blue
                            : Colors.grey,
                      ),
                      Text(
                        'Akun',
                        style: TextStyle(
                          color: controller.selectedIndex.value == 4
                              ? Colors.blue
                              : Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ));
  }
}
