import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:moni_clone/utils/BorderButton.dart';
import 'package:moni_clone/utils/BottomBorderButton.dart';
import 'package:moni_clone/utils/CustomText.dart';

import '../controllers/akun_page_controller.dart';

class AkunPageView extends GetView<AkunPageController> {
  const AkunPageView({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the current Firebase user
    final user = FirebaseAuth.instance.currentUser;
    final photoURL = user?.photoURL;
    final displayName = user?.displayName ?? 'No Name';
    final email = user?.email ?? 'No Email';
    final initial = displayName.isNotEmpty
        ? displayName[0].toUpperCase()
        : (email.isNotEmpty ? email[0].toUpperCase() : '?');

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: const Row(
                children: [
                  CustomText(
                    text: "Akun",
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  Spacer(),
                  CustomText(
                    text: "Versi 1.3.0(1) (Clone)",
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Column(
                    children: [
                      // Avatar
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.green[900],
                        backgroundImage:
                            photoURL != null ? NetworkImage(photoURL) : null,
                        child: photoURL == null
                            ? Text(
                                initial,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(height: 20),
                      // Display Name and Email
                      CustomText(
                        text: displayName,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      CustomText(
                        text: email,
                        color: Colors.grey,
                        fontSize: 12,
                      ),

                      BorderButton(
                        label: "Akses Bank & E-wallet",
                        onPressed: () {},
                        leadingIcon: Icons.shield_outlined,
                      ),

                      const SizedBox(height: 20),
                      const Row(
                        children: [
                          SizedBox(width: 25),
                          CustomText(
                            text: "Pengaturan Fitur",
                            color: Colors.black87,
                            fontSize: 12,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      BorderButton(
                        label: "Dompet",
                        onPressed: () {},
                        leadingIcon: Icons.account_balance_wallet_rounded,
                      ),
                      BottomBorderButton(
                        label: "Kategori",
                        onPressed: () {},
                        leadingIcon: Icons.category,
                      ),
                      BottomBorderButton(
                        label: "Atur Periode Pencatatan",
                        onPressed: () {},
                        leadingIcon: Icons.date_range,
                      ),

                      const SizedBox(height: 20),
                      const Row(
                        children: [
                          SizedBox(width: 25),
                          CustomText(
                            text: "Lainnya",
                            color: Colors.black87,
                            fontSize: 12,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      BorderButton(
                        label: "FAQ",
                        onPressed: () {},
                        leadingIcon: Icons.help,
                      ),
                      BottomBorderButton(
                        label: "Kirim Saran",
                        onPressed: () {},
                        leadingIcon: Icons.chat_rounded,
                      ),
                      BottomBorderButton(
                        label: "Berikan Review",
                        onPressed: () {},
                        leadingIcon: Icons.star,
                      ),
                      BorderButton(
                        label: "Hapus Akun",
                        onPressed: () {},
                        leadingIcon: Icons.delete,
                      ),

                      BottomBorderButton(
                        label: "Logout",
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          Get.offAllNamed(
                              '/login-page'); // Just a simple logout function fore the icing on the cake
                        },
                        leadingIcon: Icons.power_settings_new_sharp,
                        iconColor: Colors.red,
                        textColor: Colors.red,
                      ),

                      const SizedBox(height: 40),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
