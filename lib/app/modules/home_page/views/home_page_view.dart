import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moni_clone/utils/CustomContainer.dart';
import 'package:moni_clone/utils/CustomText.dart';

import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      body: SafeArea(
        child: Column(
          children: [
            // 🔵 Fixed Header Section
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  const Icon(Icons.account_circle_rounded, color: Colors.white),
                  const SizedBox(width: 10),
                  Text(
                    'Selamat Datang, Gandhi',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Kirim Saran',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Icon(Icons.wallet, color: Colors.white),
                ],
              ),
            ),

            // ⚪️ Scrollable Content Section
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'Pengeluaran Mei 2025'),
                        CustomText(
                          text: "Rp 0",
                          color: Colors.deepOrange,
                          fontSize: 40,
                        ),
                        Row(
                          children: [
                            CustomContainer(
                              icon: Icons.wallet,
                              text1: 'Total Saldo',
                              color1: Colors.grey,
                              text2: 'Rp 0',
                              color2: Colors.black,
                              width: 170,
                            ),
                            const Spacer(),
                            CustomContainer(
                              icon: Icons.circle_outlined,
                              text1: 'Anggaran',
                              color1: Colors.grey,
                              text2: 'Rp 0',
                              color2: Colors.black,
                              width: 170,
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            CustomText(
                              text: 'Transaksi Terbaru',
                              color: Colors.black,
                            ),
                            const Spacer(),
                            CustomText(
                              text: 'Lihat Semua',
                              color: Colors.blue,
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            decoration: BoxDecoration(color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Center(
                                    child: Image.asset(
                                      'assets/images/bank.png',
                                      width: 150,
                                      height: 200,
                                    ),
                                  ),
                                  CustomText(
                                    text:
                                        'Kamu Belum Memiliki Transaksi Di Bulan ini',
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(height: 10),
                                  CustomText(
                                    text:
                                        'Belum ada notifikasi yang terdeteksi di bulan ini. kamu bisa mulai melakukan pencatatan manual',
                                    fontSize: 12,
                                    textalign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 10),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18, vertical: 12),
                                    ),
                                    child: const CustomText(
                                      text: 'Tambah Transaksi',
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            CustomText(
                              text: 'Transaksi Terbaru',
                              color: Colors.black,
                            ),
                            const Spacer(),
                            CustomText(
                              text: 'Lihat Semua',
                              color: Colors.blue,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              CustomContainer(
                                width: 150,
                                icon: Icons.account_balance_rounded,
                                text1: 'Cash',
                                color1: Colors.black,
                                text2: 'Rp 0',
                                color2: Colors.blue,
                                bgcolor: Colors.white,
                                useOutline: true,
                                outlineColor: Colors.black12,
                              ),
                              const SizedBox(width: 20),
                              CustomContainer(
                                width: 150,
                                icon: Icons.account_balance_rounded,
                                text1: 'BCA',
                                color1: Colors.black,
                                text2: 'Rp 0',
                                color2: Colors.blue,
                                bgcolor: Colors.white,
                                useOutline: true,
                                outlineColor: Colors.black12,
                              ),
                              const SizedBox(width: 20),
                              CustomContainer(
                                width: 150,
                                icon: Icons.account_balance_rounded,
                                text1: 'Mandiri',
                                color1: Colors.black,
                                text2: 'Rp 0',
                                color2: Colors.blue,
                                bgcolor: Colors.white,
                                useOutline: true,
                                outlineColor: Colors.black12,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            CustomText(
                              text: 'Anggaran',
                              color: Colors.black,
                            ),
                            const Spacer(),
                            CustomText(
                              text: 'Lihat Semua',
                              color: Colors.blue,
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            decoration: BoxDecoration(color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Center(
                                    child: Image.asset(
                                      'assets/icons/moneybag.png',
                                      width: 30,
                                      height: 30,
                                    ),
                                  ),
                                  CustomText(
                                    text: 'Kamu Belum Memiliki ANggaran',
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(height: 10),
                                  CustomText(
                                      text: 'Atur Sekarang',
                                      fontSize: 12,
                                      textalign: TextAlign.center,
                                      color: Colors.lightBlueAccent),
                                  SizedBox(
                                    height: 40,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Column(
                            children: [
                              CustomText(
                                text:
                                    "Hi Kak! Terima kasih telah menggunakan Moni",
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Punya Saran? ",
                                    style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text(
                                    "Klik Disini ",
                                    style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.lightBlueAccent),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
