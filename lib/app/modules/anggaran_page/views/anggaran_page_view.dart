import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:moni_clone/utils/CustomText.dart';
import '../controllers/anggaran_page_controller.dart';
import 'add_anggaran_form.dart';

class AnggaranPageView extends GetView<AnggaranPageController> {
  const AnggaranPageView({super.key});

  String formatCurrency(int amount) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return formatter.format(amount);
  }

  Color _getColorForCategory(String category) {
    switch (category) {
      case 'Gaji':
        return Colors.green;
      case 'Makanan':
        return Colors.red;
      case 'Transportasi':
        return Colors.orange;
      case 'Kesehatan':
        return Colors.purple;
      case 'Hiburan':
        return Colors.lightBlueAccent;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomText(
                  text: "Anggaran",
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                const Spacer(),
                CustomText(
                  text: "Atur Anggaranmu",
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                if (controller.anggaranList.isEmpty) {
                  return ListView(
                    children: [
                      Image.asset(
                        'assets/images/budgeting.png',
                        width: 250,
                        height: 250,
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Column(
                          children: [
                            CustomText(
                              text: "Anggaran Tidak Ditemukan",
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                            const SizedBox(height: 10),
                            CustomText(
                              text: "Yuk mulai atur anggaranmu",
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton.icon(
                              onPressed: () {
                                Get.defaultDialog(
                                  title: "Tambah Anggaran",
                                  content: AddAnggaranForm(),
                                );
                              },
                              icon: const Icon(Icons.add,
                                  color: Colors.lightBlueAccent),
                              label: const Text(
                                'Atur Anggaranmu',
                                style: TextStyle(color: Colors.lightBlueAccent),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                elevation: 2,
                                side: const BorderSide(
                                    color: Colors.lightBlueAccent),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                } else {
                  final total = controller.anggaranList.fold<int>(
                    0,
                    (sum, item) => sum + item.jumlah,
                  );

                  return ListView(
                    children: [
                      const Center(
                        child: Text(
                          "Distribusi Anggaran",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 220,
                        child: PieChart(
                          PieChartData(
                            centerSpaceRadius: 50,
                            sectionsSpace: 2,
                            sections: controller.anggaranList.map((item) {
                              final percent = total == 0
                                  ? 0
                                  : (item.jumlah / total * 100)
                                      .toStringAsFixed(1);
                              final color = _getColorForCategory(item.nama);
                              return PieChartSectionData(
                                value: item.jumlah.toDouble(),
                                title: "${item.nama}\n$percent%",
                                color: color,
                                radius: 50,
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
                      const SizedBox(height: 24),
                      ...controller.anggaranList.map((item) {
                        return Card(
                          color: Colors.lightBlueAccent.withOpacity(0.15),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 4),
                          child: ListTile(
                            leading: const Icon(Icons.monetization_on,
                                color: Colors.blue),
                            title: Text(
                              item.nama,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              formatCurrency(item.jumlah),
                              style: const TextStyle(color: Colors.black54),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                controller.deleteAnggaran(item.id!);
                              },
                            ),
                            onTap: () {
                              Get.defaultDialog(
                                title: "Edit Anggaran",
                                content: AddAnggaranForm(editData: item),
                              );
                            },
                          ),
                        );
                      }).toList(),
                    ],
                  );
                }
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.defaultDialog(
            title: "Tambah Anggaran",
            content: AddAnggaranForm(),
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
