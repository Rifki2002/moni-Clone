import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moni_clone/utils/CustomText.dart';

import '../controllers/anggaran_page_controller.dart';

class AnggaranPageView extends GetView<AnggaranPageController> {
  const AnggaranPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                CustomText(
                  text: "Anggaran",
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                Spacer(),
                CustomText(
                  text: "Atur Anggaranmu",
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.w600,
                  fontSize: 11,
                ),
              ], //Page Header
            ),
            Expanded(
                //Dynamic scrollable section
                child: ListView(
              children: [
                Image.asset(
                  'assets/images/budgeting.png',
                  width: 250,
                  height: 250,
                ),
                CustomText(
                  text: "Anggaran Tidak Ditemukan",
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "Yuk mulai atur anggaranmu",
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 8,
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center, // or center if needed
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints.tightFor(width: 150, height: 40),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        padding: EdgeInsets.zero,
                        side:
                            BorderSide(width: 1, color: Colors.lightBlueAccent),
                        foregroundColor: Colors.lightBlueAccent,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Center(
                        child: CustomText(
                          text: 'Atur Anggaranmu',
                          color: Colors.lightBlueAccent,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
