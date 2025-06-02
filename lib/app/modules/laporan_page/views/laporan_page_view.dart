import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moni_clone/utils/CustomText.dart';
import '../controllers/laporan_page_controller.dart';

class LaporanPageView extends GetView<LaporanPageController> {
  const LaporanPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Laporan",
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        TextButton(
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.lightBlueAccent),
                            onPressed: () {},
                            child: const Text("Bulanan")),
                        const SizedBox(width: 10),
                        TextButton(
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.black),
                            onPressed: () {},
                            child: const Text("Tahunan")),
                        TextButton(
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.black),
                            onPressed: () {},
                            child: const Text("Pilih Tanggal")),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.chevron_left),
                        const SizedBox(width: 5),
                        Column(
                          children: const [
                            Text("Juni 2025",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            Text("1 Jun 25 - 30 Jun 25"),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Total Pemasukan"),
                        Text("Rp0", style: TextStyle(color: Colors.blue)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Total Pengeluaran"),
                        Text("Rp0", style: TextStyle(color: Colors.orange)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Selisih"),
                        Text("Rp0"),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    const TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.cyan,
                      tabs: [
                        Tab(text: 'Pengeluaran'),
                        Tab(text: 'Pemasukan'),
                      ],
                    ),
                    Container(
                      height: 350,
                      child: const TabBarView(
                        children: [
                          EmptyTransactionView(),
                          EmptyTransactionView(), //calls the class to be shown in each tabs
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//This is the empty transaction view that is used for the "Pengeluaran"
//and "Pemasukan" tabs, and the tabs will stay just like this because i will
//not be doing anything to this page...for practice only
class EmptyTransactionView extends StatelessWidget {
  const EmptyTransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Image.asset(
          'assets/images/budgeting.png', // Image location
          height: 200,
        ),
        const SizedBox(height: 20),
        const Text(
          "Kamu tidak memiliki transaksi di periode ini",
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        const Text(
          "Mohon ulangi pencarian di periode yang berbeda",
          style: TextStyle(color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
