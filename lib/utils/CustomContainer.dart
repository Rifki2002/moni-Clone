import 'package:flutter/material.dart';
import 'package:moni_clone/utils/CustomText.dart';

class CustomContainer extends StatelessWidget {
  final String text1;
  final String text2;
  final IconData icon;
  final double? width;
  final Color color1;
  final Color color2;
  final Color bgcolor;
  final bool useOutline;
  final Color outlineColor;

  const CustomContainer({
    super.key,
    this.text1 = "Default",
    this.text2 = "Default",
    required this.icon,
    this.width,
    this.color1 = Colors.grey,
    this.color2 = Colors.black,
    this.bgcolor = Colors.black12,
    this.useOutline = false,
    this.outlineColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: bgcolor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: useOutline ? Border.all(color: outlineColor, width: 1.5) : null,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: text1,
                  color: color1,
                ),
                CustomText(
                  text: text2,
                  color: color2,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
