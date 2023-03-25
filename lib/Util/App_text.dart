import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  String text;
  FontWeight fontWeight;
  double fontSize;
  Color color;
  TextAlign textAlign;
  String fontFamily;
  AppText(
      {super.key,
      this.text = "Hello World",
      this.textAlign = TextAlign.left,
      this.fontWeight = FontWeight.w300,
      this.fontFamily = "Tuli",
      this.fontSize = 18,
      this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            fontFamily: fontFamily));
  }
}
