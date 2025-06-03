import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moni_clone/utils/BorderButton.dart';
import 'package:moni_clone/utils/BottomBorderButton.dart';
import 'package:moni_clone/utils/CustomText.dart';

import '../controllers/akun_page_controller.dart';

class AkunPageView extends GetView<AkunPageController> {
  const AkunPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              //Scrollable Section
              child: ListView(children: [
                Container(
                  child: Column(
                    children: [
                      CircleAvatar(
                        //Avatar Display
                        radius: 30,
                        backgroundColor: Colors.green[900],
                        child: const Text(
                          'G',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text: "Gandhi Sudrajat",
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      CustomText(
                        text: "Gandhi2002@Gmail.com",
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                      BorderButton(
                        label: "Akses Bank & E-wallet",
                        onPressed: () {},
                        leadingIcon: Icons.shield_outlined,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          CustomText(
                            text: "Pengaturan Fitur",
                            color: Colors.black87,
                            fontSize: 12,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
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
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          CustomText(
                            text: "Lainnya",
                            color: Colors.black87,
                            fontSize: 12,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
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
                        onPressed: () {},
                        leadingIcon: Icons.power_settings_new_sharp,
                        iconColor: Colors.red,
                        textColor: Colors.red,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
