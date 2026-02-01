import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  final String fontFamily;
  final int maxLines;
  final TextOverflow overflow;

  const AppText(
      this.text, {
        super.key,
        this.fontSize = 14,
        this.fontWeight = FontWeight.w400,
        this.color = Colors.black,
        this.textAlign = TextAlign.start,
        this.fontFamily = 'Poppins',
        this.maxLines = 2,
        this.overflow = TextOverflow.ellipsis,
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: fontFamily,
      ),
    );
  }
}
