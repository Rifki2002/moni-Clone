import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import '../controllers/anggaran_page_controller.dart';

class AnggaranChartView extends StatelessWidget {
  const AnggaranChartView({super.key});

  Color _getColorForCategory(String nama) {
    switch (nama) {
      case "Gaji":
        return Colors.green;
      case "Makanan":
        return Colors.red;
      case "Transportasi":
        return Colors.blue;
      case "Kesehatan":
        return Colors.purple;
      case "Hiburan":
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AnggaranPageController>();
    final total =
        controller.anggaranList.fold<int>(0, (sum, item) => sum + item.jumlah);

    return Obx(() {
      if (controller.anggaranList.isEmpty) {
        return const Center(child: Text("Belum ada data anggaran"));
      }

      return Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            "Distribusi Anggaran",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: PieChart(
              PieChartData(
                sectionsSpace: 2,
                centerSpaceRadius: 40,
                sections: controller.anggaranList.map((item) {
                  final percent =
                      (item.jumlah / total * 100).toStringAsFixed(1);
                  return PieChartSectionData(
                    value: item.jumlah.toDouble(),
                    title: "${item.nama}\n$percent%",
                    color: _getColorForCategory(item.nama),
                    radius: 60,
                    titleStyle: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      );
    });
  }
}
