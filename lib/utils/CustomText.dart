import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textalign;

  const CustomText({
    super.key,
    this.text = 'Default text',
    this.fontSize = 14,
    this.fontWeight = FontWeight.w600,
    this.color = Colors.grey,
    this.textalign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textalign,
      text,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
